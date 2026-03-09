import 'package:tageradmin/feature/auth/domain/entitiy/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  AddProductModel({
    required super.productName,
    required super.productDes,
    required super.productCode,
    required super.productPrice,
    required super.isFeature,
    required super.productImageFile,
    super.productImage,
    super.isOrganic,
    required super.unitAmount,
    required super.numberOfCalories,
    required super.expretationsMounths,
  });

  factory AddProductModel.fromEntity(AddProductEntity productEntity) {
    return AddProductModel(
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
