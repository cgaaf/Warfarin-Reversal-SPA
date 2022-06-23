import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(title),
        ),
      ),
    );
  }
}
