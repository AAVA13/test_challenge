import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const EmptyScreen({super.key, required this.icon, required this.text, this.iconColor = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
            color: iconColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    ));
  }
}
