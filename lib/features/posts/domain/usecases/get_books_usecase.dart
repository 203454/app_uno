import 'package:app_uno/features/posts/domain/entities/book.dart';
import 'package:app_uno/features/posts/domain/respositories/book_respository.dart';

class GetBooksUsecase {
  final BookRepository bookRepository;

  GetBooksUsecase(this.bookRepository);

  Future<List<Book>> execute() async {
    return await bookRepository.getBooks();
  }
}
