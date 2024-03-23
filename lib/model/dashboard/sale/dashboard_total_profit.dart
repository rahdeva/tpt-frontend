// To parse this JSON data, do
//
//     final dashboardTotalProfit = dashboardTotalProfitFromJson(jsonString);

import 'dart:convert';

DashboardTotalProfit dashboardTotalProfitFromJson(String str) => DashboardTotalProfit.fromJson(json.decode(str));

String dashboardTotalProfitToJson(DashboardTotalProfit data) => json.encode(data.toJson());

class DashboardTotalProfit {
    int? length;
    String? title;
    List<String>? label;
    List<int>? value;

    DashboardTotalProfit({
        this.length,
        this.title,
        this.label,
        this.value,
    });

    factory DashboardTotalProfit.fromJson(Map<String, dynamic> json) => DashboardTotalProfit(
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
