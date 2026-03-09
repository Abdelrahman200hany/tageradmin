import 'package:dartz/dartz.dart';
import 'package:tageradmin/core/errors/faulire.dart';
import 'package:tageradmin/feature/auth/domain/entitiy/add_product_entity.dart';

abstract class AddProductRepo {
  Future<Either<Faulire, void>> addProduct(
    AddProductEntity addProductEntity,
  );
}
