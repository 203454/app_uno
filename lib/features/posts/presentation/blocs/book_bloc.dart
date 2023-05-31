import 'dart:async';
import 'package:app_uno/features/posts/data/models/book_model.dart';
import 'package:app_uno/features/posts/domain/entities/book.dart';
import 'package:app_uno/features/posts/domain/usecases/add_books_usecase.dart';
import 'package:app_uno/features/posts/domain/usecases/delete_books_usecase.dart';
import 'package:app_uno/features/posts/domain/usecases/get_books_usecase.dart';
import 'package:app_uno/features/posts/domain/usecases/update_book_usecase.dart';
import 'package:app_uno/services/local_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:convert' as convert;

part 'book_event.dart';
part 'book_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUsecase getBooksUsecase;
  final DeleteBookUseCase deleteBookUseCase;
  final UpdateBookUseCase updateBookUseCase;
  final AddBookUseCase addBookUseCase;

  final List<BooksEvent> _eventsList = [];

  List<BooksEvent> get items => _eventsList;

  BooksBloc(
      {required this.getBooksUsecase,
      required this.deleteBookUseCase,
      required this.updateBookUseCase,
      required this.addBookUseCase})
      : super(Loading()) {
    on<BooksEvent>((event, emit) async {
      if (event is GetBooks) {
        print("GetOnline users event");
        try {
          List<Book> response = await getBooksUsecase.execute();
          emit(Loaded(books: response));
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is GetUsersOffline) {
        print("GetOffline users event");
        try {
          emit(Loading());
          String? booksDataStr = LocalStorage.prefs.getString('libros');
          if (booksDataStr != null) {
            var dataBooksGotten = convert
                .jsonDecode(booksDataStr)
                .map<BookModel>((data) => BookModel.fromJson(data))
                .toList();
            emit(Loaded(books: dataBooksGotten));
          }
        } catch (e) {
          emit(Error(error: '${e}error en getoffline'));
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
      } else if (event is AddEvent) {
        _eventsList.add(event.eventToAdd);
        emit(EventAdded(_eventsList));
      } else if (event is ClearArrayEvents) {
        _eventsList.clear();
        emit(ArrayEventsCleared());
      }
    });
  }
}
