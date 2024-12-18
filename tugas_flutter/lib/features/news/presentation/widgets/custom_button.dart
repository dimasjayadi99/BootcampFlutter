import 'package:flutter/material.dart';
import 'package:tugas_flutter/core/constant/color.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final int? backgroundColor;
  final int? labelColor;
  final VoidCallback onTap;
  final int? borderColor;
  final String? icon;
  const CustomButton({
    super.key,
    required this.label,
    this.backgroundColor,
    this.labelColor,
    required this.onTap,
    this.borderColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(backgroundColor ?? whiteColor),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(borderColor ?? primaryColor)),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Row(
                    children: [
                      Image.asset(
                        icon!,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                    ],
                  )
                : Container(),
            Text(
              label,
              style: TextStyle(color: Color(labelColor ?? whiteColor)),
            ),
          ],
        ),
      ),
    );
  }
}
