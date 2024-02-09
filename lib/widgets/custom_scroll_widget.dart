import 'package:flutter/material.dart';

class CustomScrollWidget extends StatelessWidget {
  const CustomScrollWidget({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, viewPort) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewPort.maxHeight),
          child: child,
        ),
      );
    });
  }
}
