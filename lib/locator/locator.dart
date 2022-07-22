import 'package:get_it/get_it.dart';
import 'package:zira/feature/book/data/repository/book_repo_impl.dart';
import 'package:zira/feature/book/domain/repository/book_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<BooksRepo>(BooksRepoImpl());
}
