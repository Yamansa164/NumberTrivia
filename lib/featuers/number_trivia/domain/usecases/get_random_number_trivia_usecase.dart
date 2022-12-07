import 'package:tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tdd/core/usecase/usecase.dart';
import 'package:tdd/featuers/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/featuers/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivie extends usecase<void,NumberTrivia>{
  NumberTreviaRepository _repository;
GetRandomNumberTrivie(this._repository);
  @override
  Future<Either<Failuer, NumberTrivia>> call({required void input})async {
   return await _repository.getRandomNumberTrivie();
  }

}