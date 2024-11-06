import 'package:flutter_test/flutter_test.dart';
import 'package:library_management_system/model/Book.dart';
import 'package:library_management_system/repository/BookRepository.dart';
import 'package:library_management_system/service/BookService.dart';
import 'package:library_management_system/service/FilterService.dart';

void main() {
  late FilterService filterService;
  late BookService bookService;

  setUp(() {
    filterService = FilterService();
    bookService = BookService();

    bookService.saveBook(Book("Title1", "Author1", "B002", false));
    bookService.saveBook(Book("Title2", "Author1", "B003", false));
    bookService.saveBook(Book("Title1", "Author2", "B004", true));
    bookService.saveBook(Book("Title1", "Author2", "B005", false));
    bookService.saveBook(Book("Title2", "Author1", "B006", true));
  });

  group("FilterService_unit_test - filterByTitle method", () {
    test("should return list of books contain Title1", () {
      String value = "Title1";
      Set<Book> bookSet = filterService.retrieveByTitle(value);

      expect(bookSet, isA<Set<Book>>());
      expect(bookSet.every((element) => element.title == value), isTrue,
          reason: "All books should contain title name as `$value`");
    });

    test("should throw an exception when empty value passed", () {
      String emptyValue = "";
      expect(() => filterService.retrieveByTitle(emptyValue), throwsException);
    });

    group("FilterService_unit_test - filterByAuthor method", () {
      test("should return list of books contain Author1", () {
        String value = "Author1";
        Set<Book> bookSet = filterService.retrieveByTitle(value);

        expect(bookSet, isA<Set<Book>>());
        expect(bookSet.every((element) => element.title == value), isTrue,
            reason: "All books should contain author name as `$value`");
      });

      test("should throw an exception when empty value passed as arguments",
          () {
        String emptyValue = "";
        expect(
            () => filterService.retrieveByTitle(emptyValue), throwsException);
      });
    });
  });

  group("FilterService_unit_test - filterByAuthor method", () {
    test("should return list of books contain Author", () {
      String value = "Author";
      Set<Book> bookSet = filterService.retrieveByAuthor(value);

      expect(bookSet, isA<Set<Book>>());
      expect(bookSet.every((element) => element.author == value), isTrue,
          reason: "All books should contain Author name as `$value`");
    });

    test("should throw an exception when empty value passed", () {
      String emptyValue = "";
      expect(() => filterService.retrieveByAuthor(emptyValue), throwsException);
    });

    group("FilterService_unit_test - filterByStatus method", () {
      test("should return list of books contain isUnavailable false", () {
        bool value = false;
        Set<Book> bookSet = filterService.retrieveByStatus(value);

        expect(bookSet, isA<Set<Book>>());
        expect(
            bookSet.every((element) => element.isUnavailable == value), isTrue,
            reason: "All books should contain isUnavailable as `$value`");
      });
    });
  :});
}
