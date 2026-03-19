import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tageradmin/core/repos/add_product/add_product_repo.dart';
import 'package:tageradmin/core/repos/image_repo/image_repo.dart';
import 'package:tageradmin/core/serviecs/servies_locator/servies_locator_.dart';
import 'package:tageradmin/feature/add_product_view/presentation/manager/add_product/add_product_cubit_cubit.dart';
import 'package:tageradmin/feature/add_product_view/presentation/views/widgets/add_product_view_body_bloc_builder.dart';

class AddProductview extends StatelessWidget {
  const AddProductview({super.key});
  static const routeName = 'AddProductview';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddProductCubit(getIt.get<ImageRepo>(), getIt.get<AddProductRepo>()),
      child: AddProductViewBodyBlocBuilder(),
    );
  }
}
