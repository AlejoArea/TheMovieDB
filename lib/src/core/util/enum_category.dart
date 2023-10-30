enum CategoryEnum {
  popular(category: 'popular'),
  upcoming(category: 'upcoming'),
  topRated(category: 'top_rated');

  const CategoryEnum({required this.category});

  final String category;
}
