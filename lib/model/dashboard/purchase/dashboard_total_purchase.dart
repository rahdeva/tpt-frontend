// To parse this JSON data, do
//
//     final dashboardTotalPurchase = dashboardTotalPurchaseFromJson(jsonString);

import 'dart:convert';

DashboardTotalPurchase dashboardTotalPurchaseFromJson(String str) => DashboardTotalPurchase.fromJson(json.decode(str));

String dashboardTotalPurchaseToJson(DashboardTotalPurchase data) => json.encode(data.toJson());

class DashboardTotalPurchase {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardTotalPurchase({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardTotalPurchase.fromJson(Map<String, dynamic> json) => DashboardTotalPurchase(
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
