// To parse this JSON data, do
//
//     final dashboardTopExpensiveProduct = dashboardTopExpensiveProductFromJson(jsonString);

import 'dart:convert';

DashboardTopExpensiveProduct dashboardTopExpensiveProductFromJson(String str) => DashboardTopExpensiveProduct.fromJson(json.decode(str));

String dashboardTopExpensiveProductToJson(DashboardTopExpensiveProduct data) => json.encode(data.toJson());

class DashboardTopExpensiveProduct {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardTopExpensiveProduct({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardTopExpensiveProduct.fromJson(Map<String, dynamic> json) => DashboardTopExpensiveProduct(
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
