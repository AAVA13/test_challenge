import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_challenge/models/product_model.dart';
import 'package:test_challenge/utils/double_formater.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: (){}, 
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20
                ),
                fillColor: Colors.amber,
                child: Text(
                  'Agregar al carrito',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: (){
                  
                }
              ),
            )
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics()
        ),
        slivers: [

          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30)
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 18,
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CarouselSlider(
                    items: product.images.map((e) =>
                      Hero(
                        tag:e,
                        child: Image.network(e.image,fit: BoxFit.cover,)
                      )
                    ).toList(),
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      aspectRatio: 1 / 1,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 8),
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlayAnimationDuration: const Duration(seconds: 2)
                    ),
                  ),
                ],
              ),
            ),
          ),

          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.grey[800]
                  ),
                  children: [
                    
                    TextSpan(
                      text: '${product.title}\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                    ),

                    TextSpan(
                      text: '${product.brand}',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      )
                    ),
              
                  ]
                ),
              ),
            ),
          ),
          
          

        ],
      ),
    );
  }
}