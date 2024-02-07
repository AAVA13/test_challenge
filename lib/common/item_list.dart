import 'package:flutter/material.dart';
import 'package:test_challenge/database/db_helper.dart';
import 'package:test_challenge/common/item_card.dart';

class ItemList extends StatefulWidget {
  final List<dynamic> items;
  final String title;
  final double topMargin;
  const ItemList(
      {Key? key, required this.items, required this.title, this.topMargin = 10})
      : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, widget.topMargin, 10, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(widget.title)],
          ),
        ),
        LimitedBox(
            maxHeight: 600,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(20),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return ItemCard(
                    index: index,
                    id: widget.items[index].id,
                    imageUrl: widget.items[index].images[0]["image"],
                    imageUrlLarge: widget.items[index].mediumImages[0]["image"],
                    title: widget.items[index].title,
                    priceUSD: widget.items[index].priceUSD,
                    stock: widget.items[index].stock.toString(),
                    priceBs: widget.items[index].priceBs,
                    key: null,
                  );
                })),
      ],
    );
  }
}
