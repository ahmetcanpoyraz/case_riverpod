import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseViewModel<State> extends StateNotifier<State> {
  BaseViewModel(super.state);

  void setLoading(bool isLoading) {
    state = (state as dynamic).copyWith(isLoading: isLoading);
  }
}
