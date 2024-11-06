import 'package:library_management_system/repository/BookRepository.dart';

import '../model/Book.dart';

class FilterService {
  //todo: filter by title.
  //todo: filter by author.
  //todo: filter by status.

  BookRepository repository = BookRepository();

  //filter by title
  Set<Book> retrieveByTitle(String value) {
    if (value.isEmpty) {
      throw Exception('Title should not be empty');
    }
    return repository.filterByTitle(value);
  }
}
