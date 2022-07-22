import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zira/feature/book/domain/model/book_model.dart';
import 'package:zira/feature/book/domain/repository/book_repo.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required this.booksRepo}) : super(BooksInitial()) {
    on<FetchBooks>((event, emit) async {
      try {
        emit(BooksLoading());
        emit(BooksSuccess(
            books: await booksRepo.fetchBooks(event.searchItem, event.index),
            index: event.index ?? 0));
      } on HttpException catch (e) {
        emit(BooksFailed(errorMessage: e.message));
      } catch (e) {
        emit(const BooksFailed());
      }
    });
  }

  final BooksRepo booksRepo;
}
