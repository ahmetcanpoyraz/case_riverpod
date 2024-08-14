import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/base/base_viewmodel.dart';
import 'result_state.dart';

class ResultViewModel extends BaseViewModel<ResultState> {
  ResultViewModel() : super(ResultState.initial());

  Future<void> changeIsLoading(bool value) async {
    setLoading(value);
  }
}

final resultViewModelProvider = StateNotifierProvider<ResultViewModel, ResultState>(
  (ref) => ResultViewModel(),
);
