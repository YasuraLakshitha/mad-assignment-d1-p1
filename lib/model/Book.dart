import 'dart:core';

class Book {

  String _title;
  String _author;
  String _isbn;
  bool _isUnavailable;

  Book(this._title, this._author, this._isbn, this._isUnavailable);

  bool get isUnavailable => _isUnavailable;

  set isUnavailable(bool value) {
    _isUnavailable = value;
  }

  String get isbn => _isbn;

  set isbn(String value) {
    _isbn = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  @override
  String toString() {
    return 'Book{_title: $_title, _author: $_author, _isbn: $_isbn, _isUnavailable: $_isUnavailable}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book && runtimeType == other.runtimeType && _isbn == other._isbn;

  @override
  int get hashCode => _isbn.hashCode;
}