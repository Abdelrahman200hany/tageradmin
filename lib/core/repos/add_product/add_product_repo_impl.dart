import 'package:dartz/dartz.dart';
import 'package:tageradmin/core/errors/faulire.dart';
import 'package:tageradmin/core/repos/add_product/add_product_repo.dart';
import 'package:tageradmin/core/serviecs/data_base/database_servies.dart';
import 'package:tageradmin/feature/add_product_view/data/models/add_product_model.dart';
import 'package:tageradmin/feature/add_product_view/domain/entitiy/add_product_entity.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DatabaseServies databaseServies;

  AddProductRepoImpl(this.databaseServies);
  @override
  Future<Either<Faulire, void>> addProduct(
    AddProductEntity addProductEntity,
  ) async {
    try {
      await databaseServies.addData(
        path: 'products',
        data: AddProductModel.fromEntity(addProductEntity).toMap(),
      );
      return const Right(null);
    } catch (e) {
      return left(
        ServierFaulire('opps there wan an error while AddData to DataBase'),
      );
    }
  }
}
