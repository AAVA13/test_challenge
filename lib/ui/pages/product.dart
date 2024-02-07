import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_challenge/ui/blocs/product_bloc.dart';
import 'package:test_challenge/ui/widgets/atoms/btn.dart';
import 'package:test_challenge/ui/widgets/atoms/description_area.dart';
import 'package:test_challenge/ui/widgets/atoms/price_area.dart';
import 'package:test_challenge/ui/widgets/atoms/qty_input.dart';
import 'package:test_challenge/ui/widgets/atoms/title_area.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';
import 'package:test_challenge/ui/widgets/molecules/images_slider.dart';
import 'package:test_challenge/ui/widgets/organisms/layout.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late TextEditingController qtyController;

  @override
  void initState() {
    super.initState();
    qtyController = TextEditingController(text: '1');
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      currentPage: 'ProductView',
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          print(state.selectedProduct);
          return Stack(children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        ImageSlider(images: state.selectedProduct!['images']),
                      ],
                    ),
                  ),
                  Padding(
                      padding: AppMargins.separation,
                      child: TitleArea(text: state.selectedProduct?['title'])),
                  Padding(
                    padding: AppMargins.separation,
                    child: PriceArea(
                      bolivares: state.selectedProduct!['offer_price'] != null
                          ? state.selectedProduct!['offer_price']
                          : state.selectedProduct!['regular_price'],
                      dolares: state.selectedProduct!['offer_usd'] != null
                          ? state.selectedProduct!['offer_usd']
                          : state.selectedProduct!['regular_usd'],
                    ),
                  ),
                  Padding(
                      padding: AppMargins.separation,
                      child: QtyInput(
                        qtyController: qtyController,
                        maxQty: state.selectedProduct!['stock_quantity'],
                      )),
                  Padding(
                    padding: AppMargins.separation + EdgeInsets.only(top: 20),
                    child: DescriptionArea(
                        desc: state.selectedProduct!['description']),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Btn(
                  icon: Icon(
                    Icons.add_shopping_cart_outlined,
                    color: AppColors.primaryColor,
                    size: 35,
                  ),
                  onPressed: () {
                    if (state.selectedProduct!['stock_quantity'] != null &&
                        int.parse(qtyController.text) >
                            state.selectedProduct!['stock_quantity']) {
                      Fluttertoast.showToast(
                        msg: "No puedes agregar mas productos del stock maximo",
                        backgroundColor: Colors.red,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    } else {
                      context.read<ProductBloc>().add(AddToCart(
                            state.selectedProduct, // producto
                            int.parse(qtyController.text), // cantidad
                          ));
                    }
                  }),
              bottom: 0,
              right: 0,
            )
          ]);
        },
      ),
    );
  }
}
