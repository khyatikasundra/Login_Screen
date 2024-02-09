import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  final double? fontSize;
  final String name;
  final FontWeight? fontWeight;
  final Color? color;
  const ContainerText(
      {required this.name,
      this.fontSize,
      this.fontWeight,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 35),
        child: Text(
          name,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: color),
        ));
  }
}
