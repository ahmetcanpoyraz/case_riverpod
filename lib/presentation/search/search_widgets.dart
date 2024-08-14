part of 'search_view.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
    required this.viewModel,
    required this.focusNode,
  });

  final SearchViewmodel viewModel;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      inputFilterList: [
        LengthLimitingTextInputFormatter(40),
        FilteringTextInputFormatter.allow(RegexsConstants.alphabetRegex)
      ],
      txtController: viewModel.searchTextController,
      keyboardType: TextInputType.name,
      focusNode: focusNode,
      hintText: 'Enter search words of news',
      onTap: () {
        viewModel.toggleHistoryVisibility();
      },
      validator: (name) {
        if (name == null || name.isEmpty) {
          return 'Please enter search word of news';
        } else {
          if (!RegexsConstants.alphabetRegex.hasMatch(name)) {
            return 'Please enter search word of news correctly';
          } else {
            return null;
          }
        }
      },
    );
  }
}

class SearchHistoryWidget extends StatelessWidget {
  const SearchHistoryWidget(
      {super.key, required this.state, required this.viewModel, required this.context1});

  final SearchState state;
  final SearchViewmodel viewModel;
  final BuildContext context1;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 150.h, // Maximum height for the widget
      ),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            for (var queryModel in state.searchHistory ?? [])
              ListTile(
                title: Text(queryModel.query),
                onTap: () {
                  viewModel.searchTextController.text = queryModel.query;
                  viewModel.searchNews(viewModel.searchTextController.text, context1);
                },
              ),
          ],
        ),
      ),
    );
  }
}
