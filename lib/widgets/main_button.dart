import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  const MainButton({super.key, required this.title, required this.onPressed});
  final String title;
  final Function onPressed;
  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.green.withOpacity(0.8)),
      ),
      child: Text(widget.title),
    );
  }
}
