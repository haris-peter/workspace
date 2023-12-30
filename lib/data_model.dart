class ProductDetailsModel {
  final String name;
  final String supplier;
  final String brand;
  final String barcode;
  final String photoUrl;
  bool checked;

  ProductDetailsModel({
    required this.name,
    required this.supplier,
    required this.brand,
    required this.barcode,
    required this.checked,
    required this.photoUrl,
  });
}
