part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {
  const NavigationEvent();
}

class LoadNavigation extends NavigationEvent {}

class SwitchNavigation extends NavigationEvent {
  final Widget currentPage;

  const SwitchNavigation(this.currentPage);
  // @override
  // List<Object> get props => [currentPage];
}
