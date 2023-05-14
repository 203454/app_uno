import 'package:app_uno/features/posts/domain/entities/book.dart';
import 'package:app_uno/features/posts/domain/respositories/book_respository.dart';

class UpdateBookUseCase {
  final BookRepository bookRepository;
  UpdateBookUseCase(this.bookRepository);
  Future<Book> execute(Book book) async {
    return await bookRepository.updateBook(book);
  }
}

// class DeleteBookUseCase {
//   final BookRepository bookRepository;
//   DeleteBookUseCase(this.bookRepository);
//   Future<void> execute(int bookId) async {
//     try {
//       await bookRepository.deleteBook(bookId);
//     } catch (e) {
//       throw ('No se pudo eliminar el libro');
//     }
//   }
// }
