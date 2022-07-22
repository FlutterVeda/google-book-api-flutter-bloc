import 'package:zira/feature/book/domain/model/book_model.dart';

abstract class BooksRepo {
  Future<BookModel> fetchBooks(String searchItem, int? index);
}
