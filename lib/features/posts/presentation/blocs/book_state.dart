part of 'book_bloc.dart';

@immutable
abstract class BooksState {}

class Loading extends BooksState {}

class Loaded extends BooksState {
  final List<Book> books;

  Loaded({required this.books});
}

class Error extends BooksState {
  final String error;

  Error({required this.error});
}

class BookDeleted extends BooksState {}

class SliderValue extends BooksState {}

class BookAdded extends BooksState {}
