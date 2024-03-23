// To parse this JSON data, do
//
//     final dashboardSaleTotalTransaction = dashboardSaleTotalTransactionFromJson(jsonString);

import 'dart:convert';

DashboardSaleTotalTransaction dashboardSaleTotalTransactionFromJson(String str) => DashboardSaleTotalTransaction.fromJson(json.decode(str));

String dashboardSaleTotalTransactionToJson(DashboardSaleTotalTransaction data) => json.encode(data.toJson());

class DashboardSaleTotalTransaction {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardSaleTotalTransaction({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardSaleTotalTransaction.fromJson(Map<String, dynamic> json) => DashboardSaleTotalTransaction(
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
