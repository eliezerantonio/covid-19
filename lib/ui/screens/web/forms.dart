import 'package:covid_19_cases/utils/alert_dialog.dart';
import 'package:covid_19_cases/ui/screens/custom_textfield.dart';
import 'package:covid_19_cases/ui/screens/home_screen.dart';
import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:covid_19_cases/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/js.dart';

class Forms extends StatefulWidget {
  Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _focusPassword = FocusNode();

  bool isLoading = false;

  //controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email"),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          controller: emailController,
        ),
        const SizedBox(
          height: 22,
        ),
        const Text('Password'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          controller: passwordController,
          password: true,
        ),
        const SizedBox(
          height: 25,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 1500),
          alignment: isLoading ? Alignment.center : Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              _onClickLogin(context);
            },
            child: AnimatedContainer(
              width: !isLoading ? 400 : 44,
              height: !isLoading ? 44 : 44,
              alignment: Alignment.center,
              child: !isLoading
                  ? const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )
                  : const CircularProgressIndicator(),
              decoration: BoxDecoration(
                  color: Color(MyColors.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              duration: const Duration(milliseconds: 1300),
            ),
          ),
        ),
      ],
    );
  }

  void _onClickLogin(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (!validateCrentials(email, password, context)) return;
    if (email == "digistarts@gmail.com" && password == "Digistarts") {
      setState(() {
        isLoading = true;
      });
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      });
    } else {
      alertDialog(
        context,
        "Credenciais não conferem",
      );
    }
  }
}
