// To parse this JSON data, do
//
//     final productDetailResponse = productDetailResponseFromJson(jsonString);

import 'dart:convert';

ProductDetailResponse productDetailResponseFromJson(String str) => ProductDetailResponse.fromJson(json.decode(str));

String productDetailResponseToJson(ProductDetailResponse data) => json.encode(data.toJson());

class ProductDetailResponse {
    Data? data;
    String? error;

    ProductDetailResponse({
        this.data,
        this.error,
    });

    factory ProductDetailResponse.fromJson(Map<String, dynamic> json) => ProductDetailResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "error": error,
    };
}

class Data {
    ProductDetail? product;

    Data({
        this.product,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        product: json["product"] == null ? null : ProductDetail.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
    };
}

class ProductDetail {
    int? productId;
    int? categoryId;
    String? categoryName;
    String? productName;
    String? unit;
    String? brand;
    int? stock;
    int? totalVariant;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<ProductDetailVariant>? productVariant;

    ProductDetail({
        this.productId,
        this.categoryId,
        this.categoryName,
        this.productName,
        this.unit,
        this.brand,
        this.stock,
        this.totalVariant,
        this.createdAt,
        this.updatedAt,
        this.productVariant,
    });

    factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        productId: json["product_id"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        productName: json["product_name"],
        unit: json["unit"],
        brand: json["brand"],
        stock: json["stock"],
        totalVariant: json["total_variant"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        productVariant: json["product_variant"] == null ? [] : List<ProductDetailVariant>.from(json["product_variant"]!.map((x) => ProductDetailVariant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "category_id": categoryId,
        "category_name": categoryName,
        "product_name": productName,
        "unit": unit,
        "brand": brand,
        "stock": stock,
        "total_variant": totalVariant,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_variant": productVariant == null ? [] : List<dynamic>.from(productVariant!.map((x) => x.toJson())),
    };
}

class ProductDetailVariant {
    int? productVariantId;
    String? variantName;
    String? productVariantCode;
    String? productVariantName;
    int? productQuantity;
    int? purchasePrice;
    int? salePrice;
    String? image;

    ProductDetailVariant({
        this.productVariantId,
        this.variantName,
        this.productVariantCode,
        this.productVariantName,
        this.productQuantity,
        this.purchasePrice,
        this.salePrice,
        this.image,
    });

    factory ProductDetailVariant.fromJson(Map<String, dynamic> json) => ProductDetailVariant(
        productVariantId: json["product_variant_id"],
        variantName: json["variant_name"],
        productVariantCode: json["product_variant_code"],
        productVariantName: json["product_variant_name"],
        productQuantity: json["product_quantity"],
        purchasePrice: json["purchase_price"],
        salePrice: json["sale_price"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "product_variant_id": productVariantId,
        "variant_name": variantName,
        "product_variant_code": productVariantCode,
        "product_variant_name": productVariantName,
        "product_quantity": productQuantity,
        "purchase_price": purchasePrice,
        "sale_price": salePrice,
        "image": image,
    };
}
