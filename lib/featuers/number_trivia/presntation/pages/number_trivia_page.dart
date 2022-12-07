import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tdd/di.dart';
import 'package:tdd/featuers/number_trivia/presntation/widget/getTrivia.dart';

import '../../domain/entities/number_trivia.dart';
import '../bloc/number_trivia_bloc.dart';
import '../widget/Loaded.dart';

import '../widget/message.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Number Trivia'),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (_) => instance<NumberTriviaBloc>(),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
              
              builder: (context, state) {
                print('da');
               
               
                if (state is Loding) {
                 return  MessageWidget(
                    text: 'Loading',
                    lottie: 'loading',
                  );
                } else if (state is Loaded) {
                  return TriviaWidget(
                    numberTrivia: state.trivia,
                  );
                } else if (state is Erorr) {
                  return MessageWidget(
                    text: state.message,
                    lottie: 'error',
                  );
                }
                
                return MessageWidget(
                  text: 'Start Searching',
                  lottie: 'empty',
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            GetTriviaWidget(),
          ]),
        ));
  }

}


