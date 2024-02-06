import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _ImageViewer(images: product.imagesUrl),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  product.title,
                  textAlign: TextAlign.left,
                  style: textStyle.labelSmall!.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    product.brand,
                    textAlign: TextAlign.right,
                    style: textStyle.bodySmall!.copyWith(fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  //child: CustomLabel(text: '${product.regularPrice.toStringAsFixed(2)} \$'),
                  child: Text(
                    '\$${product.regularPrice.toStringAsFixed(2)}',
                    textAlign: TextAlign.left,
                    style: textStyle.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageViewer extends StatelessWidget {
  final List<String> images;

  const _ImageViewer({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/no-image.jpg',
          fit: BoxFit.cover,
          height: 250,
        ),
      );
    }
    return FadeInImage(
      fadeOutDuration: const Duration(milliseconds: 100),
      fadeInDuration: const Duration(milliseconds: 200),
      image: NetworkImage(images.first),
      placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
    );
  }
}
