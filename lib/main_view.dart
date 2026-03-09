import 'package:flutter/material.dart';
import 'package:tageradmin/core/consts/consts.dart';
import 'package:tageradmin/core/widgets/custom_text_bottom_with_background.dart';
import 'package:tageradmin/feature/auth/presentation/views/add_product_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'MainView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:kHoriztailPadding ),
          child: Column(
            spacing: 16,
            children: [
              SizedBox(height: 24),
              CustomTextBottomWithBackground(
                text: 'اضافه عنصر جديد',
                ontap: () {
                  Navigator.pushNamed(context, AddProductview.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
