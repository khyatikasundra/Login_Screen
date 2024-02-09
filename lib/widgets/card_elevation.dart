import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardElevation extends StatefulWidget {
  final String textFieldName;
  final Widget? prefixIconGet;
  final Widget? suffixIcon;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onChange;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool? obscureText;
  const CardElevation({
    required this.textInputAction,
    required this.textFieldName,
    required this.prefixIconGet,
    required this.validator,
    required this.textInputType,
    required this.textEditingController,
    this.obscureText,
    this.suffixIcon,
    super.key,
    this.onEditingComplete,
    this.onChange,
    this.maxLength,
  });

  @override
  State<CardElevation> createState() => _CardElevationState();
}

class _CardElevationState extends State<CardElevation> {
  final FocusNode _focusNode = FocusNode();
  double _elevation = 1;
  double _paddingPrefix = 0;
  bool _isObscure = false;

  @override
  void dispose() {
    FocusNode().dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(onTap);
  }

  void upDate() {
    setState(() {});
  }

  void onTap() {
    _elevation = _focusNode.hasFocus ? 10 : 1;
    _paddingPrefix = _focusNode.hasFocus ? 13 : 0;
    _isObscure = !_isObscure;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        surfaceTintColor: Colors.white,
        elevation: _elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        margin: const EdgeInsets.only(right: 35, left: 35),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: textField(),
        ));
  }

//widget method
  Widget textField() => TextFormField(
        textInputAction: widget.textInputAction,
        inputFormatters: [LengthLimitingTextInputFormatter(widget.maxLength)],
        obscureText: widget.obscureText ?? false,
        focusNode: _focusNode,
        onChanged: widget.onChange,
        onEditingComplete: widget.onEditingComplete,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          errorMaxLines: 3,
          contentPadding: const EdgeInsets.only(left: 40),
          prefixIcon: Padding(
              padding: EdgeInsets.only(top: _paddingPrefix),
              child: widget.prefixIconGet),
          suffixIcon: widget.suffixIcon,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: InputBorder.none,
          labelText: widget.textFieldName,
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 121, 120, 120)),
        ),
      );
}
