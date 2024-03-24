// To parse this JSON data, do
//
//     final productVariantResponse = productVariantResponseFromJson(jsonString);

import 'dart:convert';

ProductVariantResponse productVariantResponseFromJson(String str) => ProductVariantResponse.fromJson(json.decode(str));

String productVariantResponseToJson(ProductVariantResponse data) => json.encode(data.toJson());

class ProductVariantResponse {
    Data? data;
    String? error;

    ProductVariantResponse({
        this.data,
        this.error,
    });

    factory ProductVariantResponse.fromJson(Map<String, dynamic> json) => ProductVariantResponse(
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
    List<ProductVariant>? productVariant;

    Data({
        this.meta,
        this.productVariant,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        productVariant: json["product_variant"] == null ? [] : List<ProductVariant>.from(json["product_variant"]!.map((x) => ProductVariant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "product_variant": productVariant == null ? [] : List<dynamic>.from(productVariant!.map((x) => x.toJson())),
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

class ProductVariant {
    int? productVariantId;
    int? productId;
    int? categoryId;
    String? categoryName;
    String? variantName;
    String? productVariantCode;
    String? productVariantName;
    int? productQuantity;
    int? purchasePrice;
    int? salePrice;
    int? sold;
    String? image;
    String? brand;
    int? variantStock;
    DateTime? createdAt;
    DateTime? updatedAt;

    ProductVariant({
        this.productVariantId,
        this.productId,
        this.categoryId,
        this.categoryName,
        this.variantName,
        this.productVariantCode,
        this.productVariantName,
        this.productQuantity,
        this.purchasePrice,
        this.salePrice,
        this.sold,
        this.image,
        this.brand,
        this.variantStock,
        this.createdAt,
        this.updatedAt,
    });

    factory ProductVariant.fromJson(Map<String, dynamic> json) => ProductVariant(
        productVariantId: json["product_variant_id"],
        productId: json["product_id"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        variantName: json["variant_name"],
        productVariantCode: json["product_variant_code"],
        productVariantName: json["product_variant_name"],
        productQuantity: json["product_quantity"],
        purchasePrice: json["purchase_price"],
        salePrice: json["sale_price"],
        sold: json["sold"],
        image: json["image"],
        brand: json["brand"],
        variantStock: json["variant_stock"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "product_variant_id": productVariantId,
        "product_id": productId,
        "category_id": categoryId,
        "category_name": categoryName,
        "variant_name": variantName,
        "product_variant_code": productVariantCode,
        "product_variant_name": productVariantName,
        "product_quantity": productQuantity,
        "purchase_price": purchasePrice,
        "sale_price": salePrice,
        "sold": sold,
        "image": image,
        "brand": brand,
        "variant_stock": variantStock,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
