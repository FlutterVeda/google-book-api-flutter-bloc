import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira/feature/book/domain/repository/book_repo.dart';
import 'package:zira/feature/book/presentation/bloc/books_bloc.dart';
import 'package:zira/locator/locator.dart';
import 'package:zira/router/router.gr.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocProvider(
      create: (context) => BooksBloc(booksRepo: getIt<BooksRepo>()),
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
