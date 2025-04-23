import 'package:flutter/material.dart';

/// A customizable text button with optional icon support.
class TextButtonWidget extends StatelessWidget {
  /// Creates a `TextButtonWidget`.
  const TextButtonWidget({
    required this.text,
    this.onPressed,
    this.icon,
    this.backgroundColor = const Color.fromARGB(255, 89, 86, 86),
    this.textColor = Colors.white,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    super.key,
  });

  /// Callback function triggered when the button is pressed.
  final VoidCallback? onPressed;

  /// The text displayed inside the button.
  final String text;

  /// An optional icon displayed beside the text.
  final IconData? icon;

  /// The background color of the button.
  final Color backgroundColor;

  /// The color of the text and icon.
  final Color textColor;

  /// The border radius of the button.
  final double borderRadius;

  /// The padding inside the button.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isDisabled ? Colors.grey[300] : backgroundColor,
          foregroundColor: isDisabled ? Colors.grey[500] : textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    color: isDisabled ? Colors.grey[500] : textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            if (icon != null)
              Icon(
                icon,
                color: isDisabled ? Colors.grey[500] : textColor,
              ),
          ],
        ),
      ),
    );
  }
}
