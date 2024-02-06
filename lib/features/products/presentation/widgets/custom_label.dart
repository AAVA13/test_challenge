import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String text;

  const CustomLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(color: colorScheme.primary, borderRadius: BorderRadius.circular(5)),
      child: Text(
        text,
        style: textStyle.labelSmall!.copyWith(fontWeight: FontWeight.bold, color: colorScheme.background),
      ),
    );
  }
}
