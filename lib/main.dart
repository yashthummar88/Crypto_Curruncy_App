import 'dart:io';

import 'package:crypto_curruncy/screens/IOS/ios.dart';
import 'package:crypto_curruncy/screens/android/android.dart';
import 'package:flutter/material.dart';

void main() {
  (Platform.isAndroid == true)
      ? runApp(
          AndroidApp(),
        )
      : runApp(
          IosScreen(),
        );
}
