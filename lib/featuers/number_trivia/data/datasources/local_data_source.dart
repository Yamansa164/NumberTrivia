import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd/core/error/exception.dart';
import 'package:tdd/featuers/number_trivia/data/models/number_trivia_model.dart';

abstract class LocalDataSource {
  Future<NumberTriviaModel> getLastNumbertrivia();
  Future<void> saveToCache(NumberTriviaModel numberTreviaModel);
}

const Cache_Key = 'Cache_Key';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<NumberTriviaModel> getLastNumbertrivia() {
   final String? jsonString = sharedPreferences.getString(Cache_Key);
   if(jsonString==null){
    throw LocalException();

   }
   else {
    return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
   }
  }

  @override
  Future<void> saveToCache(NumberTriviaModel numberTreviaModel) {
    return sharedPreferences.setString(
        Cache_Key, json.encode(numberTreviaModel.toJson()));
  }
}
