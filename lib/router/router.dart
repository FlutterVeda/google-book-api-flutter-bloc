import 'package:auto_route/auto_route.dart';
import 'package:zira/feature/book/presentation/book_list.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: BookListScreen, initial: true),
  ],
)
class $AppRouter {}
