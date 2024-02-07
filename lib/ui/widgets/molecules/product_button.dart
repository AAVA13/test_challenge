import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_challenge/ui/blocs/product_bloc.dart';
import 'package:test_challenge/ui/pages/product.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';
import 'package:test_challenge/ui/widgets/molecules/bubble.dart';

class ProductButton extends StatelessWidget {
  final dynamic product;

  const ProductButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (product['status'] == 'publish') {
      return Container(
        margin: EdgeInsets.only(left: 3, right: 10, top: 10, bottom: 10),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(62, 0, 0, 0),
              blurRadius: 5,
              offset: Offset(0, 1), // Shadow position
            ),
          ],
        ),
        child: SafeArea(
          child: GestureDetector(
            child: Stack(
              children: [
                Center(
                    child: Image.network(
                  product['images'][0]['image'],
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Bubble(
                                  child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.attach_money_outlined,
                                    color: AppColors.secondaryColor,
                                    size: 20,
                                  ),
                                  Text(
                                    product['stockQuantity'] != null
                                        ? product['offer_usd'].toString()
                                        : product['regular_usd'].toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              )),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Bubble(
                                    child: Text(
                                      product['title'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                width: 180,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              BlocProvider.of<ProductBloc>(context).add(
                SelectProduct(product),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductView(),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
