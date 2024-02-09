import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_challenge/home/widgets/product_card_md.dart';
import 'package:test_challenge/products_bloc/products_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: BlocBuilder<ProductsBloc, ProductsState>(
      //   builder: (context, state) {

      //     if(state is ProductsLoaded){
      //       return SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: List.generate(
      //             state.page, (index) => RawMaterialButton(
      //               child: Text('$index'),
      //               onPressed: (){}
      //             ),
      //           )
      //         ),
      //       );
      //     }


      //     return Container();
      //   },
      // ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductsBloc>().add(LoadProducts(index:0));
        },
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {

            if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is ProductsLoaded){
              return Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                        
                      SliverAppBar(
                        floating: true,
                        collapsedHeight: 70,
                        expandedHeight: 70,
                        flexibleSpace: FlexibleSpaceBar(
                          expandedTitleScale: 20,
                          background: SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Buscar',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
                  
                      SliverToBoxAdapter(
                        child: SizedBox(height: 100),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,

                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          state.pages, (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: (){
                                context.read<ProductsBloc>().add(
                                  LoadProducts(index: index)
                                );
                              },
                              child: Container(
                                width: 50,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: state.currentPage == index ? Colors.orange : Theme.of(context).primaryColor ,
                                ),
                                child: Center(
                                  child: Text(
                                    '${index+1}',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  )
                                ),
                              ),
                            ),
                            // child: RawMaterialButton(
                              
                            //   fillColor: state.currentPage == index ? Colors.blue : Colors.orange,
                            //   child: Text('${index+1}'),
                            //   onPressed: (){
                            //     context.read<ProductsBloc>().add(
                            //       LoadProducts(index: index)
                            //     );
                            //   }
                            // ),
                          ),
                        )
                      ),
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
