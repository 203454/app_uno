import 'dart:async';
import 'package:app_uno/features/posts/domain/entities/book.dart';
import 'package:app_uno/features/posts/domain/usecases/add_books_usecase.dart';
import 'package:app_uno/features/posts/domain/usecases/delete_books_usecase.dart';
import 'package:app_uno/features/posts/domain/usecases/get_books_usecase.dart';
import 'package:app_uno/features/posts/domain/usecases/update_book_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_event.dart';
part 'book_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUsecase getBooksUsecase;
  final DeleteBookUseCase deleteBookUseCase;
  final UpdateBookUseCase updateBookUseCase;
  final AddBookUseCase addBookUseCase;

  BooksBloc(
      {required this.getBooksUsecase,
      required this.deleteBookUseCase,
      required this.updateBookUseCase,
      required this.addBookUseCase})
      : super(Loading()) {
    on<BooksEvent>((event, emit) async {
      if (event is GetBooks) {
        try {
          List<Book> response =
              await getBooksUsecase.execute(event.statusValue);
          emit(Loaded(books: response));
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is DeleteBooks) {
        try {
          await deleteBookUseCase.execute(event.bookId);
          emit(BookDeleted());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is SliderValueChanged) {
        try {
          await updateBookUseCase.execute(event.book);
          emit(SliderValue());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is AddBook) {
        try {
          await addBookUseCase.execute(event.book);
          emit(BookAdded());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}
