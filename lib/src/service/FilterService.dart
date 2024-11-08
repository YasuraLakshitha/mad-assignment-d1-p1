import 'package:library_management_system/src/repository/BookRepository.dart';

import '../model/Book.dart';

class FilterService {

  BookRepository repository = BookRepository();

  //filter by title
  Set<Book> retrieveByTitle(String value) {
    if (value.isEmpty) {
      throw Exception('Title should not be empty');
    }
    return repository.filterByTitle(value);
  }

  //filter by author
  Set<Book> retrieveByAuthor(String value) {
    if (value.isEmpty) {
      throw Exception('Author should not be empty');
    }
    return repository.filterByAuthor(value);
  }

  //filter by status
  Set<Book> retrieveByStatus(bool value) {
    return repository.filterByStatus(value);
  }

}
