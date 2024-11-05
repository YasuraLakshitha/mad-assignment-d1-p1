import '../model/Book.dart';

class BookRepository {
  final List<Book> bookList = [];

  Book save(Book book) {
    bookList.add(book);
    return book;
  }

  bool remove(String value) {
    Book? book = bookList.firstWhere((book) => book.isbn == value);
    if (book != null) {
      return bookList.remove(book);
    }
    return false;
  }
}
