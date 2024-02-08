import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_challenge/models/product_model.dart';
import 'package:test_challenge/utils/double_formater.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  late int _counter;

  @override
  void initState() {
    _counter = 1;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if(_counter > 1){
        _counter--;
      }
    });
  }


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
                  borderRadius: BorderRadius.circular(40)
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10
                ),
                fillColor: Colors.amber,
                child: const Text(
                  'Agregar al carrito',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: (){
                  
                }
              ),
            ),

          ],
        ),
      ),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics()
        ),
        slivers: [

          SliverAppBar(
            automaticallyImplyLeading: true,
            pinned: false,
            floating: false,
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: CarouselSlider(
                items: widget.product.images.map((e) =>
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
                      text: '${widget.product.title}\n',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                    ),

                    TextSpan(
                      text: '${widget.product.brand}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      )
                    ),
              
                  ]
                ),
              ),
            ),
          ),

          SliverFillRemaining(
            fillOverscroll: false,
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                  
                        widget.product.description != null? TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Acerca del producto\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.product.description}',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                              ),
                            ),
                          ]
                        ) : const TextSpan(),



                      ]
                    ),
                  ),


                  Row(
                    children: [
                      Expanded(
                        child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: _decrementCounter,
                            ),
                            Container(
                              width: 90,
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(text: '$_counter'),
                                onChanged: (value) {
                                  setState(() {
                                    _counter = int.tryParse(value) ?? 1;
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: _incrementCounter,
                            ),
                          ],
                        ),
                      ),
                      ),
                      RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                            fontSize: 28,
                          ),
                          text: '\$${DoubleFormater().validateDouble(widget.product.regularUsd)}\n',
                          children: [
                            TextSpan(
                              text: '${DoubleFormater().validateDouble(widget.product.regularPrice)}',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16
                              )
                            ),
                          ]
                        )
                      ),
                    ],
                  )

                ],
              )
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0
              ),
              child: Text(
                widget.product.description??"",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}