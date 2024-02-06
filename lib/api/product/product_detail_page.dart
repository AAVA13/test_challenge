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
      body: Container(
      padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
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
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Text(
              "\$${DoubleFormater().validateDouble(product.regularUsd)}",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "${product.brand}",maxLines: 1,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              "${product.title}",maxLines: 2,
              style: TextStyle(
                fontSize: 18
              ),
            ),
          ],
        ),
      ),
    );
  }
}