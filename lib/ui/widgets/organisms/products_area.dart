import 'package:flutter/material.dart';
import 'package:test_challenge/ui/widgets/atoms/title_area.dart';
import 'package:test_challenge/ui/widgets/organisms/product_slider.dart';

class ProductsArea extends StatelessWidget {
  const ProductsArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: ProductSlider(),
        ),
      ],
    );
  }
}
