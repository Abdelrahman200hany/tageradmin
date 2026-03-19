import 'dart:io';

import 'package:tageradmin/feature/add_product_view/data/models/review_model.dart';
import 'package:tageradmin/feature/add_product_view/domain/entitiy/add_product_entity.dart';

class AddProductModel {
  final String productName, productDes, productCode;
  final int productPrice, unitAmount, numberOfCalories, expretationsMounths;
  final bool isFeature;
  final bool isOrganic;
  final num avgRating = 0, ratingCount = 0;
  final List<ReviewModel> reviews;

  final File productImageFile;
  String? productImage;

  AddProductModel({
    required this.productName,
    required this.productDes,
    required this.productCode,
    required this.productPrice,
    required this.unitAmount,
    required this.numberOfCalories,
    required this.expretationsMounths,
    required this.isFeature,
    required this.isOrganic,
    required this.reviews,
    required this.productImageFile,
    this.productImage,
  });

  factory AddProductModel.fromEntity(AddProductEntity productEntity) {
    return AddProductModel(
      reviews: productEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
      expretationsMounths: productEntity.expretationsMounths,
      numberOfCalories: productEntity.numberOfCalories,
      unitAmount: productEntity.unitAmount,
      productCode: productEntity.productCode,
      isFeature: productEntity.isFeature,
      productDes: productEntity.productDes,
      productPrice: productEntity.productPrice,
      productName: productEntity.productName,
      productImageFile: productEntity.productImageFile,
      productImage: productEntity.productImage,
      isOrganic: productEntity.isOrganic,
    );
  }
  toMap() {
    return {
      'reviews': reviews.map((e) => e.toMap()).toList(),
      'productCode': productCode,
      'isFeature': isFeature,
      'productDes': productDes,
      'productPrice': productPrice,
      'productName': productName,
      // 'productImageFile': productImageFile,
      'productImage': productImage,
      'expretationsMounths': expretationsMounths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
    };
  }
}
