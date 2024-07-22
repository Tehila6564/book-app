class Book {
  final String title;
  final String description;
  final String author;
  final String imageURL;
  final String price;

  Book(
      {required this.title,
      required this.description,
      required this.author,
      required this.imageURL,
      required this.price});
}

List<Book> books = [
  Book(
    title: "The Disappearance of Émile Zola",
    author: "Michael Rosen",
    description: "Love, Literature and the Dreyfus Case.",
    imageURL: 'images/1.jpg',
    price: "7.00",
  ),
  Book(
    title: "Fatherhood: The Truth",
    author: "Marcus Berkmann",
    description:
        "A humorous look at the trials and tribulations of fatherhood.",
    imageURL: 'images/2.jpg',
    price: "7.00",
  ),
  Book(
    title: "The Time Traveller's Handbook",
    author: "James Wyllie",
    description: "How to be the Best in Time and Space.",
    imageURL: 'images/3.jpg',
    price: "7.00",
  ),
  Book(
    title: "In a Land of Paper Gods",
    author: "Rebecca Mackenzie",
    description: "High on a Chinese mountain, a child waits for a sign.",
    imageURL: 'images/4.jpg',
    price: "7.00",
  ),
  Book(
    title: "Tattletale",
    author: "Sarah J Naughton",
    description:
        "The perfect brother. The perfect fiancé. The perfect revenge?",
    imageURL: 'images/5.jpg',
    price: "7.00",
  ),
  Book(
    title: "The Zoo",
    author: "Christopher Wilson",
    description: "A novel about a zoo and its inhabitants.",
    imageURL: 'images/6.jpg',
    price: "7.00",
  ),
  Book(
    title: "2020 World of War",
    author: "Paul Cornish and Kingsley Donaldson",
    description:
        "A timely reminder that history never ends and is about to be made.",
    imageURL: 'images/7.jpg',
    price: "7.00",
  ),
  Book(
    title: "Door to Door",
    author: "Edward Humes",
    description:
        "The magnificent, maddening, mysterious world of transportation.",
    imageURL: 'images/8.jpg',
    price: "7.00",
  ),
];
