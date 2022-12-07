import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd/featuers/number_trivia/presntation/bloc/add_bloc.dart';

import '../bloc/number_trivia_bloc.dart';

class GetTriviaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          // ignore: unnecessary_const
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'input a number',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  searchButton(controller, context);
                },
                child: Container(
                  color: Theme.of(context).primaryColor,
                  height: 50,
                  child: const Center(
                      child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  randomButton(context);
                },
                child: Container(
                  color: Theme.of(context).primaryColor,
                  height: 50,
                  child: const Center(
                      child: Text(
                    'get randon trivia',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        BlocProvider(
          create: (context) => AddBloc(),
          child: BlocBuilder<AddBloc, AddSuccess>(
            builder: (context, state) {
              print('dsadsads');
              return GestureDetector(
                  child: Text(
                    BlocProvider.of<AddBloc>(context)
                        .num
                        .toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {
                    BlocProvider.of<AddBloc>(context).add(Plus());
                  });
            },
          ),
        )
      ],
    );
  }

  void searchButton(
      TextEditingController controller, BuildContext context) async {
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaConcreteNumber(controller.text));
    controller.clear();
  }

  void randomButton(BuildContext context) async {
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaRandomNumber());
  }
}
