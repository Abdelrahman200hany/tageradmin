import 'package:flutter/material.dart';
import 'package:tageradmin/core/utils/app_style.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hint,
    this.suffixIcon,
    required this.textInputType,
    this.isHidden = false,
    this.onSaved,
    this.maxLines = 1,
  });

  final String hint;
  final IconButton? suffixIcon;
  final TextInputType textInputType;
  final bool isHidden;
  final int maxLines;

  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:maxLines==1?54 : null,
      width: double.infinity,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        obscureText: isHidden,
        keyboardType: textInputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          fillColor: const Color(0xffF9FAFA),

          filled: true,
          hintText: hint,
          hintStyle: AppStyle.styleBold13(context),
          suffixIcon: suffixIcon,

          border: buildBoreder(),

          enabledBorder: buildBoreder(),
          focusedBorder: buildBoreder(),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBoreder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(width: 1, color: const Color(0xFFE6E9E9)),
  );
}
