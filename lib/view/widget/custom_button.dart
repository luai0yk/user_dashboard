import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.indigo,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 50,
      ),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      elevation: 0,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
