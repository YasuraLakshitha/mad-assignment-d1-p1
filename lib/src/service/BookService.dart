import 'package:library_management_system/src/repository/BookRepository.dart';

import '../model/Book.dart';

class BookService {
  final BookRepository _repository = BookRepository.instance;

  Book saveBook(Book book) {
    return _repository.save(book);
  }

  bool removeBookById(String value) {
    if (value.isEmpty) throw Exception("ISBN number cannot be null");

    bool isRemoved = _repository.remove(value);

    if (isRemoved) return true;

    throw Exception("No such book found");
  }

  List<Book> retrieveAllBooks() {
    return _repository.findAll();
  }

  Book updateStatus(String isbn, bool status) {
    if (isbn.isEmpty) {
      throw Exception("ISBN number cannot be empty");
    }
    return _repository.updateStatus(isbn, status);
  }

  Book findById(String isbn) {
    return _repository.findById(isbn);
  }
}
