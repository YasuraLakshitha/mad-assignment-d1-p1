import 'package:flutter_test/flutter_test.dart';
import 'package:library_management_system/model/Book.dart';
import 'package:library_management_system/service/BookService.dart';

void main() {
  group("BookService_unit_test", () {
    BookService service = new BookService();

    test("test when create book method called", () {
      const String _title = "TestBook1";
      const String _author = "Author1";
      const String _isbn = "B001";
      const bool _isUnavailable = false;

      Book book = new Book(_title, _author, _isbn, _isUnavailable);

      service.saveBook(book);

      expect(service.retriveAllBooks().length, equals(1));
      expect(service.retriveAllBooks()[0].title, equals(_title));
      expect(service.retriveAllBooks()[0].author, equals(_author));
      expect(service.retriveAllBooks()[0].isbn, equals(_isbn));
      expect(
          service.retriveAllBooks()[0].isUnavailable, equals(_isUnavailable));
    });

    test("test when remove book method called", () {
      const String bookId = "B001";

      bool isRemoved = service.removeBookById(bookId);

      expect(isRemoved, true);
    });

    test("test when null value passed to remove book method", () {
      expect(() => service.removeBookById(""),throwsException);
    });
  });
}

//todo: negative usecases => check null values for [save_book,remove_book];
//todo: negative usecases => check null values returns from find_all;
