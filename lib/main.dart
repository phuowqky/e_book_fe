import 'package:app_bong_da/core/di/common_features.dart';

import 'package:flutter/material.dart';
import 'app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CommonFeatures.init();
  runApp(
    AppPage(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Book',
      theme: ThemeData.dark(),
    );
  }
}
