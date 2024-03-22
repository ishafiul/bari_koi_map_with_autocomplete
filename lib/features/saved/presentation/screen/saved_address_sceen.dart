import 'package:bari_koi_map_with_autocomplete/app/app_router.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/env.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/custom_icons_icons.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/repositories/autocomplete_repository.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/services/remote/autocomplete_service.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/cubits/selected_place/selected_place_cubit.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/usecase/get_autocomplete.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/domain/cubits/saved_places/saved_places_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedAddressAcreen extends StatefulWidget {
  const SavedAddressAcreen({super.key});

  @override
  State<SavedAddressAcreen> createState() => _SavedAddressAcreenState();
}

class _SavedAddressAcreenState extends State<SavedAddressAcreen> {
  @override
  void initState() {
    super.initState();

    context.read<SavedPlacesCubit>().getSavedPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Address"),
        centerTitle: true,
      ),
      body: BlocBuilder<SavedPlacesCubit, SavedPlacesState>(
        builder: (context, state) {
          if (state is SavedPlacesLoaded) {
            return ListView.builder(
              itemCount: state.savedPlaces.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: ListTile(
                    onTap: () async {
                      final data = Place(
                        id: state.savedPlaces[index].savedPlace!.id!,
                        longitude:
                            state.savedPlaces[index].savedPlace!.longitude!,
                        latitude:
                            state.savedPlaces[index].savedPlace!.latitude!,
                        address: state.savedPlaces[index].savedPlace!.address,
                        addressBn:
                            state.savedPlaces[index].savedPlace!.addressBn,
                        city: state.savedPlaces[index].savedPlace!.city,
                        cityBn: state.savedPlaces[index].savedPlace!.cityBn,
                        area: state.savedPlaces[index].savedPlace!.area,
                        areaBn: state.savedPlaces[index].savedPlace!.areaBn,
                        postCode: state.savedPlaces[index].savedPlace!.postCode,
                        pType: state.savedPlaces[index].savedPlace!.pType,
                        uCode: state.savedPlaces[index].savedPlace!.uCode,
                      );
                      context.read<SelectedPlaceCubit>().setSelectedPlace(data);
                      router.go('/', extra: data);
                    },
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    leading: const Icon(
                      CustomIcons.location_1,
                      color: AppColor.secondary,
                    ),
                    title: Text(
                      state.savedPlaces[index].savedPlace?.address ?? '',
                    ),
                    subtitle: Row(
                      children: [
                        Text(state.savedPlaces[index].savedPlace?.area ?? ''),
                        SizedBox(width: 24.w),
                        Container(
                          height: 24.h,
                          padding: EdgeInsets.symmetric(
                            vertical: 4.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            state.savedPlaces[index].savedPlace?.pType ?? '',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
