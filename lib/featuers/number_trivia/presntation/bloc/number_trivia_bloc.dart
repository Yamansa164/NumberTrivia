

import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd/core/util/input_converter.dart';
import 'package:tdd/featuers/number_trivia/domain/usecases/get_concrete_number_trivie_usecase.dart';
import 'package:tdd/featuers/number_trivia/domain/usecases/get_random_number_trivia_usecase.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/number_trivia.dart';
part 'bloc_event.dart';
part 'bloc_state.dart';

const String serverError = 'server error';
const String cacheError = 'cache error';
const String inputInvalid = 'input valid';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  int number = 1;
  GetConcreteNumberTrivie getConcreteNumberTrivie;
  GetRandomNumberTrivie getRandomNumberTrivie;
  InputConverter inputConverter;
  NumberTriviaBloc(
      {required this.getConcreteNumberTrivie,
      required this.getRandomNumberTrivie,
      required this.inputConverter})
      : super(Empty()) {
    // ignore: void_checks
    on<NumberTriviaEvent>((event, emit) async {
      if (event is GetTriviaConcreteNumber) {
        final Either<Failuer, int> inputEither =
            inputConverter.stringToUnsignedInteger(event.numberString);
        inputEither.fold((failuer) async {
          emit(Erorr(message: inputInvalid));
        }, (number) async {
          emit(Loding());

          /// call methode
          final Either<Failuer, NumberTrivia> failuerORsuccess =
              await getConcreteNumberTrivie(input: number);

          _eitherErorrOrLoded(failuerORsuccess);
        });
      } else if (event is GetTriviaRandomNumber) {
        emit(Loding());

        /// call methode
        final Either<Failuer, NumberTrivia> failuerORsuccess =
            await getRandomNumberTrivie(input: Void);

        _eitherErorrOrLoded(failuerORsuccess);
      }
    });
  }

  void _eitherErorrOrLoded(Either<Failuer, NumberTrivia> failuerORsuccess) {
    failuerORsuccess.fold(
      (faliuer) {
        emit(Erorr(message: _mapFaliuerToMessage(faliuer)));
      },
      (trivia) {
        emit(Loaded(trivia: trivia));
      },
    );
  }

  String _mapFaliuerToMessage(Failuer failuer) {
    switch (failuer.runtimeType) {
      case ServerFailure:
        return serverError;
      case LocalFailure:
        return cacheError;
      default:
        return 'Unexpected Error';
    }
  }
}
