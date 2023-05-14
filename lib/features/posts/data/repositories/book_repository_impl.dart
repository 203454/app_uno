import 'package:app_uno/features/posts/data/datasources/book_remote_data_source.dart';
import 'package:app_uno/features/posts/domain/entities/book.dart';
import 'package:app_uno/features/posts/domain/respositories/book_respository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource bookRemoteDataSource;

  BookRepositoryImpl({required this.bookRemoteDataSource});

  @override
  Future<List<Book>> getBooks(bool statusValue) async {
    return await bookRemoteDataSource.getBooks(statusValue);
  }

  @override
  Future<void> deleteBook(int bookId) async {
    return await bookRemoteDataSource.deleteBook(bookId);
  }

  @override
  Future<Book> updateBook(Book book) async {
    return await bookRemoteDataSource.updateBook(book);
  }

  @override
  Future<Book> addBook(Book book) async {
    return await bookRemoteDataSource.addBook(book);
  }
}
