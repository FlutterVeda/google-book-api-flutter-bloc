import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira/feature/book/presentation/bloc/books_bloc.dart';

class BookListScreen extends StatelessWidget {
  BookListScreen({Key? key}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: textEditingController,
                  ),
                ),
                TextButton(
                  onPressed: () => context
                      .read<BooksBloc>()
                      .add(FetchBooks(searchItem: textEditingController.text)),
                  child: const Text('Search Books'),
                )
              ],
            ),
            BlocBuilder<BooksBloc, BooksState>(
              builder: (context, state) {
                if (state is BooksLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is BooksSuccess) {
                  final books = state.books?.items;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: books?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: ClipOval(
                          child: CachedNetworkImage(
                            width: 64,
                            height: 64,
                            imageUrl: books?[index]
                                    .volumeInfo
                                    ?.imageLinks
                                    ?.smallThumbnail ??
                                '',
                            errorWidget: (_, __, ___) {
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        title: Text(books?[index].volumeInfo?.title ?? ''),
                        subtitle:
                            Text(books?[index].volumeInfo?.subtitle ?? ''),
                      );
                    },
                  );
                } else if (state is BooksFailed) {
                  return Center(
                    child: Text(state.errorMessage ?? 'Something went wrong!'),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        bottomNavigationBar: BlocBuilder<BooksBloc, BooksState>(
          builder: (context, state) {
            return BottomAppBar(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: (state is BooksSuccess)
                          ? (state.index == 0)
                              ? null
                              : () => context.read<BooksBloc>().add(
                                    FetchBooks(
                                      searchItem: textEditingController.text,
                                      index: state.index - 10,
                                    ),
                                  )
                          : null,
                      child: const Text('Previous'),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: 4,
                    height: 30,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: (state is BooksSuccess)
                          ? () => context.read<BooksBloc>().add(
                                FetchBooks(
                                  searchItem: textEditingController.text,
                                  index: state.index + 10,
                                ),
                              )
                          : null,
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
