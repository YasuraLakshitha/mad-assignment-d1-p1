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

    stdout.write("\n\tBook added successfully...\n\n");
  }

  void search() {
    stdout.write("Search book\n\tEnter author or title\t: ");
    String value = stdin.readLineSync()!;

    Set<Book> result = _filter.retrieveByAuthor(value).isEmpty
        ? _filter.retrieveByTitle(value)
        : _filter.retrieveByAuthor(value);

    //todo: handle when author name == title name

    if (result.first.isbn.isNotEmpty) {
      stdout.writeln(result);
      return;
    }

    stdout.write("\t\nNo such book found...\n\n");
  }

  void update() {
    stdout.write("Enter book ISBN\t: ");
    String isbn = stdin.readLineSync()!;

    stdout.write(
        "Update book status\n\t1-Unavailable\n\t2-Available\nEnter your option\t: ");
    bool status = stdin.readLineSync()!.contains("1") ? false : true;

    _service.updateStatus(isbn, status);

    stdout.write("\n\tBook updated successfully...\n\n");
  }
}
