import 'package:dartz/dartz.dart';
import 'package:tageradmin/core/errors/faulire.dart';
import 'package:tageradmin/feature/add_product_view/domain/entitiy/add_product_entity.dart';

abstract class AddProductRepo {
  Future<Either<Faulire, void>> addProduct(
    AddProductEntity addProductEntity,
  );
}
