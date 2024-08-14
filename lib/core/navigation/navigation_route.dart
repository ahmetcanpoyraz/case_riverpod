import 'package:case_riverpod/core/constants/navigation_constants.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/result/result_view.dart';
import '../../presentation/search/search_view.dart';
import 'custom_transitions.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: NavigationConstants.searchScreen,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: NavigationConstants.resultScreen,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context, state: state, child: const ResultView()),
      ),
    ],
  );
}
