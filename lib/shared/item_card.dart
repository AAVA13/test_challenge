import 'package:flutter/material.dart';
import 'package:test_challenge/constants/color.dart';
import 'package:test_challenge/screens/product_details.dart';

import 'package:provider/provider.dart';
import 'package:test_challenge/provider/cart_provider.dart';
import 'package:test_challenge/database/db_helper.dart';
import 'package:test_challenge/model/cart_model.dart';

class ItemCard extends StatefulWidget {
  final int index;
  final String id;
  final String imageUrl;
  final String imageUrlLarge;
  final String title;
  final dynamic priceUSD;
  final dynamic priceBs;
  final String stock;
  const ItemCard(
      {Key? key,
      required this.index,
      required this.id,
      required this.imageUrl,
      required this.title,
      this.priceUSD,
      this.priceBs,
      required this.imageUrlLarge,
      required this.stock})
      : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  DBHelper dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    void saveData() {
      dbHelper
          .insert(
        Cart(
          id: widget.index,
          productId: widget.id,
          productName: widget.title,
          initialPrice: widget.priceUSD,
          productPrice: widget.priceUSD,
          quantity: ValueNotifier(1),
          image: widget.imageUrl,
        ),
      )
          .then((value) {
        cart.addTotalPrice(widget.priceUSD.toDouble());
        cart.addCounter();
      }).onError((error, stackTrace) {
        throw Exception();
      });
    }

    return Container(
        width: 120,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Details(
                  imageUrl: widget.imageUrl,
                  title: widget.title,
                  priceUSD: widget.priceUSD,
                  stock: widget.stock,
                  saveData: saveData),
            ));
          },
          child: Column(
            children: [
              Image.network(
                widget.imageUrl,
                height: 100,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 12, color: themeTextColor),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "Ref. ${widget.priceUSD}",
                    style: const TextStyle(fontSize: 18, color: themeTextColor),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    " Quedan ${double.parse(widget.stock).round()} unidades",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        color: double.parse(widget.stock) > 0
                            ? themeColor
                            : themeTextColorDanger),
                  )),
                  IconButton(
                    onPressed: saveData,
                    icon: Icon(Icons.add_shopping_cart_rounded),
                    color: themeColor,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
