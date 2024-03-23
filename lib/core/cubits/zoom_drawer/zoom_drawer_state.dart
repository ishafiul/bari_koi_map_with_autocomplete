part of 'zoom_drawer_cubit.dart';

@immutable
sealed class ZoomDrawerMenuState {}

final class ZoomDrawerInitial extends ZoomDrawerMenuState {}

final class ZoomDrawerToggle extends ZoomDrawerMenuState {}
