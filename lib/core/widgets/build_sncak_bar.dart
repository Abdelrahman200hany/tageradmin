import 'package:flutter/material.dart';

void buildSnackBar(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
