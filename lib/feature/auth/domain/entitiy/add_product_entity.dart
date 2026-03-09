import 'dart:io';

class AddProductEntity {
  final String productName, productDes, productCode;
  final int productPrice, unitAmount, numberOfCalories, expretationsMounths;
  final bool isFeature;
  final bool isOrganic;
  final num avgRating = 0, ratingCount = 0;

  final File productImageFile;
  String? productImage;

  AddProductEntity({
    required this.productName,
    required this.productDes,
    required this.productCode,
    required this.productPrice,
    required this.unitAmount,
    required this.numberOfCalories,
    required this.expretationsMounths,
    required this.isFeature,
    required this.productImageFile,
    this.productImage,
     this.isOrganic = false,
  });
}
