import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'zoom_drawer_state.dart';

class ZoomDrawerMenuCubit extends Cubit<ZoomDrawerMenuState> {
  ZoomDrawerMenuCubit() : super(ZoomDrawerInitial());

  void toggle() => emit(ZoomDrawerToggle());
}
