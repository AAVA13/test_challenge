import 'package:flutter/material.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';
import 'package:test_challenge/constants/color.dart';
import 'package:test_challenge/shared/custom_text_field.dart';
import 'package:test_challenge/data/http_helper.dart';
import 'package:test_challenge/data/products_data.dart';
import 'package:test_challenge/shared/item_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLastPage = false;
  bool loading = true;
  late List<ProductsData> futureProducts;
  HTTPHelper httpHelper = HTTPHelper();
  final TextEditingController searchText = TextEditingController();
  @override
  void initState() {
    super.initState();
    getFirstLoadProducts();
  }

  Future<void> getFirstLoadProducts() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      final result = await httpHelper.getProducts(true);

      setState(() {
        futureProducts = result;
        loading = false;
        isLastPage = false;
      });
    });
  }

  Future<void> getMoreProducts() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      loading = true;
      final result = await httpHelper.getProducts(false);
      setState(() {
        futureProducts.addAll(result);
        loading = false;
        isLastPage = futureProducts.isEmpty;
      });
    });
  }

  Future<void> filterProduct(TextEditingController textControl) async {
    String name = textControl.text;
    await Future.delayed(const Duration(seconds: 1), () async {
      List<ProductsData> data;
      if (name != "") {
        loading = true;
        data = futureProducts
            .where((element) =>
                element.title.toLowerCase().contains(name.toLowerCase()))
            .toList();
        setState(() {
          futureProducts = data;
          loading = false;
        });
      } else {
        loading = true;
        await getFirstLoadProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: searchText,
          suffixIcon: IconButton(
              onPressed: () async {
                await filterProduct(searchText);
              },
              icon: const Icon(Icons.search)),
          placeholder: "Buscar...",
        ),
        loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: themeColor,
                ),
              )
            : Expanded(
                child: RefreshLoadmore(
                    onRefresh: getFirstLoadProducts,
                    onLoadmore: getMoreProducts,
                    noMoreWidget: Text(
                      'Ya no hay más productos por los momentos',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                    isLastPage: isLastPage,
                    child: ItemList(
                      items: futureProducts,
                      title: "Listado de productos",
                    ))),
      ],
    );
  }
}
