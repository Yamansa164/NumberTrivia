
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MessageWidget extends StatelessWidget {
  String text;
  String lottie;
  MessageWidget({
    required this.text,
    required this.lottie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Lottie.asset('json/$lottie.json',
                height: MediaQuery.of(context).size.height / 5),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  text,
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
