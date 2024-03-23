// To parse this JSON data, do
//
//     final dashboardCashIn = dashboardCashInFromJson(jsonString);

import 'dart:convert';

DashboardCashIn dashboardCashInFromJson(String str) => DashboardCashIn.fromJson(json.decode(str));

String dashboardCashInToJson(DashboardCashIn data) => json.encode(data.toJson());

class DashboardCashIn {
    int? length;
    String? title;
    List<String>? labels;
    List<int>? values;

    DashboardCashIn({
        this.length,
        this.title,
        this.labels,
        this.values,
    });

    factory DashboardCashIn.fromJson(Map<String, dynamic> json) => DashboardCashIn(
        length: json["length"],
        title: json["title"],
        labels: json["labels"] == null ? [] : List<String>.from(json["labels"]!.map((x) => x)),
        values: json["values"] == null ? [] : List<int>.from(json["values"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "length": length,
        "title": title,
        "labels": labels == null ? [] : List<dynamic>.from(labels!.map((x) => x)),
        "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
    };
}
