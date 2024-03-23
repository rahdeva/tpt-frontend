// To parse this JSON data, do
//
//     final dashboardTopSaleProduct = dashboardTopSaleProductFromJson(jsonString);

import 'dart:convert';

DashboardTopSaleProduct dashboardTopSaleProductFromJson(String str) => DashboardTopSaleProduct.fromJson(json.decode(str));

String dashboardTopSaleProductToJson(DashboardTopSaleProduct data) => json.encode(data.toJson());

class DashboardTopSaleProduct {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardTopSaleProduct({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardTopSaleProduct.fromJson(Map<String, dynamic> json) => DashboardTopSaleProduct(
        length: json["length"],
        title: json["title"],
        label: json["label"] == null ? [] : List<String>.from(json["label"]!.map((x) => x)),
        value: json["value"] == null ? [] : List<int>.from(json["value"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "length": length,
        "title": title,
        "label": label == null ? [] : List<dynamic>.from(label!.map((x) => x)),
        "value": value == null ? [] : List<dynamic>.from(value!.map((x) => x)),
    };
}
