

import '../model/Book.dart';

class BookRepository {
  final Set<Book> _bookList = {};

  static final BookRepository _bookRepository = BookRepository._internal();

  BookRepository._internal();

  static get instance => _bookRepository;

  Book save(Book book) {
    _bookList.add(book);
    return book;
  }

  bool remove(String value) {
    Book book = findById(value);
    return book.isbn.isNotEmpty ? _bookList.remove(book) : false;
  }

  List<Book> findAll() {
    return _bookList.toList();
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
    Book book = _bookList.firstWhere((element) => element.isbn == isbn,
        orElse: () => Book('', '', '', false));

    return book;
  }

  Iterable<Book> filterByTitle(String value) {
    return _bookList
        .where((test) => test.title.toLowerCase().contains(value.toLowerCase()));
  }

  Iterable<Book> filterByAuthor(String value) {
    return _bookList
        .where((test) => test.author.toLowerCase().contains(value.toLowerCase()));
  }

  Set<Book> filterByStatus(bool value) {
    return _bookList.where((test) => test.isUnavailable == value).toSet();
  }
}
