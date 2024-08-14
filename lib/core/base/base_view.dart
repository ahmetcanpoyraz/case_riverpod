import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class BaseView<T extends StateNotifier<State>, State> extends ConsumerWidget {
  final void Function(T viewModel)? onModelReady;
  final T Function(WidgetRef ref) viewModelBuilder;
  final Widget Function(BuildContext context, WidgetRef ref, T viewModel) builder;

  const BaseView({
    super.key,
    this.onModelReady,
    required this.viewModelBuilder,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = viewModelBuilder(ref);
    if (onModelReady != null) {
      onModelReady!(viewModel);
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Test Case",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.h),
            child: builder(context, ref, viewModel),
          )),
    );
  }
}
