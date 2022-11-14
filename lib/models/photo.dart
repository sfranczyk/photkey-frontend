class Photo {
  String author;
  String category;
  String location;
  int likes = 0;
  int shakes = 0;
  bool isStarred = false;
  String info;
  String urlImage;

  Photo(this.author, this.category, this.location, this.likes, this.shakes,
      this.info, this.urlImage);
}
