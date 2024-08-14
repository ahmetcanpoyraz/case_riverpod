import 'package:case_riverpod/core/constants/regexs.dart';
import 'package:case_riverpod/core/widgets/custom_button.dart';
import 'package:case_riverpod/presentation/search/search_state.dart';
import 'package:case_riverpod/presentation/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/base/base_view.dart';
import '../../core/widgets/custom_loading_indicator.dart';
import '../../core/widgets/custom_text_form_field.dart';

part 'search_widgets.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewmodel, SearchState>(
      viewModelBuilder: (ref) => ref.watch(searchViewmodelProvider.notifier),
      builder: (context, ref, viewModel) {
        final state = ref.watch(searchViewmodelProvider);
        return Form(
          key: viewModel.formKey,
          autovalidateMode: viewModel.autovalidateMode,
          child: state.isLoading
              ? const Center(child: CustomLoadingIndicator())
              : Column(
                  children: [
                    SearchTextFormField(
                      viewModel: viewModel,
                      focusNode: state.focusNode,
                    ),
                    if (state.isHistoryVisible)
                      Visibility(
                        visible: state.isHistoryVisible,
                        child: SearchHistoryWidget(
                          state: state,
                          viewModel: viewModel,
                          context1: context,
                        ),
                      ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      text: "Search",
                      onPressed: () {
                        viewModel.searchNews(
                            viewModel.searchTextController.text, context);
                      },
                    ),
                  ],
                ),
        );
      },
    );
  }
}
