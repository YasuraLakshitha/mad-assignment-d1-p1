import 'package:library_management_system/repository/BookRepository.dart';

import '../model/Book.dart';

class BookService{
  BookRepository repository = new BookRepository();

  Book saveBook(Book book){
    return repository.save(book);
  }

  bool removeBookById(String value){
    return repository.remove(value);
  }
}