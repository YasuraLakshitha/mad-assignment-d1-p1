import 'package:library_management_system/src/repository/BookRepository.dart';

import '../model/Book.dart';

class BookService {
  BookRepository repository = BookRepository();

  Book saveBook(Book book) {
    return repository.save(book);
  }

  bool removeBookById(String value) {
    if (value.isEmpty) throw Exception("ISBN number cannot be null");

    bool isRemoved = repository.remove(value);

    if (isRemoved) return true;

    throw Exception("No such book found");
  }

  List<Book> retrieveAllBooks() {
    return repository.findAll();
  }

  Book updateStatus(String isbn, bool status) {
    if (isbn.isEmpty) {
      throw Exception("ISBN number cannot be empty");
    }
    return repository.updateStatus(isbn, status);
  }
}
