import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/models/home_models/skill_develop_model.dart';
import 'package:mobile/services/home_service.dart';
import 'package:mobile/utils/rests/logger.dart';

import '../models/home_models/skill_develop_by_id_model.dart';

abstract class HomeState{}
abstract class HomeEvent{}

class HomeInitializeState extends HomeState{}

class HomeErrorState extends HomeState{
  final String error;
  HomeErrorState({required this.error});
}

class HomeLoadingState extends HomeState{}

class ReadSkillState extends HomeState{
  final SkillDevModel skillDevModel;
  ReadSkillState({required this.skillDevModel});
}

class ReadSkillEvent extends HomeEvent{}

class ReadSkillByIdState extends HomeState{
  final SkillDevByIdModel skillDevByIdModel;
  ReadSkillByIdState({required this.skillDevByIdModel});
}

class ReadSkillByIdEvent extends HomeEvent{
  final int id;
  ReadSkillByIdEvent({required this.id});
}

class HomeLogic extends Bloc<HomeEvent, HomeState>{
  final HomeService _homeService;
  HomeLogic(this._homeService) : super(HomeInitializeState()){

    on<ReadSkillEvent>((event, emit)async{
      emit(HomeLoadingState());
      await _homeService.readSkillDevService().then((value){
        emit(ReadSkillState(skillDevModel: value));
      }).onError((error, stackTrace){
        emit(HomeErrorState(error: error.toString()));
      });
    });
    
    on<ReadSkillByIdEvent>((event, emit)async{
      emit(HomeLoadingState());
      await _homeService.readSkillDevByIdService(event.id).then((value){
        emit(ReadSkillByIdState(skillDevByIdModel: value));
      }).onError((error, stackTrace){
        emit(HomeErrorState(error: error.toString()));
      });
    });
  }
}