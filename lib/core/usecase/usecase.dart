import 'package:dartz/dartz.dart';
import 'package:tdd/core/error/failures.dart';

abstract class usecase<In,Out>{
  Future<Either<Failuer,Out>> call ({required In input});

}