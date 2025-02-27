void addBook(
  List<Map<String, dynamic>> library, {
  required String title,
  String author = "Unknown",
  int year = 0,
  String genre = "General",
}) {
  library.add({'title': title, 'author': author, 'year': year, 'genre': genre});
  print("Book '$title' added successfully.");
}

dynamic getBookInfo(
  List<Map<String, dynamic>> library, {
  required String title,
}) {
  for (var book in library) {
    if (book['title'] == title) {
      return {
        'author': book['author'],
        'year': book['year'],
        'genre': book['genre'],
      };
    }
  }
  return "Book not found.";
}

void listAllBooks(List<Map<String, dynamic>> library, {String genre = ''}) {
  if (genre.isEmpty) {
    print("All books in the library:");
    for (var book in library) {
      print(
        "Title: ${book['title']}, Author: ${book['author']}, Year: ${book['year']}, Genre: ${book['genre']}",
      );
    }
  } else {
    print("Books in the genre '$genre':");
    for (var book in library) {
      if (book['genre'] == genre) {
        print(
          "Title: ${book['title']}, Author: ${book['author']}, Year: ${book['year']}",
        );
      }
    }
  }
}

dynamic listBooksByGenre(
  List<Map<String, dynamic>> library, {
  required String genre,
}) {
  List<Map<String, dynamic>> booksInGenre = [];
  for (var book in library) {
    if (book['genre'] == genre) {
      booksInGenre.add(book);
    }
  }
  if (booksInGenre.isNotEmpty) {
    return booksInGenre;
  } else {
    return "No books found for this genre.";
  }
}

dynamic removeBook(
  List<Map<String, dynamic>> library, {
  required String title,
}) {
  for (var book in library) {
    if (book['title'] == title) {
      library.remove(book);
      return "Book '$title' removed successfully.";
    }
  }
  return "Book not found.";
}

void main() {
  List<Map<String, dynamic>> library = [];

  addBook(
    library,
    title: "Software",
    author: "Dr.Mustafa",
    year: 2023,
    genre: "edu",
  );
  addBook(
    library,
    title: "102",
    author: "Jasmin",
    year: 2024,
    genre: "English",
  );
  addBook(
    library,
    title: "Nabd",
    author: "Adham Sharqaue",
    year: 2010,
    genre: "Romance",
  );
  addBook(
    library,
    title: "Harry Potter",
    author: "J.K. Rowling",
    year: 1997,
    genre: "Fantasy",
  );

  listAllBooks(library);
  print('\n');
  var bookInfo = getBookInfo(library, title: "Harry Potter");
  print("Information about 'Harry Potter': $bookInfo");
  print('\n');

  var fantasyBooks = listBooksByGenre(library, genre: "Fantasy");
  print("Books in the Fantasy genre:");
  if (fantasyBooks is List) {
    for (var book in fantasyBooks) {
      print(
        "Title: ${book['title']}, Author: ${book['author']}, Year: ${book['year']}",
      );
    }
  } else {
    print(fantasyBooks);
  }
  print('\n');

  var removalMessage = removeBook(library, title: "The Hobbit");
  print(removalMessage);
  print('\n');

  listAllBooks(library);
}
