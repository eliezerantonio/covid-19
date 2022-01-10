import 'package:covid_19_cases/models/user.dart';
import 'package:covid_19_cases/providers/user_provider.dart';
import 'package:covid_19_cases/utils/alert_dialog.dart';
import 'package:covid_19_cases/ui/screens/shared/screen/login_screen/widgets/custom_textfield.dart';
import 'package:covid_19_cases/ui/screens/home_screen.dart';
import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:covid_19_cases/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/js.dart';

class Forms extends StatefulWidget {
  Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
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
        Consumer<UserProvider>(builder: (_, user, __) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 1500),
            alignment: user.loading ? Alignment.center : Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                _onClickLogin(context);
              },
              child: AnimatedContainer(
                width: !user.loading ? 400 : 44,
                height: !user.loading ? 44 : 44,
                alignment: Alignment.center,
                child: !user.loading
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
          );
        }),
      ],
    );
  }

  void _onClickLogin(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    if (!validateCrentials(email, password, context)) return;
    FocusScope.of(context).unfocus();

    final user = User()
      ..email = email
      ..password = password;

    context.read<UserProvider>().login(user).then(
      (ok) {
        if (ok) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        } else {
          alertDialog(
            context,
            "Credenciais não conferem",
          );
        }
      },
    );
  }
}
