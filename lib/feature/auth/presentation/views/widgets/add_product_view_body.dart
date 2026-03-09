import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tageradmin/core/consts/consts.dart';
import 'package:tageradmin/core/utils/app_style.dart';
import 'package:tageradmin/core/widgets/custom_app_bar.dart';
import 'package:tageradmin/core/widgets/custom_chek_box.dart';
import 'package:tageradmin/core/widgets/custom_image_feild.dart';
import 'package:tageradmin/core/widgets/custom_text_bottom_with_background.dart';
import 'package:tageradmin/core/widgets/custom_text_form_feild.dart';
import 'package:tageradmin/feature/auth/domain/entitiy/add_product_entity.dart';
import 'package:tageradmin/feature/auth/presentation/manager/add_product/add_product_cubit_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String productName, productdes, productCode, data;
  late int productPrice, unitAmount, numberOfCalories, expretationsMounths;
  bool isFeature = false;
  File? productImageFile;
  bool isorganic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'اضافة عنصر ', wantedIconBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: 36),
              CustomTextFormFeild(
                onSaved: (value) {
                  productName = value!;
                },
                hint: 'اسم العنصر ',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                onSaved: (value) {
                  productdes = value!;
                },

                maxLines: 5,
                hint: 'وصف العنصر',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                onSaved: (value) {
                  numberOfCalories = int.parse(value!);
                },

                hint: 'السعرات',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                onSaved: (value) {
                  unitAmount = int.parse(value!);
                },

                hint: 'الوحدات',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                onSaved: (value) {
                  expretationsMounths = int.parse(value!);
                },

                hint: 'انتهاء الصلاحيه خلال الشهور ',
                textInputType: TextInputType.number,
              ),

              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFeild(
                      onSaved: (value) {
                        productPrice = int.parse(value!);
                      },

                      hint: 'السعر',
                      textInputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 26),
                  Expanded(
                    child: CustomTextFormFeild(
                      onSaved: (value) {
                        productCode = value!.toLowerCase().trim();
                      },

                      hint: 'الكود',
                      textInputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  CustomChekBox(
                    onChanged: (value) {
                      isFeature = value;
                    },
                  ),
                  SizedBox(width: 8),
                  Text(
                    'هل هو مميز',
                    style: AppStyle.styleBold19(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  CustomChekBox(
                    onChanged: (value) {
                      isorganic = value;
                    },
                  ),
                  SizedBox(width: 8),
                  Text(
                    'هل هو طبيعي ',
                    style: AppStyle.styleBold19(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
                ],
              ),

              SizedBox(height: 16),
              ImageFiled(
                onFileChang: (value) {
                  productImageFile = value;
                },
              ),
              SizedBox(height: 24),
              CustomTextBottomWithBackground(
                text: 'تسجيل دخول',
                ontap: () async {
                  if (productImageFile != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      AddProductEntity productEntity = AddProductEntity(
                        isFeature: isFeature,
                        productName: productName,
                        productCode: productCode,
                        productDes: productdes,
                        productPrice: productPrice,
                        productImageFile: productImageFile!,

                        unitAmount: unitAmount,
                        numberOfCalories: numberOfCalories,
                        expretationsMounths: expretationsMounths,
                      );
                      context.read<AddProductCubit>().addProduct(
                        product: productEntity,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    buildSnackBar(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buildSnackBar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('يجب رفه صوره ')));
  }
}
