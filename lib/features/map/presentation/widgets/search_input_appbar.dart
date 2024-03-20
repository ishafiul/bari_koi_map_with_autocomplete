import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/core/cubits/zoom_drawer/zoom_drawer_cubit.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInputAppBar extends StatelessWidget {
  const SearchInputAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.50.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.50.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.50.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.50.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.50.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          outlineBorder: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).w,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27.50.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            readOnly: true,
            onTap: () async {
              print("object");
              await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            decoration: InputDecoration(
              prefixIcon: Align(
                widthFactor: 1.5,
                child: IconButton(
                  onPressed: () {
                    context.read<ZoomDrawerMenuCubit>().toggle();
                  },
                  icon: Icon(
                    Icons.search,
                    size: 24.r,
                  ),
                ),
              ),
              hintText: 'Search here',
              hintStyle: TextStyle(
                color: AppColor.primary,
                fontSize: 14.r,
                fontFamily: 'Graphik',
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: Align(
                widthFactor: 1.5,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 24.r,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
