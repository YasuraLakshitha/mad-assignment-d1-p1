import '../model/Book.dart';

class BookRepository {
  final List<Book> bookList = [];

  Book save(Book book) {
    bookList.add(book);
    return book;
  }
}
