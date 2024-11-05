import 'dart:ffi';

import '../model/Book.dart';

class BookRepository {
  final Set<Book> bookList = {};

  Book save(Book book) {
    bookList.add(book);
    return book;
  }

  bool remove(String value) {
    if(value.isEmpty)throw Exception("ISBN number cannot be null");
    Book? book =
        bookList.firstWhere((book) => value == book.isbn, orElse: null);
    return book != null ? bookList.remove(book) : false;
  }

  List<Book> findAll() {
    return bookList.toList();
  }
}
