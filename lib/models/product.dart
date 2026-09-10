class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.priceKr,
    required this.imageAsset,
    this.description = '',
    this.isNew = false,
    this.matchReason = '',
  });

  final String id;
  final String name;
  final String category;
  final int priceKr;
  final String imageAsset;
  final String description;
  final bool isNew;
  final String matchReason;
}
