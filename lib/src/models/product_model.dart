import 'dart:convert';
import 'package:greenglimpse/src/models/product_certificate.dart';

class ProductModel {
  late String _name;
  late String _description;
  // price always incl. taxes
  late double _price;
  late String _type;
  late String _articleNumber;
  late Set<ProductCertificate> _productCertificates;
  late String _pictureSource;

  ProductModel(
      {required String name,
      required String description,
      required double price,
      required String type,
      required String articleNumber,
      required Set<ProductCertificate> productCertificates,
      required String pictureSource})
      : _name = name,
        _description = description,
        _price = price,
        _type = type,
        _articleNumber = articleNumber,
        _productCertificates = productCertificates,
        _pictureSource = pictureSource;

  ProductModel copyWith({
    String? name,
    String? description,
    double? price,
    String? type,
    String? articleNumber,
    Set<ProductCertificate>? productCertificates,
  }) {
    return ProductModel(
      name: name ?? _name,
      description: description ?? _description,
      price: price ?? _price,
      type: type ?? _type,
      articleNumber: articleNumber ?? _articleNumber,
      productCertificates: productCertificates ?? _productCertificates,
      pictureSource: pictureSource ?? pictureSource,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'description': _description,
      'price': _price,
      'type': _type,
      'articleNumber': _articleNumber,
      'productCertificates': _productCertificates,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      description: map['description'],
      price: map['price'],
      type: map['type'],
      articleNumber: map['articleNumber'],
      productCertificates:
          Set<ProductCertificate>.from(map['productCertificates']),
      pictureSource: map['pictureSource']    
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(name: $_name, description: $_description, price: $_price, type: $_type, articleNumber: $_articleNumber, productCertificates: $_productCertificates, picturSource: $_pictureSource)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other._name == _name &&
        other._description == _description &&
        other._price == _price &&
        other._type == _type &&
        other._articleNumber == _articleNumber &&
        other._productCertificates == _productCertificates;
  }

  @override
  int get hashCode {
    return _name.hashCode ^
        _description.hashCode ^
        _price.hashCode ^
        _type.hashCode ^
        _articleNumber.hashCode ^
        _productCertificates.hashCode ^
        _pictureSource.hashCode;
  }

  get name => _name;

  set name(value) => _name = value;

  get description => _description;

  set description(value) => _description = value;

  get price => _price;

  set price(value) => _price = value;

  get type => _type;

  set type(value) => _type = value;

  get articleNumber => _articleNumber;

  set articleNumber(value) => _articleNumber = value;

  get productCertificates => _productCertificates;

  set productCertificates(value) => _productCertificates = value;

  get pictureSource => _pictureSource;

  set pictureSource(value) => _pictureSource = value;
}
