part of 'auto_complete_cubit.dart';

@immutable
sealed class AutoCompleteState {}

final class AutoCompleteInitial extends AutoCompleteState {}

final class AutoCompleteLoading extends AutoCompleteState {}

final class AutoCompleteLoaded extends AutoCompleteState {
  final AutocompleteModel places;

  AutoCompleteLoaded({required this.places});
}

final class AutoCompleteError extends AutoCompleteState {
  final String message;

  AutoCompleteError({required this.message});
}
