part of 'books_bloc.dart';

abstract class BooksState extends Equatable {
  const BooksState();
  @override
  List<Object?> get props => [];
}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksSuccess extends BooksState {
  const BooksSuccess({this.books, required this.index});

  final BookModel? books;
  final int index;

  @override
  List<Object?> get props => [books, index];
}

class BooksFailed extends BooksState {
  const BooksFailed({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
