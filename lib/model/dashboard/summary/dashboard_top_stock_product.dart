// To parse this JSON data, do
//
//     final dashboardTopStockProduct = dashboardTopStockProductFromJson(jsonString);

import 'dart:convert';

DashboardTopStockProduct dashboardTopStockProductFromJson(String str) => DashboardTopStockProduct.fromJson(json.decode(str));

String dashboardTopStockProductToJson(DashboardTopStockProduct data) => json.encode(data.toJson());

class DashboardTopStockProduct {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardTopStockProduct({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardTopStockProduct.fromJson(Map<String, dynamic> json) => DashboardTopStockProduct(
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
