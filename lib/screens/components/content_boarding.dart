import 'package:flutter/material.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({super.key, this.title, this.subtitle, this.image});
  final String? title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image!,
          width: 250,
          height: 250,
        ),
        Text(
          title!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff591b8a),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
