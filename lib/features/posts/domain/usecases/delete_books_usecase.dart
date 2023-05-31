import 'package:app_uno/features/posts/domain/respositories/book_respository.dart';

class DeleteBookUseCase {
  final BookRepository bookRepository;
  DeleteBookUseCase(this.bookRepository);
  Future<void> execute(int bookId) async {
    try {
      await bookRepository.deleteBook(bookId);
    } catch (e) {
      throw ('No se pudo eliminar el libro');
    }
  }
}
