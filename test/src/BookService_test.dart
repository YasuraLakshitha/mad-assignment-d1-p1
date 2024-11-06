import 'package:flutter_test/flutter_test.dart';
import 'package:library_management_system/model/Book.dart';
import 'package:library_management_system/service/BookService.dart';

void main() {
  //Initial values
  late BookService service;
  late Book book;

  const String _title = "TestBook1";
  const String _author = "Author1";
  const String _isbn = "B001";
  const bool _isUnavailable = false;

  setUp(() {
    service = BookService();

    book = Book(_title, _author, _isbn, _isUnavailable);
  });

  //Testing createBook
  group("BookService_unit_test - createBook method", () {
    test("should return created book when create book method called", () {
      //Arrange
      service.saveBook(book);

      //Assertions
      expect(service.retrieveAllBooks().length, equals(1));
      expect(service.retrieveAllBooks()[0].title, equals(_title));
      expect(service.retrieveAllBooks()[0].author, equals(_author));
      expect(service.retrieveAllBooks()[0].isbn, equals(_isbn));
      expect(
          service.retrieveAllBooks()[0].isUnavailable, equals(_isUnavailable));
    });
  });

  //Testing removeById
  group("BookService_unit_test - removeById method", () {
    test("should return true when remove book method called", () {
      //Arrange
      const String bookId = "B001";

      service.saveBook(book);
      bool isRemoved = service.removeBookById(bookId);

      //Assertions
      expect(isRemoved, true);
    });

    test(
        "should throw an exception when null value passed to remove book method",
        () {
      expect(() => service.removeBookById(""), throwsException,
          reason: 'ISBN number is empty');
    });

    test(
        "should throw an exception when incorrect ISBN number passed to remove method",
        () {
      String bookId = "000";
      expect(() => service.removeBookById(bookId), throwsException,
          reason: "ISBN number is not exists.");
    });
  });

  //Testing updateStatus
  group("BookService_unit_test - updateStatus method", () {
    late Book savedBook;
    late bool preStatus;

    setUp(() {
      savedBook = service.saveBook(book);
      preStatus = savedBook.isUnavailable;
    });

    test("should return updated book with changed status", () {
      //Arrange
      Book updatedBook =
          service.updateStatus(savedBook.isbn, !savedBook.isUnavailable);

      //Assertions
      expect(updatedBook.isbn.isNotEmpty, isTrue, reason: "ISBN is empty.");

      expect(updatedBook.isbn, equals(savedBook.isbn),
          reason: "ISBN numbers didn't match.");

      expect(updatedBook.isUnavailable, !preStatus,
          reason: "Status is not changed");
    });

    test("should throw an exception when empty value passed to ISBN number",
        () {
      //Arrange
      const String isbn = '';

      //Assertions
      expect(() => service.updateStatus(isbn, false), throwsException);
    });
  });
}
