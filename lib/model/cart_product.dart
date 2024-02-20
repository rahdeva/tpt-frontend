import 'package:get/get.dart';

class CartProduct {
    int? productId;
    String? productName;
    int? eceranId;
    int? salePrice;
    int? stock;
    RxInt? quantity;
    RxInt? subTotal;
    String? image;

    CartProduct({
        this.productId,
        this.productName,
        this.eceranId,
        this.salePrice,
        this.stock,
        this.quantity,
        this.subTotal,
        this.image,
    });

    factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        productId: json["product_id"],
        productName: json["product_name"],
        eceranId: json["eceran_id"],
        salePrice: json["sale_price"],
        stock: json["stock"],
        quantity: json["quantity"],
        subTotal: json["subTotal"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "eceran_id": eceranId,
        "sale_price": salePrice,
        "stock": stock,
        "quantity": quantity,
        "subTotal": subTotal,
        "image": image,
    };
}
