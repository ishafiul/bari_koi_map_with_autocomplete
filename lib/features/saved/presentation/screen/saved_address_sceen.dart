import 'package:bari_koi_map_with_autocomplete/app/app_router.dart';
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
      body: Center(
          child: GestureDetector(
              onTap: () {
                router.go('/');
              },
              child: Text("Saved Address Screen"))),
    );
  }
}
