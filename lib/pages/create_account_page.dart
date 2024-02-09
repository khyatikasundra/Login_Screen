import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widgets_practice_project/pages/account_page.dart';
import 'package:widgets_practice_project/widgets/bottom_line.dart';
import 'package:widgets_practice_project/widgets/card_elevation.dart';
import 'package:widgets_practice_project/widgets/container_text.dart';
import 'package:widgets_practice_project/widgets/custom_scroll_widget.dart';
import 'package:widgets_practice_project/widgets/login_button.dart';
import 'package:widgets_practice_project/strings.dart';
import 'package:widgets_practice_project/validation_function.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  static bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backIconButton(context),
                    flowerSVGImage(),
                  ],
                ),
                spacer(),
                const ContainerText(
                  name: createAccountString,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
                spacer(),
                _createAccountForm(context)
              ],
            ),
            //bottom text
            BottomLine(
              textLine1: bottomLineAccountString,
              textLine2: signInString,
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      )),
    );
  }

//? FUNCTIONS

//Form Validation to next Page
  void _validateForm(BuildContext context) {
    String emailIdPassing = emailController.text;
    String passwordPassing = passwordController.text;
    String confirmPasswordPassing = confirmPasswordController.text;
    String fullNamePassing = fullNameController.text;

    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AccountPage(
                    emailIdGet: emailIdPassing,
                    passwordGet: passwordPassing,
                    confirmPassword: confirmPasswordPassing,
                    fullName: fullNamePassing,
                  )));
    }
  }

//Confirm
  String? confirmPasswordValidator(String? value) {
    if (value!.isEmpty) {
      return "Please confirm your password.";
    } else if (value != passwordController.text) {
      return "Passwords do not match.";
    } else {
      return null;
    }
  }

//? WIDGET METHOD
//Back button Icon
  Widget backIconButton(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      );

// Flower logo
  Widget flowerSVGImage() => Align(
        alignment: Alignment.topRight,
        child: SvgPicture.asset(
          "assets/asset.svg",
          height: 100,
          width: 100,
        ),
      );

  Widget spacer() => const SizedBox(
        height: 20,
      );

  //Form for Create Account
  Widget _createAccountForm(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            fullNameCard(),
            spacer(),
            emailCard(),
            spacer(),
            passwordCard(),
            spacer(),
            confirmPasswordCard(context),
            spacer(),
            signUpButton(context)
          ],
        ),
      );

// Full Name TextField
  Widget fullNameCard() => CardElevation(
        textInputAction: TextInputAction.next,
        textFieldName: fullNameString,
        prefixIconGet: const Icon(Icons.person_outlined),
        validator: MyFunctions.fullNameValidator,
        textInputType: TextInputType.text,
        textEditingController: fullNameController,
      );

// Email TextField
  Widget emailCard() => CardElevation(
        textInputAction: TextInputAction.next,
        textFieldName: emailString,
        prefixIconGet: const Icon(Icons.email_outlined),
        validator: MyFunctions.emailValidator,
        textInputType: TextInputType.text,
        textEditingController: emailController,
      );

// Password TextField
  Widget passwordCard() => StatefulBuilder(builder: (context, setState) {
        return CardElevation(
            maxLength: 8,
            textInputAction: TextInputAction.next,
            textFieldName: passwordString,
            prefixIconGet: const Icon(Icons.lock_outline),
            validator: MyFunctions.passwordValidator,
            textInputType: TextInputType.text,
            suffixIcon: _buildVisibilityIconButton(setState),
            textEditingController: passwordController,
            obscureText: isVisible);
      });

//Confirm Password TextField
  Widget confirmPasswordCard(BuildContext context) =>
      StatefulBuilder(builder: (context, setState) {
        return CardElevation(
            maxLength: 8,
            textInputAction: TextInputAction.done,
            onEditingComplete: () {
              _validateForm(context);
              FocusScope.of(context).unfocus();
            },
            textFieldName: confirmPasswordString,
            prefixIconGet: const Icon(Icons.lock_outlined),
            validator: confirmPasswordValidator,
            textInputType: TextInputType.text,
            suffixIcon: _buildVisibilityIconButton(setState),
            textEditingController: confirmPasswordController,
            obscureText: isVisible);
      });

// Sign up Button
  Widget signUpButton(BuildContext context) => Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.only(right: 35),
          child: LoginButton(
            onPressed: () {
              _validateForm(context);
            },
            text: signUpString.toUpperCase(),
          ),
        ),
      );

//Eye Icon For Password's Field
  Widget _buildVisibilityIconButton(void Function(void Function()) setState) =>
      IconButton(
        icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          _isVisible(setState);
        },
      );

  void _isVisible(void Function(void Function()) setState) {
    isVisible = !isVisible;
    setState(() {});
  }
}
