import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logics/home_logic.dart';

import '../../../utils/constants/color_app.dart';

class HomeCheckOutView extends StatefulWidget {
  final String title;
  final int id;
  const HomeCheckOutView({super.key, required this.title, required this.id});

  @override
  State<HomeCheckOutView> createState() => _HomeCheckOutViewState();
}

class _HomeCheckOutViewState extends State<HomeCheckOutView> {
  @override
  void initState() {
    context.read<HomeLogic>().add(ReadSkillByIdEvent(id: widget.id));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorView,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorsApp.colorView,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey,)
        ),
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(
          color: Colors.grey[700]
        ),),
      ),
      body: BlocBuilder<HomeLogic, HomeState>(
        builder: (context, state){
          if(state is HomeInitializeState || state is HomeLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is HomeErrorState){
            String err = state.error;
            return Center(child: Text(err),);
          }else if(state is ReadSkillByIdState){
            return Center(child: Text("Done"),);
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
