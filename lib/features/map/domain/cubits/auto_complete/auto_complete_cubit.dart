import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/repositories/autocomplete_repository.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/usecase/get_autocomplete.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/dio.dart';

part 'auto_complete_state.dart';

class AutoCompleteCubit extends Cubit<AutoCompleteState> {
  final AutocompleteRepository _repository;

  AutoCompleteCubit(this._repository) : super(AutoCompleteInitial());

  Future<void> getAutocomplete(String query) async {
    emit(AutoCompleteLoading());
    final reqQuery = AutocompleteInput(q: query);
    final useCase = GetAutocomplete(_repository);

    late HttpResponse<AutocompleteModel> response;

    try {
      response = await useCase.call(reqQuery);
    } on DioException catch (_) {
      emit(AutoCompleteError(message: "Something went wrong"));
      return;
    }
    emit(AutoCompleteLoaded(model: response.data));
  }
}
