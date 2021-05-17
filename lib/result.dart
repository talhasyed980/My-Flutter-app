import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You Did It Awesome!';
    } else if (resultScore <= 13) {
      resultText = 'Pretty Likeable!';
    } else if (resultScore <= 17) {
      resultText = 'You Are ... Strange?!';
    } else {
      resultText = 'You Are So Bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
