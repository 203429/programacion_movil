import 'package:flutter/material.dart';
import 'package:my_first_app/pages/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actividad Login")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(hintText: ('email')),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(hintText: ('password')),
                    ),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    onPressed: () {},
                    child: const Text('Log In'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      child: const Text('Create an account'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 550),
      //     child: SizedBox(
      //       height: double.infinity,
      //       width: double.infinity,
      //       child: Padding(
      //         padding: const EdgeInsets.only(left: 20, right: 20),
      //         child: Column(
      //           children: const [
      //             Padding(
      //               padding: EdgeInsets.only(bottom: 20),
      //               child: TextField(
      //                 decoration: InputDecoration(hintText: ('email')),
      //               ),
      //             ),
      //             TextField(
      //               decoration: InputDecoration(hintText: ('password')),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
