import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomLine extends StatelessWidget {
  final String textLine1;
  final String textLine2;
  final void Function()? onTap;
  const BottomLine(
      {required this.textLine1,
      required this.textLine2,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(text: textLine1),
            TextSpan(
                text: textLine2,
                style: const TextStyle(
                    color: Color(0xFFF4B14B), fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = onTap),
          ],
        ),
      ),
    );
  }
}
