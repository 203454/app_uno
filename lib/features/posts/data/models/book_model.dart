import 'package:app_uno/features/posts/domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    int? id,
    required String titulo,
    required String autor,
    required String editorial,
    required int ncapitulos,
    required int isbn,
    required bool status,
    required int npaginas,
    required int actual,
  }) : super(
            id: id,
            titulo: titulo,
            autor: autor,
            editorial: editorial,
            ncapitulos: ncapitulos,
            isbn: isbn,
            status: status,
            npaginas: npaginas,
            actual: actual);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as int?,
      titulo: json['titulo'],
      autor: json['autor'],
      editorial: json['editorial'],
      ncapitulos: json['ncapitulos'],
      isbn: json['isbn'],
      status: json['status'],
      npaginas: json['npaginas'],
      actual: json['actual'],
    );
  }
  BookModel copyWith({
    int? id,
    String? titulo,
    String? autor,
    String? editorial,
    int? ncapitulos,
    int? isbn,
    bool? status,
    int? npaginas,
    int? actual,
  }) {
    return BookModel(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      autor: autor ?? this.autor,
      editorial: editorial ?? this.editorial,
      ncapitulos: ncapitulos ?? this.ncapitulos,
      isbn: isbn ?? this.isbn,
      status: status ?? this.status,
      npaginas: npaginas ?? this.npaginas,
      actual: actual ?? this.actual,
    );
  }

  factory BookModel.fromEntity(Book book) {
    return BookModel(
      id: book.id,
      titulo: book.titulo,
      autor: book.autor,
      editorial: book.editorial,
      ncapitulos: book.ncapitulos,
      isbn: book.isbn,
      status: book.status,
      npaginas: book.npaginas,
      actual: book.actual,
    );
  }
}
