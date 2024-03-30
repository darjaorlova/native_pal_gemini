import 'package:flutter/material.dart';
import 'package:native_pal_gemini/app/native_pal_app.dart';

const GEMINI_API_KEY = String.fromEnvironment(
  'GEMINI_API_KEY',
  defaultValue: '',
);

void main() {
  runApp(const NativePalApp());
}
