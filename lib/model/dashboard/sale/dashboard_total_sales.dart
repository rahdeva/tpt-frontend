// To parse this JSON data, do
//
//     final dashboardSaleTotalSales = dashboardSaleTotalSalesFromJson(jsonString);

import 'dart:convert';

DashboardSaleTotalSales dashboardSaleTotalSalesFromJson(String str) => DashboardSaleTotalSales.fromJson(json.decode(str));

String dashboardSaleTotalSalesToJson(DashboardSaleTotalSales data) => json.encode(data.toJson());

class DashboardSaleTotalSales {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardSaleTotalSales({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardSaleTotalSales.fromJson(Map<String, dynamic> json) => DashboardSaleTotalSales(
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
