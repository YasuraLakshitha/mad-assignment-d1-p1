import 'dart:ffi';

import '../model/Book.dart';

class BookRepository {
  final Set<Book> bookList = {};

  Book save(Book book) {
    bookList.add(book);
    return book;
  }

  bool remove(String value) {
    Book book = findById(value);
    return book.isbn.isNotEmpty ? bookList.remove(book) : false;
  }

  List<Book> findAll() {
    return bookList.toList();
  }

  Book updateStatus(String isbn, bool status) {
    Book book = findById(isbn);

    if (book.isbn.isEmpty) {
      throw Exception("No such book found");
    }

    book.isUnavailable = status;

    return book;
  }

  Book findById(String isbn) {
    Book book = bookList.firstWhere((element) => element.isbn == isbn,
        orElse: () => Book('', '', '', false));

    return book;
  }

  Set<Book> filterByTitle(String value) {
    return bookList
        .where((test) => test.title.toLowerCase() == value.toLowerCase())
        .toSet();
  }
}
