// To parse this JSON data, do
//
//     final dashboardPurchaseTotalTransactions = dashboardPurchaseTotalTransactionsFromJson(jsonString);

import 'dart:convert';

DashboardPurchaseTotalTransactions dashboardPurchaseTotalTransactionsFromJson(String str) => DashboardPurchaseTotalTransactions.fromJson(json.decode(str));

String dashboardPurchaseTotalTransactionsToJson(DashboardPurchaseTotalTransactions data) => json.encode(data.toJson());

class DashboardPurchaseTotalTransactions {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardPurchaseTotalTransactions({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardPurchaseTotalTransactions.fromJson(Map<String, dynamic> json) => DashboardPurchaseTotalTransactions(
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
