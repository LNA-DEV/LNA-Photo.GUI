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

  Photo(
      this.id,
      this.name,
      this.url,
      this.format,
      this.gridColumn,
      this.isDisabled,
      this.notes,
      this.postedOnMastodon,
      this.rating,
      this.takenWith);

  Photo.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        url = json["url"],
        format = json["format"],
        gridColumn = json["gridColumn"],
        isDisabled = json["isDisabled"],
        notes = json["notes"],
        postedOnMastodon = json["postedOnMastodon"],
        rating = json["rating"],
        takenWith = json["takenWith"];
}
