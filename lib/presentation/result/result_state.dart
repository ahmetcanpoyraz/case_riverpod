class ResultState {
  final bool isLoading;

  ResultState({
    this.isLoading = false,
  });

  factory ResultState.initial() {
    return ResultState(
      isLoading: false,
    );
  }

  ResultState copyWith({
    bool? isLoading,
  }) {
    return ResultState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
