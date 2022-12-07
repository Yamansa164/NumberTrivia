part of 'number_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();

  @override
  List<Object> get props => [];
}

class Empty extends NumberTriviaState {}

class Loding extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  const Loaded({required this.trivia});
  @override
  List<Object> get props => [trivia];
}

class Erorr extends NumberTriviaState {
  final String message;

  const Erorr({required this.message});
  @override
  List<Object> get props => [message];
}

class AddSuccess {}
