// To parse this JSON data, do
//
//     final cartProduct = cartProductFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

CartProduct cartProductFromJson(String str) => CartProduct.fromJson(json.decode(str));

String cartProductToJson(CartProduct data) => json.encode(data.toJson());

class CartProduct {
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
    String? image;
    String? brand;
    int? variantStock;
    RxInt? quantity;
    RxInt? subTotal;

    CartProduct({
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
        this.image,
        this.brand,
        this.variantStock,
        this.quantity,
        this.subTotal,
    });

    factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
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
        image: json["image"],
        brand: json["brand"],
        variantStock: json["variant_stock"],
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
        "image": image,
        "brand": brand,
        "variant_stock": variantStock,
    };
}
