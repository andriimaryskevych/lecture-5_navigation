import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:navigation_app/routes.dart';
import 'package:navigation_app/services/navigation.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final NavigationService navigationService;

  TestBloc({
    required this.navigationService,
  }) : super(TestInitial());

  @override
  Stream<TestState> mapEventToState(
    TestEvent event,
  ) async* {
    navigationService.pushNamed(secondPage);
  }
}
