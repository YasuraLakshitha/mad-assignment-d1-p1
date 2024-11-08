import 'Book.dart';

class TextBook extends Book {

  String _subjectArea;
  String _gradeLevel;

  TextBook(super._title, super._author, super._isbn, super._isUnAvailable,
      this._gradeLevel, this._subjectArea);

  String get gradeLevel => _gradeLevel;

  set gradeLevel(String value) {
    _gradeLevel = value;
  }

  String get subjectArea => _subjectArea;

  set subjectArea(String value) {
    _subjectArea = value;
  }

}