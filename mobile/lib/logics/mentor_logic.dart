import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/models/all_user_model.dart';

import '../services/mentor_service.dart';

abstract class MentorState{}
abstract class MentorEvent{}

class InitializeState extends MentorState{}
class LoadingState extends MentorState{}
class ErrorState extends MentorState{
  final String error;
  ErrorState({required this.error});
}

class FetchingAllUserState extends MentorState{
  final AllUserModel allUserModel;
  FetchingAllUserState({required this.allUserModel});
}
class FetchingAllUserEvent extends MentorEvent{}

class MentorLogic extends Bloc<MentorEvent, MentorState>{
  final MentorService _mentorService;
  MentorLogic(this._mentorService):super(InitializeState()){
    on<FetchingAllUserEvent>((event, emit)async{
      emit(LoadingState());
      await _mentorService.fetchAllUserService().then((value){
        emit(FetchingAllUserState(allUserModel: value));
      }).onError((error, stackTrace){
        emit(ErrorState(error: error.toString()));
      });
    });
  }
}