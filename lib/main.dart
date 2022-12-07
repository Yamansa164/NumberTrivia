import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tdd/di.dart';

import 'core/bloc/blocobserver.dart';
import 'featuers/number_trivia/presntation/pages/number_trivia_page.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),
      home: NumberTriviaPage(),
    );
  }
}
