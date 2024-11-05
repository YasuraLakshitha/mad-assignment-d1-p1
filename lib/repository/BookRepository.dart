import 'dart:ffi';

import '../model/Book.dart';

class BookRepository {
  final Set<Book> bookList = {};

  Book save(Book book) {
    bookList.add(book);
    return book;
  }

  bool remove(String value) {
    Book? book = bookList.firstWhere((book) => value == book.isbn,
        orElse: () => new Book('', '', '', false));
    return book.isbn.isNotEmpty ? bookList.remove(book) : false;
  }

  List<Book> findAll() {
    return bookList.toList();
  }

  Book updateStatus(String isbn, bool status) {
    if (isbn.isEmpty) {
      throw Exception("ISBN number cannot be empty");
    }

    Book book = findById(isbn);

    if (book.isbn.isEmpty) {
      throw Exception("No such book found");
    }

    book.isUnavailable = status;

    return book;
  }

  Book findById(String isbn) {
    Book book = bookList.firstWhere((element) => element.isbn == isbn,
        orElse: () => new Book('', '', '', false));

    return book;
  }
}
