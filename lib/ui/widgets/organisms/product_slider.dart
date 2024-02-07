import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_challenge/ui/widgets/atoms/title_area.dart';
import 'package:test_challenge/ui/widgets/molecules/product_button.dart';
import 'package:test_challenge/ui/blocs/product_bloc.dart';
import 'package:test_challenge/ui/widgets/molecules/skeleton_product_button.dart';
import 'package:collection/collection.dart';
// Asegúrate de importar tu bloc

class ProductSlider extends StatefulWidget {
  ProductSlider({
    Key? key,
  }) : super(key: key);

  @override
  _ProductSliderState createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state.status == ProductStatus.success) {
        // Agrupa los productos por marca
        var productGroups =
            groupBy(state.products, (product) => product['brand']);

        // Crea un slider para cada grupo de productos de la misma marca
        return Column(
          children: productGroups.entries.map((entry) {
            var brand = entry.key;
            var products = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleArea(text: '$brand'),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 1),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductButton(
                        product: product,
                      );
                    },
                    itemCount: products.length,
                  ),
                ),
              ],
            );
          }).toList(),
        );
      } else {
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(width: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleArea(text: 'Loading...'),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 1),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SkeletonProductButton();
                      },
                      itemCount: 5,
                    ),
                  ),
                ],
              )
            ]);
          },
          itemCount: 5,
        );
      }
    });
  }
}
