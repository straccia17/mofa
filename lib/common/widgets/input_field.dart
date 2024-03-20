import 'package:flutter/material.dart';
import 'package:mofa/common/widgets/style/input_field.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextInputAction action;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function(String?) onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.labelText,
    required this.onSaved,
    this.validator,
    this.action = TextInputAction.next,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            color: theme.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: controller,
          cursorColor: theme.primaryColor,
          obscureText: obscureText,
          style: inputStyle(theme),
          decoration: inputDecoration(theme),
          keyboardType: keyboardType,
          autocorrect: false,
          textInputAction: action,
          validator: validator,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
