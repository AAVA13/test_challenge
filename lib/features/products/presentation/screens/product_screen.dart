import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_challenge/features/products/presentation/providers/product_cart_items_provider.dart';
import 'package:test_challenge/features/products/presentation/widgets/custom_label.dart';
import 'package:test_challenge/features/products/presentation/widgets/empty_screen.dart';
import 'package:test_challenge/features/products/presentation/widgets/full_screen_loader.dart';
import 'package:test_challenge/features/products/presentation/widgets/quantity_products.dart';

import '../../domain/entities/product.dart';
import '../providers/product_provider.dart';

class ProductScreen extends ConsumerWidget {
  final String productId;

  const ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider(productId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: productState.isLoading
          ? const FullScreenLoader()
          : productState.error
              ? EmptyScreen(
                  icon: Icons.warning,
                  text: productState.errorMessage,
                  iconColor: Colors.yellow.shade700,
                )
              : _ProductView(product: productState.product!),
    );
  }
}

class _ProductView extends ConsumerWidget {
  final Product product;

  const _ProductView({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final productCartItem = ref.watch(productCartItemProvider(product));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            height: 250,
            child: _ImageGallery(images: product.imagesUrl),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '\$${product.regularPrice.toStringAsFixed(2)}',
            style: textStyles.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            product.title,
            style: textStyles.titleSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.brand,
                style: textStyles.labelLarge!.copyWith(fontWeight: FontWeight.w300),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_half_rounded,
                    color: Colors.yellow.shade600,
                  ),
                  Text(
                    product.reviewsAverage.toString(),
                    style: textStyles.titleSmall!.copyWith(color: Colors.yellow.shade600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantityProducts(
                decrement: ref.read(productCartItemProvider(product).notifier).decrementCount,
                increment: ref.read(productCartItemProvider(product).notifier).incrementCount,
                product: product,
                quantity: productCartItem.quantity,
              ),
              CustomLabel(text: product.inStock ? 'In Stock' : 'Sold out'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          FilledButton.tonalIcon(
            onPressed: productCartItem.quantity == 0
                ? null
                : () {
                    ref.read(productCartItemsProvider.notifier).addToCart(productCartItem);
                    _showSnackBar(context, 'Agregado al carrito de compras');
                  },
            label: const Text('Add To Car'),
            icon: const Icon(Icons.add_shopping_cart),
          )
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String errorMessage) {
    final colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.check,
            color: colorScheme.background,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            errorMessage,
            style: TextStyle(color: colorScheme.background),
          ),
        ],
      ),
      backgroundColor: colorScheme.primary,
    ));
  }
}

class _ImageGallery extends StatelessWidget {
  final List<String> images;

  const _ImageGallery({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset(
            'assets/images/no-image.jpg',
            fit: BoxFit.cover,
          ));
    }
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: PageController(viewportFraction: 0.7),
      children: images.map((image) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
              placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
            ),
          ),
        );
      }).toList(),
    );
  }
}
