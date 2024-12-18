import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? isObscure;
  final VoidCallback? suffixTap;
  final String? Function(String?) validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscure,
    this.suffixTap,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        labelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: GestureDetector(
            onTap: suffixTap,
            child: Icon(suffixIcon)),
      ),
      validator: validator,
    );
  }
}