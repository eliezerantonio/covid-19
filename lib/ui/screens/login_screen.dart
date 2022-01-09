import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:flutter/material.dart';

import 'web/forms.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(child: (size.width > 559) ? web(size) : mobile(size)),
    );
  }

  Widget mobile(size) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  child: SizedBox(
                    width: 400,
                    height: 500,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Bem vindo',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black45),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 36,
                                    color: Color(MyColors.primaryColor)),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Forms(),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget web(size) {
    return Row(
      children: [
        Container(
          color: Color(MyColors.primaryColor),
          width: size.width * 0.4,
          child: Center(child: Image.asset("assets/virus.gif")),
        ),
        Container(
          width: size.width * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 8,
                child: Container(
                  margin: const EdgeInsets.all(25.0),
                  width: 400,
                  height: 500,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Bem vindo',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black45),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 36,
                                color: Color(MyColors.primaryColor)),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Forms(),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
