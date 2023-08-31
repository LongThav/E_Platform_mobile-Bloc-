import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/models/home_models/skill_develop_model.dart';
import 'package:mobile/services/home_service.dart';

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
  }
}