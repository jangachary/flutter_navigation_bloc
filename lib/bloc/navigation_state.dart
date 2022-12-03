part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationLoaded extends NavigationState {
  final Widget currentPage;

  NavigationLoaded({required this.currentPage});
}
