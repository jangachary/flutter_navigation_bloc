import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation_bloc/screens/dashboard.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<LoadNavigation>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 3));
      emit(NavigationLoaded(currentPage: const DashBoard()));
    });
    on<SwitchNavigation>((event, emit) {
      if (state is NavigationLoaded) {
        final state = this.state as NavigationLoaded;
        Widget child = event.currentPage;
        emit(NavigationLoaded(currentPage: child));
      }
    });
  }
}
