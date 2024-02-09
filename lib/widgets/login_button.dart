import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const LoginButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFF2C983), Color(0xFFF4B14B)]),
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: TextButton(
              onPressed: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
