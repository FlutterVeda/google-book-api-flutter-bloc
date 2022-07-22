part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object?> get props => [];
}

class FetchBooks extends BooksEvent {
  const FetchBooks({required this.searchItem, this.index});

  final String searchItem;
  final int? index;

  @override
  List<Object?> get props => [searchItem, index];
}
