import 'dart:math';

import 'package:greenglimpse/src/models/product_certificate.dart';
import 'package:greenglimpse/src/models/product_model.dart';

class MarketController {
  List<ProductModel> getStubProducts() {
    List<ProductCertificate> certificates = [];

    for (var i = 0; i < 3; i++) {
      int randIndex = Random().nextInt(ProductCertificate.values.length);
      certificates.add(ProductCertificate.values.elementAt(randIndex));
    }

    List<String> pictureSources = ["assets/images/products/1000_F_596154262_UUgf7PfZJqZTEnEDA9qEF64iiHv8qfTx.jpg",
    "assets/images/products/biologico-696x463.jpg",
    "assets/images/products/images.jpeg"];

    Set<ProductCertificate> productSet = certificates.toSet();

    List<ProductModel> products = [];
    
    for (var i = 0; i < 10; i++) {
      products.add(ProductModel(
          name: "Product $i",
          description:
              """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt 
          ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
          Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, 
          consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
          At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.""",
          price: i + 2.0,
          type: "Type $i",
          articleNumber: "ART.$i",
          productCertificates: productSet,
          pictureSource: pictureSources.elementAt(Random().nextInt(pictureSources.length))));
    }

    return products;
  }
}
