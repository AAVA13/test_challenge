import 'package:flutter/material.dart';
import 'package:test_challenge/constants/color.dart';
import 'package:test_challenge/shared/navbar.dart';

class Details extends StatelessWidget {
  final String imageUrl;
  final String title;
  final dynamic priceUSD;
  final String stock;
  final dynamic saveData;

  const Details(
      {Key? key,
      required this.imageUrl,
      required this.title,
      this.priceUSD,
      this.saveData,
      required this.stock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Navbar(
            title: 'PRODUCTO',
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network(
                imageUrl,
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: themeColorLight),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "Ref. $priceUSD",
                    style: const TextStyle(fontSize: 18, color: themeTextColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Text(
                    "${double.parse(stock).round()} unidades",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        color: double.parse(stock) > 0
                            ? themeColor
                            : themeTextColorDanger),
                  )),
                  IconButton(
                    onPressed: saveData,
                    icon: const Icon(Icons.add_shopping_cart_rounded),
                    color: themeColor,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
