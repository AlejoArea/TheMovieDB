enum CategoryEnum {
  popular(category: 'popular'),
  upcoming(category: 'upcoming'),
  topRated(category: 'top_rated'),
  favorite(category: 'favorite');

  const CategoryEnum({required this.category});



  final String category;
}
