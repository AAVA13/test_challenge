import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:test_challenge/features/products/presentation/providers/products_provider.dart';

import '../widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/shopping/cart'),
        child: const Icon(Icons.shopping_cart_outlined),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const _ProductsView(),
    );
  }
}

class _ProductsView extends ConsumerStatefulWidget {
  const _ProductsView();

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<_ProductsView> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels + 800 >= controller.position.maxScrollExtent) {
        ref.read(productsProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(productsProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
        itemCount: productsState.products.length,
        itemBuilder: (context, index) {
          final product = productsState.products[index];
          return GestureDetector(
            onTap: () {
              context.push('/product/${product.id}');
            },
            child: ProductCard(product: product),
          );
        },
      ),
    );
  }
}
