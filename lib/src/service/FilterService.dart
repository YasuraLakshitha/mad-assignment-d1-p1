import 'package:library_management_system/src/repository/BookRepository.dart';

import '../model/Book.dart';

class FilterService {

  final BookRepository _repository = BookRepository.instance;

  //filter by title
  Set<Book> retrieveByTitle(String value) {
    if (value.isEmpty) {
      throw Exception('Title should not be empty');
    }
    return _repository.filterByTitle(value).toSet();
  }

  //filter by author
  Set<Book> retrieveByAuthor(String value) {
    if (value.isEmpty) {
      throw Exception('Author should not be empty');
    }
    return _repository.filterByAuthor(value).toSet();
  }

  //filter by status
  Set<Book> retrieveByStatus(bool value) {
    return _repository.filterByStatus(value);
  }

}
