import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class QuantityProducts extends StatelessWidget {
  final Product product;
  final int quantity;
  final void Function() decrement;
  final void Function() increment;

  const QuantityProducts({
    super.key,
    required this.product,
    required this.quantity,
    required this.decrement,
    required this.increment,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        IconButton.filled(
          onPressed: (quantity == 0) ? null : () => decrement(),
          icon: Icon(
            Icons.remove,
            color: colorScheme.background,
          ),
          color: colorScheme.primary,
          style: IconButton.styleFrom(minimumSize: const Size(10, 10), iconSize: 10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            '$quantity',
            style: textTheme.titleMedium,
          ),
        ),
        IconButton.filled(
            onPressed: () => increment(),
            icon: Icon(
              Icons.add,
              color: colorScheme.background,
            ),
            color: colorScheme.primary,
            style: IconButton.styleFrom(minimumSize: const Size(10, 10), iconSize: 10))
      ],
    );
  }
}
