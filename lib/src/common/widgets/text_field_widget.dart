import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? labelText;
  final bool? enabled;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  const TextFieldWidget({
    super.key,
    this.labelText,
    this.enabled,
    this.controller,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      enabled: enabled ?? false,
      style: const TextStyle(
        color: Color(0xff7C7C7C),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }
}
