import 'package:tdd/core/network/network_info.dart';
import 'package:tdd/featuers/number_trivia/data/datasources/local_data_source.dart';
import 'package:tdd/featuers/number_trivia/data/datasources/remote_data_source.dart';
import 'package:tdd/featuers/number_trivia/data/models/number_trivia_model.dart';
import 'package:tdd/featuers/number_trivia/domain/entities/number_trivia.dart';

import 'package:tdd/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../domain/repositories/number_trivia_repository.dart';

class NumberTreviaRepositoryImpl implements NumberTreviaRepository {  
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  NumberTreviaRepositoryImpl(
      {required this.localDataSource,
      required this.networkInfo,
      required this.remoteDataSource});
  @override
  Future<Either<Failuer, NumberTrivia>> getConcreteNumberTrivie(
      int number) async {
    return _getTrivia(() {
      return remoteDataSource.getConcreteNumberTrivie(number);
    });
  }

  @override
  Future<Either<Failuer, NumberTrivia>> getRandomNumberTrivie() async {
    return _getTrivia(() {
      return remoteDataSource.getRandomNumberTrivie();
    });
  }

  Future<Either<Failuer, NumberTrivia>> _getTrivia(
      Future<NumberTriviaModel> Function() getNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final NumberTriviaModel remotedata = await getNumber();
        localDataSource.saveToCache(remotedata);
        return Right(remotedata);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final NumberTriviaModel localData =
            await localDataSource.getLastNumbertrivia();

        return Right(localData);
      } on LocalException {
        return Left(LocalFailure());
      }
    }
  }
}
