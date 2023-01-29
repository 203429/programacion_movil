import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actividad Register")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                            hintText: ('Last Name'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('First Name'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('Username'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('Password'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('Confirm Password'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: ('Year'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: ('Gender'),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                          ),
                          onPressed: () {},
                          child: const Text('Register'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Already have an account'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
