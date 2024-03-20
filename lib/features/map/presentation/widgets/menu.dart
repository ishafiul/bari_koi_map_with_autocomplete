import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 56,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
