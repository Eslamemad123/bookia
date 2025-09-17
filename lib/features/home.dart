import 'package:bookia/core/utils/app%20color.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hellowwwwww', style: TextStyle(color: App_Color.black1)),
      ),
      backgroundColor: App_Color.goldPrimary,
    );
  }
}
