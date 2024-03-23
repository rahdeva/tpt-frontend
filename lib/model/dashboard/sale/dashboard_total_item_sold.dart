// To parse this JSON data, do
//
//     final dashboardTotalItemSold = dashboardTotalItemSoldFromJson(jsonString);

import 'dart:convert';

DashboardTotalItemSold dashboardTotalItemSoldFromJson(String str) => DashboardTotalItemSold.fromJson(json.decode(str));

String dashboardTotalItemSoldToJson(DashboardTotalItemSold data) => json.encode(data.toJson());

class DashboardTotalItemSold {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardTotalItemSold({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardTotalItemSold.fromJson(Map<String, dynamic> json) => DashboardTotalItemSold(
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
