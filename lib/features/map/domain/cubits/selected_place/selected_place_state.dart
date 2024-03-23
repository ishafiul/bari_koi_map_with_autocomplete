part of 'selected_place_cubit.dart';

@immutable
sealed class SelectedPlaceState {}

final class SelectedPlaceInitial extends SelectedPlaceState {}

final class SelectedPlaceLoaded extends SelectedPlaceState {
  final Place place;

  SelectedPlaceLoaded(this.place);
}
