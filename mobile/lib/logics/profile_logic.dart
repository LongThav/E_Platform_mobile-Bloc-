import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/db_helpers/cache_profile.dart';
import 'package:mobile/models/auth_models/local_model.dart';
import 'package:mobile/models/profile_model.dart';
import 'package:mobile/services/profie_service.dart';
import 'package:mobile/utils/rests/handle_push_view.dart';
import 'package:mobile/utils/rests/logger.dart';
import 'package:mobile/utils/rests/snack_bar.dart';
import 'package:mobile/views/dashboard_views/profiles/profile_view.dart';

abstract class ProfileState {}

abstract class ProfileEvent {}

class ProfileInitailizeState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState(this.error);
}

class ProfileLoadingDone extends ProfileState {
  final LocalModel localModel;
  ProfileLoadingDone(this.localModel);
}

class ProfileEventFetchingLocal extends ProfileEvent {}

class ProfileAppEvent extends ProfileEvent {}

class ProfileAppState extends ProfileState {
  final String name;
  final String? img;
  final String email;
  final int id;
  ProfileAppState(
      {required this.name, required this.email, this.img, required this.id});
}

class UpdateProfileEvent extends ProfileEvent {
  final String useranme;
  final String email;
  final String image;
  final int id;
  final BuildContext context;
  UpdateProfileEvent(
      this.useranme, this.email, this.image, this.id, this.context);
}

class UpdateProfileLoadingState extends ProfileState {
  bool isLoading = false;
  UpdateProfileLoadingState(this.isLoading);
}

class GetImageState extends ProfileState {
  final File image;
  final String base64;
  GetImageState(this.image, this.base64);
}

class GetStringBase64 extends ProfileState {
  final String imageBase64;
  GetStringBase64(this.imageBase64);
}

class GetImageError extends ProfileState {
  final String err;
  GetImageError(this.err);
}

class GetImageEvent extends ProfileEvent {}

class GetProfileState extends ProfileState {
  final ProfileModel profileModel;
  GetProfileState(this.profileModel);
}

class GetProfileEvent extends ProfileEvent {
  final int id;
  GetProfileEvent(this.id);
}

class ProfileLogic extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService service;
  ProfileLogic(this.service) : super(ProfileInitailizeState()) {
    //read local
    on<ProfileEventFetchingLocal>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        var data = await service.readLocalLogin();
        emit(ProfileLoadingDone(data));
        "fetch done".log();
      } catch (err) {
        "Error in Logic: $err".log;
        emit(ProfileErrorState(err.toString()));
      }
    });

    //update profile
    on<UpdateProfileEvent>((event, emit) async {
      "Start Update".log();
      try {
        ;
        var data = await service.updateProfileService(
            event.useranme, event.email, event.image, event.id);
        if (data != true) {
          emit(UpdateProfileLoadingState(false));
        } else {
          "User update profile successfully".log();
          snackBar(event.context, "User updatate profile successfully");
          event.context.read<ProfileLogic>().add(ProfileAppEvent());
          backView(event.context);
          emit(UpdateProfileLoadingState(true));
        }
      } catch (err) {
        "Error in catch Logic: $err".log();
        emit(UpdateProfileLoadingState(false));
      }
    });

    //pick image
    on<GetImageEvent>((event, emit) async {
      emit(ProfileInitailizeState());
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = File(image.path);
        File img = imageTemp;
        final bytes = File(img.path).readAsBytesSync();
        String base64Image = "data:image/png;base64," + base64Encode(bytes);
        "ImageBase64: ${base64Image}".log();
        emit(GetImageState(img, base64Image));
      } catch (err) {
        emit(GetImageError(err.toString()));
        "Error pick image".log();
      }
    });

    //get profile
    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        var data = await service.getProfileService(event.id);
        emit(GetProfileState(data));
      } catch (err) {
        "Error in logic: $err".log();
        emit(ProfileErrorState(err.toString()));
      }
    });

    //profile
    on<ProfileAppEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        CacheProfile cacheProfile = CacheProfile();
        String name = await cacheProfile.getName();
        String email = await cacheProfile.getEmail();
        String image = await cacheProfile.getImage();
        String id = await cacheProfile.getId();
        int userId = int.parse(id);
        emit(ProfileAppState(name: name, email: email, img: image, id: userId));
      } catch (err) {
        "Error get profile".log();
        emit(ProfileErrorState(err.toString()));
      }
    });
  }
}
