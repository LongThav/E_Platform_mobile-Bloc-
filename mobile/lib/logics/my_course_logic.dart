import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/models/course/list_course_model.dart';
import 'package:mobile/services/my_course_service.dart';

abstract class MyCourseState{}
abstract class MyCourseEvent{}

class InitializeState extends MyCourseState{}
class LoadingState extends MyCourseState{}
class ErrorState extends MyCourseState{
  final String error;
  ErrorState({required this.error});
}

class ReadMyCourseStateSuccess extends MyCourseState{
  final CourseModel courseModel;
  ReadMyCourseStateSuccess({required this.courseModel});
}
class ReadMyCourseEvent extends MyCourseEvent{}

class MyCourseLogic extends Bloc<MyCourseEvent, MyCourseState>{
  final MyCourseService _courseService;
  MyCourseLogic(this._courseService) : super(InitializeState()){
    on<ReadMyCourseEvent>((event, emit)async{
      emit(LoadingState());
      await _courseService.readCourseService().then((value){
        emit(ReadMyCourseStateSuccess(courseModel: value));
      }).onError((error, stackTrace){
        emit(ErrorState(error: error.toString()));
      });
    });
  }
}