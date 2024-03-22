import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selected_place_state.dart';

class SelectedPlaceCubit extends Cubit<SelectedPlaceState> {
  SelectedPlaceCubit() : super(SelectedPlaceInitial());

  void setSelectedPlace(Place place) {
    emit(SelectedPlaceInitial());
    emit(SelectedPlaceLoaded(place));
  }

  void clearSelectedPlace() {
    emit(SelectedPlaceInitial());
  }
}
