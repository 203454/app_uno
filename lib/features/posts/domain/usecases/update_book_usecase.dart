import 'package:app_uno/features/posts/domain/entities/book.dart';
import 'package:app_uno/features/posts/domain/respositories/book_respository.dart';

class UpdateBookUseCase {
  final BookRepository bookRepository;
  UpdateBookUseCase(this.bookRepository);
  Future<Book> execute(Book book) async {
    return await bookRepository.updateBook(book);
  }
}
