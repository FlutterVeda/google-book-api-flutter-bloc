// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../feature/book/presentation/book_list.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    BookListScreen.name: (routeData) {
      final args = routeData.argsAs<BookListScreenArgs>(
          orElse: () => const BookListScreenArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.BookListScreen(key: args.key));
    }
  };

  @override
  List<_i2.RouteConfig> get routes =>
      [_i2.RouteConfig(BookListScreen.name, path: '/')];
}

/// generated route for
/// [_i1.BookListScreen]
class BookListScreen extends _i2.PageRouteInfo<BookListScreenArgs> {
  BookListScreen({_i3.Key? key})
      : super(BookListScreen.name,
            path: '/', args: BookListScreenArgs(key: key));

  static const String name = 'BookListScreen';
}

class BookListScreenArgs {
  const BookListScreenArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'BookListScreenArgs{key: $key}';
  }
}
