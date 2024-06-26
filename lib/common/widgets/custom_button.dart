import 'package:flutter/material.dart';
import 'package:amazon_clone/Constants/global_variable.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color; // Optional background color for flexibility

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize:
            const Size(double.infinity, 50), // Setting the minimum size
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        // Default to primary color

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, // Default text color to white for contrast
        ),
      ),
    );
  }
}
