import 'package:case_riverpod/core/constants/colors.dart';
import 'package:case_riverpod/presentation/result/result_state.dart';
import 'package:case_riverpod/presentation/result/result_viewmodel.dart';
import 'package:case_riverpod/presentation/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/base/base_view.dart';
import '../../core/widgets/custom_cached_network_image.dart';
import '../search/search_viewmodel.dart';
part 'result_widgets.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ResultViewModel, ResultState>(
      viewModelBuilder: (ref) => ref.watch(resultViewModelProvider.notifier),
      builder: (context, ref, viewModel) {
        final state = ref.watch(resultViewModelProvider);
        final searchState = ref.watch(searchViewmodelProvider);
        return searchState.news?.articles?.isEmpty != null &&
                searchState.news!.articles!.isEmpty
            ? Center(
                child: Text(
                  "No Data Found",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            : state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemCount: searchState.news?.articles?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (index == (searchState.news?.articles?.length ?? 0) - 1) {
                        ref.read(searchViewmodelProvider.notifier).loadMoreNews(
                              searchState.searchTextController.text,
                              context,
                            );
                      }
                      return ResultListItem(
                        searchState: searchState,
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                  );
      },
    );
  }
}
