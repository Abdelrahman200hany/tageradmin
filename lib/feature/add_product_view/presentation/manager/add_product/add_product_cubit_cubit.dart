import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:tageradmin/core/repos/add_product/add_product_repo.dart';
import 'package:tageradmin/core/repos/image_repo/image_repo.dart';
import 'package:tageradmin/feature/add_product_view/domain/entitiy/add_product_entity.dart';

part 'add_product_cubit_state.dart';

class AddProductCubit extends Cubit<AddProductCubitState> {
  AddProductCubit(this.imageRepo, this.addProductRepo)
    : super(AddProductCubitInitial());
  final ImageRepo imageRepo;
  final AddProductRepo addProductRepo;

  Future<void> addProduct({required AddProductEntity product}) async {
    emit(AddProductCubitLoading());
    var result = await imageRepo.upLoadedIamge(product.productImageFile);
    result.fold(
      (faulire) {
        emit(AddProductCubitFaulire(faulire.faulireMessage));
      },
      (url) async {
        product.productImage = url;
        var result = await addProductRepo.addProduct(product);

        result.fold(
          (faulire) {
            emit(AddProductCubitFaulire(faulire.faulireMessage));
          },
          (success) {
            emit(AddProductCubitSuccess());
          },
        );
      },
    );
  }
}
