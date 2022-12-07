import 'package:dartz/dartz.dart';
import 'package:tdd/core/error/failures.dart';
import 'package:tdd/core/usecase/usecase.dart';
import 'package:tdd/featuers/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/featuers/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivie  extends usecase<int,NumberTrivia>{
 final NumberTreviaRepository _repository;
  GetConcreteNumberTrivie(this._repository);
  
  @override
  Future<Either<Failuer, NumberTrivia>> call({required int input}) {
    return _repository.getConcreteNumberTrivie(input);
  }
 
}