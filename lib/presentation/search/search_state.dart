import 'package:flutter/cupertino.dart';
import '../../data/models/news_model.dart';
import '../../data/models/search_query_model.dart';

class SearchState {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final TextEditingController searchTextController;
  final NewsModel? news;
  final String? errorMessage;
  final bool isLoading;
  final List<SearchQueryModel>? searchHistory;
  final bool isHistoryVisible;
  final FocusNode focusNode;

  SearchState({
    required this.formKey,
    required this.autovalidateMode,
    required this.searchTextController,
    this.news,
    this.errorMessage,
    this.isLoading = false,
    this.searchHistory,
    this.isHistoryVisible = false,
    required this.focusNode,
  });

  factory SearchState.initial() {
    return SearchState(
        formKey: GlobalKey<FormState>(),
        autovalidateMode: AutovalidateMode.disabled,
        searchTextController: TextEditingController(),
        searchHistory: [],
        isHistoryVisible: false,
        focusNode: FocusNode());
  }

  SearchState copyWith({
    NewsModel? news,
    String? errorMessage,
    AutovalidateMode? autovalidateMode,
    TextEditingController? searchTextController,
    bool? isLoading,
    List<SearchQueryModel>? searchHistory,
    bool? isHistoryVisible,
  }) {
    return SearchState(
      formKey: formKey,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      searchTextController: searchTextController ?? this.searchTextController,
      news: news ?? this.news,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      searchHistory: searchHistory ?? this.searchHistory,
      isHistoryVisible: isHistoryVisible ?? this.isHistoryVisible,
      focusNode: focusNode,
    );
  }
}
