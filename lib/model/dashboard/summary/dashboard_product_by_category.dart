// To parse this JSON data, do
//
//     final dashboardProductByCategory = dashboardProductByCategoryFromJson(jsonString);

import 'dart:convert';

DashboardProductByCategory dashboardProductByCategoryFromJson(String str) => DashboardProductByCategory.fromJson(json.decode(str));

String dashboardProductByCategoryToJson(DashboardProductByCategory data) => json.encode(data.toJson());

class DashboardProductByCategory {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardProductByCategory({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardProductByCategory.fromJson(Map<String, dynamic> json) => DashboardProductByCategory(
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
