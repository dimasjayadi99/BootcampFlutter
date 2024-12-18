import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  final String label;
  final IconData? preffixIcon;
  final IconData? suffixIcon;

  const CustomTextField({super.key,
    required this.label,
    this.preffixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        prefixIcon: Icon(preffixIcon),
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }
}