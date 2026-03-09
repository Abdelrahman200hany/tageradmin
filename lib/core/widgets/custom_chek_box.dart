import 'package:flutter/material.dart';

class CustomChekBox extends StatefulWidget {
  const CustomChekBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<CustomChekBox> createState() => _CustomChekBoxState();
}

class _CustomChekBoxState extends State<CustomChekBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (value) {
        isChecked = value!;
        widget.onChanged(isChecked);
        setState(() {});
      },
    );
  }
}
