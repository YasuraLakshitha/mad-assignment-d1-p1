import 'dart:io';

import 'package:library_management_system/src/command_line_runner/BookCommandLineRunner.dart';

void main() {
  final CommandLineRunner runner = CommandLineRunner();

  while (true) {
    stdout.write('Enter option\n '
        '\t 1 -> add new book\n '
        '\t 2 -> search books\n'
        '\t 3 -> update book status\n'
        '\t-1 -> exit\n');
    int option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        runner.persist();
        break;

      case 2:
        runner.search();
        break;

      case 3:
        runner.update();
        break;

      case -1:
        exit(0);

      default:
        throw Exception("Invalid option");
    }
  }
}
