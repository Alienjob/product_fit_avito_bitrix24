class ElementData {
  //ссылка, название, описание, цена, раздел авито
  final String id;
  final String url;
  final String name;
  final String description;
  final String price;
  final String section;

  ElementData(
      {required this.id,
      required this.url,
      required this.name,
      required this.description,
      required this.price,
      required this.section});
}
