// To parse this JSON data, do
//
//     final request = requestFromJson(jsonString);

import 'dart:convert';

import 'package:test_challenge/models/product_model.dart';

Request requestFromJson(String str) => Request.fromJson(json.decode(str));

String requestToJson(Request data) => json.encode(data.toJson());

class Request {
    List<ProductModel> products;
    int pages;
    int records;
    int current;
    String filter;

    Request({
        required this.products,
        required this.pages,
        required this.records,
        required this.current,
        required this.filter,
    });

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        products: List<ProductModel>.from(json["results"].map((x) => x)),
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
