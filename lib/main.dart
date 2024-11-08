import 'dart:io';

import 'package:library_management_system/src/command_line_runner/BookCommandLineRunner.dart';

void main() {
  final CommandLineRunner runner = CommandLineRunner();

  while (true) {
    stdout.write('Enter option\n 1 -> add new book\n-1 -> end\n');
    int option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        runner.persist();
        break;

      case -1:
        exit(0);

      default:
        throw Exception("Invalid option");
    }
  }
}
