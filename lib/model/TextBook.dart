import 'Book.dart';

class TextBook extends Book {

  String _subjectArea;
  String _gradeLevel;

  TextBook(String _title, String _author, String _isbn, bool _isUnAvailable,
      this._gradeLevel, this._subjectArea)
      :super(_title, _author, _isbn, _isUnAvailable);

  String get gradeLevel => _gradeLevel;

  set gradeLevel(String value) {
    _gradeLevel = value;
  }

  String get subjectArea => _subjectArea;

  set subjectArea(String value) {
    _subjectArea = value;
  }
}