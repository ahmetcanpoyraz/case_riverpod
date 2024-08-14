import 'dart:async';
import 'package:case_riverpod/core/constants/navigation_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/base/base_viewmodel.dart';
import '../../core/network/network_data_manager.dart';
import '../../core/utils/alert_dialog_helper.dart';
import '../../core/utils/hive_box_helper.dart';
import '../../data/models/news_model.dart';
import '../../data/models/search_query_model.dart';
import '../../data/repositories/news_repository.dart';
import 'search_state.dart';

class SearchViewmodel extends BaseViewModel<SearchState> {
  SearchViewmodel(this.newsRepository) : super(SearchState.initial()) {
    state.focusNode.addListener(_onFocusChange);
  }

  final NewsRepository newsRepository;
  final Map<String, NewsModel> _cache = {};
  int _currentPage = 1;
  final int _pageSize = 20;
  GlobalKey<FormState> get formKey => state.formKey;
  AutovalidateMode get autovalidateMode => state.autovalidateMode;
  TextEditingController get searchTextController => state.searchTextController;

  @override
  void dispose() {
    state.focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!state.focusNode.hasFocus) {
      toggleHistoryVisibility();
    }
  }

  Future<void> toggleHistoryVisibility() async {
    final isVisible = !state.isHistoryVisible;
    if (isVisible) {
      final history = await HiveBoxHelper.getSearchQueries();
      state = state.copyWith(searchHistory: history, isHistoryVisible: isVisible);
    } else {
      state = state.copyWith(isHistoryVisible: isVisible);
    }
  }

  Future<void> addSearchQuery(String query) async {
    final queryModel = SearchQueryModel(query);
    await HiveBoxHelper.addSearchQuery(queryModel);
    await toggleHistoryVisibility(); // Optionally update history after adding
  }

  Future<void> searchNews(String query, BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      addSearchQuery(query);
      _currentPage = 1;
      setLoading(true);
      if (_cache.containsKey(query)) {
        // Use cached result
        state = state.copyWith(news: _cache[query]);
        setLoading(false);
        context.push(NavigationConstants.resultScreen);
        return;
      } else {
        final result = await newsRepository.fetchNews(query, _currentPage, _pageSize);
        result.fold((error) {
          state = state.copyWith(errorMessage: error);
          AlertDialogHelper.instance.showAlertDialog(context, error);
        }, (newsModel) {
          _cache[query] = newsModel;
          state = state.copyWith(news: newsModel);
          context.push(NavigationConstants.resultScreen);
        });
      }
      setLoading(false);
    } else {
      state = state.copyWith(autovalidateMode: AutovalidateMode.always);
    }
  }

  Future<void> loadMoreNews(String query, BuildContext context) async {
    if (state.news == null || state.news!.articles == null) return;

    _currentPage++;
    final result = await newsRepository.fetchNews(query, _currentPage, _pageSize);
    result.fold((error) {
      AlertDialogHelper.instance.showAlertDialog(context, error);
    }, (newsModel) {
      final currentArticles = state.news!.articles ?? [];
      final newArticles = newsModel.articles ?? [];
      final allArticles = [...currentArticles, ...newArticles];
      final updatedNewsModel = NewsModel(
        status: newsModel.status,
        totalResults: newsModel.totalResults,
        articles: allArticles,
      );
      _cache[query] = updatedNewsModel; // Cache the result
      state = state.copyWith(news: updatedNewsModel);
    });
  }
}

final newsRepositoryProvider = Provider<NewsRepository>(
  (ref) => NewsRepository(NetworkDataManager(Dio())),
);

final searchViewmodelProvider = StateNotifierProvider<SearchViewmodel, SearchState>(
  (ref) => SearchViewmodel(ref.watch(newsRepositoryProvider)),
);
