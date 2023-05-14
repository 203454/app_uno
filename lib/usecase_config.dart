import 'package:app_uno/features/posts/data/datasources/book_remote_data_source.dart';
import 'package:app_uno/features/posts/data/repositories/book_repository_impl.dart';
import 'package:app_uno/features/posts/domain/usecases/add_books_usecase.dart';
import 'package:app_uno/features/posts/domain/usecases/delete_books_usecase.dart';
import 'package:app_uno/features/posts/domain/usecases/get_books_usecase.dart';
import 'package:app_uno/features/posts/domain/usecases/update_book_usecase.dart';

class UsecaseConfig {
  GetBooksUsecase? getBookUsecase;
  BookRepositoryImpl? bookRepositoryImpl;
  BookRemoteDataSourceImp? bookRemoteDataSourceImp;

  DeleteBookUseCase? deleteBookUseCase;
  BookRepositoryImpl? bookRepositoryImplDelete;
  BookRemoteDataSourceImp? bookRemoteDataSourceImpDelete;

  UpdateBookUseCase? updateBookUseCase;
  BookRepositoryImpl? bookRepositoryImplUpdate;
  BookRemoteDataSourceImp? bookRemoteDataSourceImpUpdate;

  AddBookUseCase? addBookUseCase;
  BookRepositoryImpl? bookRepositoryImplAdd;
  BookRemoteDataSourceImp? bookRemoteDataSourceImpAdd;

  UsecaseConfig() {
    bookRemoteDataSourceImp = BookRemoteDataSourceImp();
    bookRepositoryImpl =
        BookRepositoryImpl(bookRemoteDataSource: bookRemoteDataSourceImp!);
    getBookUsecase = GetBooksUsecase(bookRepositoryImpl!);

    bookRemoteDataSourceImpDelete = BookRemoteDataSourceImp();
    bookRepositoryImplDelete = BookRepositoryImpl(
        bookRemoteDataSource: bookRemoteDataSourceImpDelete!);
    deleteBookUseCase = DeleteBookUseCase(bookRepositoryImplDelete!);

    bookRemoteDataSourceImpUpdate = BookRemoteDataSourceImp();
    bookRepositoryImplUpdate = BookRepositoryImpl(
        bookRemoteDataSource: bookRemoteDataSourceImpUpdate!);
    updateBookUseCase = UpdateBookUseCase(bookRepositoryImplUpdate!);

    bookRemoteDataSourceImpAdd = BookRemoteDataSourceImp();
    bookRepositoryImplAdd =
        BookRepositoryImpl(bookRemoteDataSource: bookRemoteDataSourceImpAdd!);
    addBookUseCase = AddBookUseCase(bookRepositoryImplAdd!);
  }
}
