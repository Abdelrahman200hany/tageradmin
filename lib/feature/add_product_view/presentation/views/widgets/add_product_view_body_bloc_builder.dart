import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tageradmin/core/widgets/build_sncak_bar.dart';
import 'package:tageradmin/feature/add_product_view/presentation/manager/add_product/add_product_cubit_cubit.dart';
import 'package:tageradmin/feature/add_product_view/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductCubitState>(
      listener: (context, state) {
        if (state is AddProductCubitSuccess) {
          buildSnackBar(context, 'تم اضافه المنتج بنجاح ');
        }
        if (state is AddProductCubitFaulire) {
          buildSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is AddProductCubitLoading ? true : false,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
