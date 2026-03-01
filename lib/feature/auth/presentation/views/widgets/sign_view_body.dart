import 'package:flutter/material.dart';
import 'package:tageradmin/core/consts/consts.dart';
import 'package:tageradmin/core/utils/app_color.dart';
import 'package:tageradmin/core/widgets/custom_app_bar.dart';
import 'package:tageradmin/core/widgets/custom_text_bottom.dart';
import 'package:tageradmin/core/widgets/custom_text_form_feild.dart';
import 'package:tageradmin/core/widgets/custom_text_form_feild_for_password.dart';

class SignViewBody extends StatelessWidget {
  const SignViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تسجيل دخول '),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: ListView(
          children: [
            SizedBox(height: 36),
            CustomTextFormFeild(
              hint: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormFieldForPasswoed(),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomTextBottom(
                text: 'نسيت كلمة المرور؟',
                textColor: AppColor.kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
