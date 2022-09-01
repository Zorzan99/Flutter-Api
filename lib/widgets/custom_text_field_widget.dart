import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final bool isSecret;

  const CustomTextFieldWidget({
    Key? key,
    required this.onChanged,
    required this.label,
    this.isSecret = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isSecret,
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}
