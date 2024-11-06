import 'package:library_management_system/repository/BookRepository.dart';

import '../model/Book.dart';

class FilterService {
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

  Set<Book> retrieveByAuthor(String value) {
    if (value.isEmpty) {
      throw Exception('Author should not be empty');
    }
    return repository.filterByAuthor(value);
  }
}
