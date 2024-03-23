// To parse this JSON data, do
//
//     final dashboardTotalItemPurchased = dashboardTotalItemPurchasedFromJson(jsonString);

import 'dart:convert';

DashboardTotalItemPurchased dashboardTotalItemPurchasedFromJson(String str) => DashboardTotalItemPurchased.fromJson(json.decode(str));

String dashboardTotalItemPurchasedToJson(DashboardTotalItemPurchased data) => json.encode(data.toJson());

class DashboardTotalItemPurchased {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardTotalItemPurchased({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardTotalItemPurchased.fromJson(Map<String, dynamic> json) => DashboardTotalItemPurchased(
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
