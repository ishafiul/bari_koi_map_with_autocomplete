import 'package:flutter/material.dart';

class SavedAddressAcreen extends StatelessWidget {
  const SavedAddressAcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Address"),
        centerTitle: true,
      ),
      body: const Center(child: Text("Saved Address Screen")),
    );
  }
}
