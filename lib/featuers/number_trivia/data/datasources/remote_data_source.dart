import 'dart:convert';

import 'package:tdd/core/error/exception.dart';
import 'package:tdd/featuers/number_trivia/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivie(int number);
  Future<NumberTriviaModel> getRandomNumberTrivie();
}

class RemoteDataSourceImpl extends RemoteDataSource {
 

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivie(int number) async {
    return _getTriviaNumberFromApi('http://numbersapi.com/$number');
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivie() async {
    return _getTriviaNumberFromApi('http://numbersapi.com/random');
  }

  Future<NumberTriviaModel> _getTriviaNumberFromApi(String url) async {
    final http.Response response = await http.get(Uri.parse(url), headers: {
      'content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
