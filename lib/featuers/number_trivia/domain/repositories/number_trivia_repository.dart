import 'package:dartz/dartz.dart';
import 'package:tdd/core/error/failures.dart';
import 'package:tdd/featuers/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTreviaRepository {
  Future<Either<Failuer, NumberTrivia>> getConcreteNumberTrivie(int number);
  Future<Either<Failuer, NumberTrivia>> getRandomNumberTrivie();
}
