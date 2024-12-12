import 'package:flutter/material.dart';
import 'package:tugas_flutter/core/constant/color.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final int? backgroundColor;
  final int? labelColor;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.label,
      this.backgroundColor,
      this.labelColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(backgroundColor ?? whiteColor),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color(primaryColor)),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: TextStyle(color: Color(labelColor ?? whiteColor)),
        ),
      ),
    );
  }
}
