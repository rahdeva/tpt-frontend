// To parse this JSON data, do
//
//     final saleDetailResponse = saleDetailResponseFromJson(jsonString);

import 'dart:convert';

SaleDetailResponse saleDetailResponseFromJson(String str) => SaleDetailResponse.fromJson(json.decode(str));

String saleDetailResponseToJson(SaleDetailResponse data) => json.encode(data.toJson());

class SaleDetailResponse {
    Data? data;
    String? error;

    SaleDetailResponse({
        this.data,
        this.error,
    });

    factory SaleDetailResponse.fromJson(Map<String, dynamic> json) => SaleDetailResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "error": error,
    };
}

class Data {
    Meta? meta;
    List<SaleDetail>? saleDetail;
    int? saleId;

    Data({
        this.meta,
        this.saleDetail,
        this.saleId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        saleDetail: json["sale_detail"] == null ? [] : List<SaleDetail>.from(json["sale_detail"]!.map((x) => SaleDetail.fromJson(x))),
        saleId: json["sale_id"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "sale_detail": saleDetail == null ? [] : List<dynamic>.from(saleDetail!.map((x) => x.toJson())),
        "sale_id": saleId,
    };
}

class Meta {
    int? limit;
    int? page;
    int? totalPage;
    int? totalItems;

    Meta({
        this.limit,
        this.page,
        this.totalPage,
        this.totalItems,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        limit: json["limit"],
        page: json["page"],
        totalPage: json["total_page"],
        totalItems: json["total_items"],
    );

    Map<String, dynamic> toJson() => {
        "limit": limit,
        "page": page,
        "total_page": totalPage,
        "total_items": totalItems,
    };
}

class SaleDetail {
    int? saleDetailId;
    int? saleId;
    int? productVariantId;
    String? variantName;
    String? productVariantCode;
    String? productVariantName;
    int? productQuantity;
    int? salePrice;
    int? quantity;
    int? subtotal;
    DateTime? createdAt;
    DateTime? updatedAt;

    SaleDetail({
        this.saleDetailId,
        this.saleId,
        this.productVariantId,
        this.variantName,
        this.productVariantCode,
        this.productVariantName,
        this.productQuantity,
        this.salePrice,
        this.quantity,
        this.subtotal,
        this.createdAt,
        this.updatedAt,
    });

    factory SaleDetail.fromJson(Map<String, dynamic> json) => SaleDetail(
        saleDetailId: json["sale_detail_id"],
        saleId: json["sale_id"],
        productVariantId: json["product_variant_id"],
        variantName: json["variant_name"],
        productVariantCode: json["product_variant_code"],
        productVariantName: json["product_variant_name"],
        productQuantity: json["product_quantity"],
        salePrice: json["sale_price"],
        quantity: json["quantity"],
        subtotal: json["subtotal"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "sale_detail_id": saleDetailId,
        "sale_id": saleId,
        "product_variant_id": productVariantId,
        "variant_name": variantName,
        "product_variant_code": productVariantCode,
        "product_variant_name": productVariantName,
        "product_quantity": productQuantity,
        "sale_price": salePrice,
        "quantity": quantity,
        "subtotal": subtotal,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
