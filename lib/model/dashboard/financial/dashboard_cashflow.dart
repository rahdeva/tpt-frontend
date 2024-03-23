// To parse this JSON data, do
//
//     final dashboardCashFlow = dashboardCashFlowFromJson(jsonString);

import 'dart:convert';

DashboardCashFlow dashboardCashFlowFromJson(String str) => DashboardCashFlow.fromJson(json.decode(str));

String dashboardCashFlowToJson(DashboardCashFlow data) => json.encode(data.toJson());

class DashboardCashFlow {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardCashFlow({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardCashFlow.fromJson(Map<String, dynamic> json) => DashboardCashFlow(
        length: json["length"],
        title: json["title"],
        label: json["label"] == null ? [] : List<String>.from(json["label"]!.map((x) => x)),
        value: json["value"] == null ? [] : List<int>.from(json["value"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "length": length,
        "title": title,
        "label": label == null ? [] : List<dynamic>.from(label!.map((x) => x)),
        "value": value == null ? [] : List<dynamic>.from(value!.map((x) => x)),
    };
}
