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
}
