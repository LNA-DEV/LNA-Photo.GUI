class Photo {
  String id;
  String name;
  String url;
  String format;
  int gridColumn;
  String notes;
  int rating;
  bool postedOnMastodon;
  bool isDisabled;
  String takenWith;

  Photo(this.id, this.name, this. url, this.format, this.gridColumn, this.isDisabled, this.notes, this.postedOnMastodon, this.rating, this.takenWith);
}
