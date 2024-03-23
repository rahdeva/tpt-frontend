// To parse this JSON data, do
//
//     final dashboardTopSupplier = dashboardTopSupplierFromJson(jsonString);

import 'dart:convert';

DashboardTopSupplier dashboardTopSupplierFromJson(String str) => DashboardTopSupplier.fromJson(json.decode(str));

String dashboardTopSupplierToJson(DashboardTopSupplier data) => json.encode(data.toJson());

class DashboardTopSupplier {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardTopSupplier({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardTopSupplier.fromJson(Map<String, dynamic> json) => DashboardTopSupplier(
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
