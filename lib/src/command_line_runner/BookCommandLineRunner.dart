import 'dart:io';

import 'package:library_management_system/src/model/Book.dart';
import 'package:library_management_system/src/service/BookService.dart';
import 'package:library_management_system/src/service/FilterService.dart';

class CommandLineRunner {
  final BookService _service = BookService();
  final FilterService _filter = FilterService();

  void persist() {
    stdout.write("Enter book details bellow\n");

    stdout.write("Enter ISBN\t\t\t: ");
    String? ISBN = stdin.readLineSync();

    stdout.write("Enter author\t\t: ");
    String? author = stdin.readLineSync();

    stdout.write("Enter book title\t: ");
    String? title = stdin.readLineSync();

    Book book = Book(title!, author!, ISBN!, false);

    _service.saveBook(book);

    stdout.write("\n\tBook added successfully\n");
  }

  void search() {
    stdout.write("Search book\n\tEnter author or title\t: ");
    String value = stdin.readLineSync()!;

    Set<Book> result = _filter.retrieveByAuthor(value).isEmpty
        ? _filter.retrieveByTitle(value)
        : _filter.retrieveByAuthor(value);

    //todo: handle when author name == title name

    if (result.first.isbn.isNotEmpty) {
      stdout.write(result);
      return;
    }

    stdout.write("No such book found\n\n");
  }
}
