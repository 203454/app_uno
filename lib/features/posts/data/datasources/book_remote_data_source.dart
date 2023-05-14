import 'dart:convert' as convert;
import 'package:app_uno/features/posts/data/models/book_model.dart';
import 'package:app_uno/features/posts/domain/entities/book.dart';
import 'package:dio/dio.dart';

abstract class BookRemoteDataSource {
  Future<List<Book>> getBooks(bool statusValue);
  Future<void> deleteBook(int bookId);
  Future<Book> updateBook(Book book);
  Future<Book> addBook(Book book);
}

class BookRemoteDataSourceImp implements BookRemoteDataSource {
  @override
  Future<List<Book>> getBooks(bool statusValue) async {
    try {
      var dio = Dio();
      var response = await dio
          .get('http://3.145.131.36:8000/api/libro/?status=$statusValue');

      if (response.statusCode == 200) {
        var data = response.data as Map<String, dynamic>;
        var librosData = data['libros'] as List<dynamic>;

        var libros = librosData
            .map((libroData) => BookModel.fromJson(libroData))
            .toList();
        return libros;
      } else {
        throw Exception('Error fetching books');
      }
    } catch (e) {
      throw Exception('Error fetching books: $e');
    }
  }

  @override
  Future<void> deleteBook(int bookId) async {
    Dio dio = Dio();
    await dio.delete('http://3.145.131.36:8000/api/libro/$bookId',
        options: Options(
            sendTimeout: const Duration(milliseconds: 2500),
            receiveTimeout: const Duration(milliseconds: 2500)));
  }

  @override
  Future<Book> updateBook(Book book) async {
    Dio dio = Dio();
    final response = await dio.put(
      'http://3.145.131.36:8000/api/libro/${book.id}',
      data: {
        'actual': book.actual,
        'status': book.status,
      },
    );

    if (response.statusCode == 200) {
      return BookModel.fromJson(response.data);
    } else {
      throw Exception('Failed to update book.');
    }
  }

  @override
  Future<Book> addBook(Book book) async {
    Dio dio = Dio();

    final response = await dio.post(
      'http://3.145.131.36:8000/api/libro/',
      data: {
        'titulo': book.titulo,
        'autor': book.autor,
        'editorial': book.editorial,
        'ncapitulos': book.ncapitulos,
        'isbn': book.isbn,
        'status': book.status,
        'npaginas': book.npaginas,
        'actual': book.actual,
      },
    );

    if (response.statusCode == 200) {
      return BookModel.fromJson(response.data);
    } else {
      throw Exception('Failed to add book.');
    }
  }
}
