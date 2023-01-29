import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentePage = 0;
  List<Map<String, String>> listBoarding = [
    {"titulo": "Cualquier dato :D", "imagen": ""},
    {"titulo": "Titulo 1", "imagen": ""},
    {"titulo": "Titulo 2", "imagen": ""},
    {"titulo": "Titulo 3", "imagen": ""}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: const [
        Expanded(
          flex: 2,
          child: Text(
            "Flex 2",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            "Flex 2",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: OutlinedButton(
              onPressed: null,
              child: Text('Button'),
            ),
          ),
        ),
      ]),
    );
  }
}
