import 'package:bari_koi_map_with_autocomplete/app/app_router.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/custom_icons_icons.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/cubits/auto_complete/auto_complete_cubit.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/cubits/selected_place/selected_place_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPlaceTile extends StatelessWidget {
  const SearchPlaceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoCompleteCubit, AutoCompleteState>(
      builder: (context, state) {
        if (state is AutoCompleteLoaded) {
          return ListView.builder(
            itemCount: state.places.places.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    router.pop();
                    router.go('/');
                    context
                        .read<SelectedPlaceCubit>()
                        .setSelectedPlace(state.places.places[index]);
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  leading: const Icon(
                    CustomIcons.location_1,
                    color: AppColor.secondary,
                  ),
                  title: Text(state.places.places[index].address ?? ''),
                  subtitle: Row(
                    children: [
                      Text(state.places.places[index].area ?? ''),
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
                        child: Text(state.places.places[index].pType ?? ''),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
