import 'package:flutter/material.dart';

/// A styled button component with configurable text and loading state.
class ButtonCustom extends StatelessWidget {
  /// The text to display on the button.
  final String text;

  /// Callback when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether to show a loading indicator instead of text.
  final bool isLoading;

  /// Optional width. Defaults to full width.
  final double? width;

  const ButtonCustom({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(text),
      ),
    );
  }
}
