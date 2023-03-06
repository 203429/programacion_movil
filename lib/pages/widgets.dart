import 'package:flutter/material.dart';

Future<dynamic> alert(BuildContext context, String title, String content) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<dynamic> alertToView(BuildContext context, String title, String content, String view) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, view);
            },
          ),
        ],
      );
    },
  );
}

Future<dynamic> alertToViewWithParams(BuildContext context, String title, String content, String view, params) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, view, arguments: params);
            },
          ),
        ],
      );
    },
  );
}