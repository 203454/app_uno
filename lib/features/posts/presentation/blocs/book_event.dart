part of 'book_bloc.dart';

@immutable
abstract class BooksEvent {}

class GetBooks extends BooksEvent {}

class DeleteBooks extends BooksEvent {
  final int bookId;
  DeleteBooks(this.bookId);
}

class SliderValueChanged extends BooksEvent {
  final Book book;
  SliderValueChanged(this.book);
}

class GetUsersOffline extends BooksEvent {}

class AddBook extends BooksEvent {
  final Book book;
  AddBook(this.book);
}

class AddEvent extends BooksEvent {
  final BooksEvent eventToAdd;
  AddEvent(this.eventToAdd);
}
