// To parse this JSON data, do
//
//     final dashboardTotalCashByType = dashboardTotalCashByTypeFromJson(jsonString);

import 'dart:convert';

DashboardTotalCashByType dashboardTotalCashByTypeFromJson(String str) => DashboardTotalCashByType.fromJson(json.decode(str));

String dashboardTotalCashByTypeToJson(DashboardTotalCashByType data) => json.encode(data.toJson());

class DashboardTotalCashByType {
    int? length;
    String? title;
    List<String>? labels;
    List<int>? values;

    DashboardTotalCashByType({
        this.length,
        this.title,
        this.labels,
        this.values,
    });

    factory DashboardTotalCashByType.fromJson(Map<String, dynamic> json) => DashboardTotalCashByType(
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
