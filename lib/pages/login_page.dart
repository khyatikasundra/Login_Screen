import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widgets_practice_project/pages/account_page.dart';
import 'package:widgets_practice_project/widgets/bottom_line.dart';
import 'package:widgets_practice_project/widgets/card_elevation.dart';
import 'package:widgets_practice_project/pages/create_account_page.dart';
import 'package:widgets_practice_project/widgets/container_text.dart';
import 'package:widgets_practice_project/widgets/custom_scroll_widget.dart';
import 'package:widgets_practice_project/pages/forgot_password_page.dart';
import 'package:widgets_practice_project/widgets/login_button.dart';
import 'package:widgets_practice_project/strings.dart';
import 'package:widgets_practice_project/validation_function.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //svg image
              _backgroundImage(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerText(
                      name: loginString,
                      fontSize: 40,
                      fontWeight: FontWeight.w900),
                  const ContainerText(
                      name: pleaseSignInString,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 121, 120, 120)),
                  _spacer(),
                  _loginForm(context),
                  _spacer(),
                  _loginButton(context)
                ],
              ),
              _bottomLine(context)
            ],
          ),
        ),
      ),
    );
  }

  void _validateForm(BuildContext context) {
    String emailIdPassing = emailController.text;
    String passwordPassing = passwordController.text;
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AccountPage(
                    emailIdGet: emailIdPassing,
                    passwordGet: passwordPassing,
                    confirmPassword: notProvidedString,
                    fullName: notProvidedString,
                  )));
    }
  }

  //! Widget methods
  Widget _backgroundImage() => Align(
        alignment: Alignment.centerRight,
        child: SvgPicture.asset(
          "assets/asset.svg",
          width: 100,
          height: 100,
        ),
      );

  Widget _spacer() => const SizedBox(
        height: 20,
      );
  Widget _loginForm(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            emailCard(),
            _spacer(),
            passwordCard(context),
          ],
        ),
      );

  Widget emailCard() => CardElevation(
        obscureText: false,
        textFieldName: emailString,
        prefixIconGet: const Icon(Icons.email_outlined),
        textInputAction: TextInputAction.next,
        textEditingController: emailController,
        textInputType: TextInputType.emailAddress,
        validator: MyFunctions.emailValidator,
      );

  Widget passwordCard(BuildContext context) => CardElevation(
        textInputAction: TextInputAction.done,
        obscureText: true,
        onEditingComplete: () {
          _validateForm(context);
          FocusScope.of(context).unfocus();
        },
        textInputType: TextInputType.text,
        textFieldName: passwordString,
        prefixIconGet: const Icon(Icons.lock_outlined),
        suffixIcon: Container(
          margin: const EdgeInsets.only(right: 10),
          width: 100,
          child: Align(
              alignment: Alignment.centerRight,
              //forget
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()));
                },
                child: const Text(
                  forgetString,
                  style: TextStyle(color: Color(0xFFF4B14B)),
                ),
              )),
        ),
        textEditingController: passwordController,
        maxLength: 8,
        validator: MyFunctions.passwordValidator,
      );
  Widget _loginButton(BuildContext context) => Align(
        alignment: Alignment.bottomRight,
        child: Container(
            margin: const EdgeInsets.only(right: 35),
            child: LoginButton(
              onPressed: () {
                _validateForm(context);
              },
              text: loginButtonString,
            )),
      );
  Widget _bottomLine(BuildContext context) => BottomLine(
        textLine1: buttonLineLoginString,
        textLine2: signUpString,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateAccountPage()));
        },
      );
}
