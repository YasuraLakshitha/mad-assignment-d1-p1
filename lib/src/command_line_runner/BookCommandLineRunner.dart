import 'dart:io';

import 'package:library_management_system/src/model/Book.dart';
import 'package:library_management_system/src/service/BookService.dart';

class CommandLineRunner {

  final BookService _service = BookService();

  void persist(){

    stdout.write("Enter book details bellow\n");

    stdout.write("Enter ISBN\t\t\t: ");
    String? ISBN = stdin.readLineSync();

    stdout.write("Enter author\t\t: ");
    String? author = stdin.readLineSync();

    stdout.write("Enter book title\t: ");
    String? title = stdin.readLineSync();

    Book book = Book(title!, author!, ISBN!, false);

    _service.saveBook(book);
  }
}
