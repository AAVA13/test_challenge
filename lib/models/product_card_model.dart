import 'package:test_challenge/models/product_model.dart';

class ProductCardModel {
    ProductModel product;
    int count;
    String sku;

    ProductCardModel({
        required this.product,
        required this.count,
        required this.sku,
    });
}
