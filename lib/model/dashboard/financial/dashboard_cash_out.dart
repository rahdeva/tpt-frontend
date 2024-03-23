// To parse this JSON data, do
//
//     final dashboardCashOut = dashboardCashOutFromJson(jsonString);

import 'dart:convert';

DashboardCashOut dashboardCashOutFromJson(String str) => DashboardCashOut.fromJson(json.decode(str));

String dashboardCashOutToJson(DashboardCashOut data) => json.encode(data.toJson());

class DashboardCashOut {
    int? length;
    String? title;
    List<String>? labels;
    List<int>? values;

    DashboardCashOut({
        this.length,
        this.title,
        this.labels,
        this.values,
    });

    factory DashboardCashOut.fromJson(Map<String, dynamic> json) => DashboardCashOut(
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
