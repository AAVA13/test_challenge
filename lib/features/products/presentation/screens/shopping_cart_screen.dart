import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_challenge/features/products/presentation/providers/product_cart_items_provider.dart';
import 'package:test_challenge/features/products/presentation/widgets/empty_screen.dart';
import 'package:test_challenge/features/products/presentation/widgets/quantity_products.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productCartItems = ref.watch(productCartItemsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shopping cart'),
        ),
        body: productCartItems.isEmpty
            ? const EmptyScreen(
                icon: Icons.remove_shopping_cart_outlined,
                text: 'No tienes pedidos en tu carrito...',
              )
            : const _ShoppingCartView());
  }
}

class _ShoppingCartView extends ConsumerWidget {
  const _ShoppingCartView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Expanded(child: ProductInCartItems()),
        TotalPrice(),
      ],
    );
  }
}

class TotalPrice extends ConsumerWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      height: 130,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total price for ${ref.watch(totalItemsProvider)} item(s) ',
            style: textStyles.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            '\$${ref.watch(totalPriceProvider).toStringAsFixed(2)}',
            style: textStyles.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.topRight,
            child: FilledButton(
              onPressed: ref.watch(totalItemsProvider) == 0 ? null : () {},
              child: const Text('Buy Now'),
            ),
          )
        ],
      ),
    );
  }
}

class ProductInCartItems extends ConsumerWidget {
  const ProductInCartItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productCartItems = ref.watch(productCartItemsProvider);

    return ListView.builder(
      itemCount: productCartItems.length,
      itemBuilder: (context, index) {
        return ProductInCartItem(
          productCartItem: productCartItems[index],
        );
      },
    );
  }
}

class ProductInCartItem extends StatelessWidget {
  final ProductCartItem productCartItem;

  const ProductInCartItem({super.key, required this.productCartItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _ImageView(imageUrl: productCartItem.product.imagesUrl.first),
          _ProductInfo(
            productCartItem: productCartItem,
          ),
        ],
      ),
    );
  }
}

class _ProductInfo extends ConsumerWidget {
  final ProductCartItem productCartItem;

  const _ProductInfo({required this.productCartItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productCartItem.product.title,
              textAlign: TextAlign.left,
              style: textStyles.labelLarge!.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              height: 4,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '\$${productCartItem.product.regularPrice.toStringAsFixed(2)}',
                style: textStyles.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuantityProducts(
                  product: productCartItem.product,
                  quantity: productCartItem.quantity,
                  decrement: () => ref.read(productCartItemsProvider.notifier).decrementCount(productCartItem),
                  increment: () => ref.read(productCartItemsProvider.notifier).incrementCount(productCartItem),
                ),
                IconButton.outlined(
                  onPressed: () => ref.read(productCartItemsProvider.notifier).removeToCart(productCartItem),
                  icon: const Icon(
                    Icons.delete,
                  ),
                  style: IconButton.styleFrom(
                    minimumSize: const Size(10, 10),
                    iconSize: 15,
                    foregroundColor: colorScheme.error,
                    side: BorderSide(
                      color: colorScheme.error,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ImageView extends StatelessWidget {
  final String imageUrl;

  const _ImageView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 100,
      height: 100,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
