import 'package:app_uno/features/posts/domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<void> deleteBook(int bookId);
  Future<Book> updateBook(Book book);
  Future<Book> addBook(Book book);
}
