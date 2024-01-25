class Avenger {
  String? name;
  String? description;
  String? imageUrl;

  Avenger(this.name, this.description, this.imageUrl);

  Avenger.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}