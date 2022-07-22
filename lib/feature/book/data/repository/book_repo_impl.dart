import 'dart:convert';

import 'package:zira/feature/book/domain/model/book_model.dart';
import 'package:zira/feature/book/domain/repository/book_repo.dart';
import 'package:http/http.dart' as http;

class BooksRepoImpl extends BooksRepo {
  @override
  Future<BookModel> fetchBooks(String searchItem, int? index) async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=$searchItem&startIndex=${index ?? 0}'));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return BookModel.fromJson(result);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      rethrow;
    }
  }
}
