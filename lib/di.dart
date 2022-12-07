import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd/core/network/network_info.dart';
import 'package:tdd/core/util/input_converter.dart';
import 'package:tdd/featuers/number_trivia/data/datasources/local_data_source.dart';
import 'package:tdd/featuers/number_trivia/data/datasources/remote_data_source.dart';
import 'package:tdd/featuers/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:tdd/featuers/number_trivia/domain/usecases/get_concrete_number_trivie_usecase.dart';
import 'package:tdd/featuers/number_trivia/domain/usecases/get_random_number_trivia_usecase.dart';
import 'package:tdd/featuers/number_trivia/presntation/bloc/number_trivia_bloc.dart';

import 'featuers/number_trivia/domain/repositories/number_trivia_repository.dart';

final GetIt instance = GetIt.instance;
Future<void> init() async {
  //bloc
  instance.registerFactory<NumberTriviaBloc>(() => NumberTriviaBloc(
      getConcreteNumberTrivie: instance(),
      getRandomNumberTrivie: instance(),
      inputConverter: instance()));

  /// usecase
  instance.registerLazySingleton<GetConcreteNumberTrivie>(
      () => GetConcreteNumberTrivie(instance()));
  instance.registerLazySingleton<GetRandomNumberTrivie>(
      () => GetRandomNumberTrivie(instance()));

  // core
  instance.registerLazySingleton<InputConverter>(() => InputConverter());
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: instance()));

  // repository
  instance.registerLazySingleton<NumberTreviaRepository>(() =>
      NumberTreviaRepositoryImpl(
          localDataSource: instance(),
          networkInfo: instance(),
          remoteDataSource: instance()));

  // datasource
  instance
      .registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: instance()));

  /// external
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  instance.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
}
