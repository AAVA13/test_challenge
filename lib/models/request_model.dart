// To parse this JSON data, do
//
//     final request = requestFromJson(jsonString);

import 'dart:convert';

import 'package:test_challenge/models/product_model.dart';

RequestModel requestFromJson(String str) => RequestModel.fromJson(json.decode(str));

String requestToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
    List<ProductModel> products;
    int pages;
    int records;
    int current;
    String filter;

    RequestModel({
        required this.products,
        required this.pages,
        required this.records,
        required this.current,
        required this.filter,
    });

    factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        products: List<ProductModel>.from(json["results"].map((x) => ProductModel.fromJson(x))),
        pages: json["pages"],
        records: json["records"],
        current: json["current"],
        filter: json["filter"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<ProductModel>.from(products.map((x) => x)),
        "pages": pages,
        "records": records,
        "current": current,
        "filter": filter,
    };
}
