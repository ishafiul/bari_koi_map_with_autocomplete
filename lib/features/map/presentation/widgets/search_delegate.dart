import 'package:bari_koi_map_with_autocomplete/bootstrap.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/cubits/auto_complete/auto_complete_cubit.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/serch_place_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchDelegate extends SearchDelegate<Place> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: SvgPicture.asset(
          'assets/images/svg/close.svg',
          color: AppColor.secondary,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/images/svg/arrow_left.svg',
        color: AppColor.secondary,
      ),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    logger.d(query);
    context.read<AutoCompleteCubit>().getAutocomplete(query);
    return const SearchPlaceTile();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context
        .read<AutoCompleteCubit>()
        .getAutocomplete(query); // if need letter by letter search
    return const SearchPlaceTile();
  }
}
