import 'package:bari_koi_map_with_autocomplete/core/config/env.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/repositories/autocomplete_repository.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/services/remote/autocomplete_service.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/usecase/get_autocomplete.dart';
import 'package:dio/dio.dart';
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
          onTap: () async {
            final Dio dio = Dio();
            dio.options = BaseOptions(
              baseUrl: EnvProd.barikoiHost,
              contentType: "application/json",
            );
            final service = AutocompleteService(dio);

            await GetAutocomplete(AutocompleteRepository(service)).call(
              const AutocompleteInput(
                q: "mirpur",
              ),
            );
          },
          child: const Text("Saved Address Screen"),
        ),
      ),
    );
  }
}
