import 'package:library_management_system/repository/BookRepository.dart';

import '../model/Book.dart';

class BookService {
  BookRepository repository = new BookRepository();

  Book saveBook(Book book) {
    return repository.save(book);
  }

  bool removeBookById(String value) {

    if (value.isEmpty) throw Exception("ISBN number cannot be null");

    bool isRemoved = repository.remove(value);
    if (isRemoved) return true;
    throw Exception("No such book found");
  }

  List<Book> retriveAllBooks() {
    return repository.findAll();
  }
}
