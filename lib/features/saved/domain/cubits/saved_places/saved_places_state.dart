part of 'saved_places_cubit.dart';

@immutable
sealed class SavedPlacesState {}

final class SavedPlacesInitial extends SavedPlacesState {}

final class SavedPlacesLoading extends SavedPlacesState {}

final class SavedPlacesLoaded extends SavedPlacesState {
  final List<Saved> savedPlaces;

  SavedPlacesLoaded({required this.savedPlaces});
}

final class SavedPlacesError extends SavedPlacesState {
  final String message;

  SavedPlacesError({required this.message});
}
