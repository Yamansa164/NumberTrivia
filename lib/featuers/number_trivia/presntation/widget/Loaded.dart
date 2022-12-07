import 'package:flutter/material.dart';

import '../../domain/entities/number_trivia.dart';
class TriviaWidget extends StatelessWidget {
  NumberTrivia numberTrivia;
  TriviaWidget({
    required this.numberTrivia,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Text(
              numberTrivia.number.toString(),
              style: const TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
            SingleChildScrollView(
              child: Center(
                child: Text(
                  numberTrivia.text,
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
