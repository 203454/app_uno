part of 'book_bloc.dart';

@immutable
abstract class BooksEvent {}

class GetBooks extends BooksEvent {
  final bool statusValue;

  GetBooks(this.statusValue);
}

class DeleteBooks extends BooksEvent {
  final int bookId;

  DeleteBooks(this.bookId);
}

class SliderValueChanged extends BooksEvent {
  final Book book;

  SliderValueChanged(this.book);
}

class AddBook extends BooksEvent {
  final Book book;

  AddBook(this.book);
}
