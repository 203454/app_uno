class Book {
  final int? id;
  final String titulo;
  final String autor;
  final String editorial;
  final int ncapitulos;
  final int npaginas;
  final int isbn;
  final int actual;
  final bool status;

  Book({
    this.id,
    required this.titulo,
    required this.autor,
    required this.editorial,
    required this.ncapitulos,
    required this.isbn,
    required this.status,
    required this.npaginas,
    required this.actual,
  });
}
