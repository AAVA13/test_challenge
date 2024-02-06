import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_challenge/home/widgets/product_card_md.dart';
import 'package:test_challenge/products_bloc/products_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductsBloc>().add(LoadProducts());
        },
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {

            if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is ProductsLoaded){
              return CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                    ), 
                    delegate: SliverChildListDelegate(
                      state.productModel.map((product) => 
                        ProductCard(product: product)).toList()
                    ),
                  ),
                ],
              );
            }

            return const CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              slivers: []
            );
            
          },
        )
      ),
    );
  }
}
