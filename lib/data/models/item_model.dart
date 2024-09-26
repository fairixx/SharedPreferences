class ItemModel {
  final String name;


  ItemModel({required this.name});

  Map<String, dynamic> toJson() => {'name': name};

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(name: json['name'],);
}
