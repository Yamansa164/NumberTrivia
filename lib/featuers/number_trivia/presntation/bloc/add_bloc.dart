import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:tdd/featuers/number_trivia/presntation/bloc/number_trivia_bloc.dart';

class AddBloc extends Bloc<Plus, AddSuccess> {

  int num=1;
  AddBloc(): super(AddSuccess()){
    on<Plus>((event, emit) {
num++;
emit(AddSuccess());
      
    });
  }
  


}
