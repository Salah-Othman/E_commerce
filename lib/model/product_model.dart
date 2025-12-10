class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final List<Map<String, dynamic>> rating;


  ProductModel(
     {
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  required this.rating, 
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json["description"] ?? '',
      category: json["category"] ?? '',
      image: json["image"] ?? '',
      rating: json["rate"] != null
          ? List<Map<String, dynamic>>.from([json["rating"]])
          : [],
   
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating" : rating,
    };
  }
}

class ProductResponse {
  final List<ProductModel> products;

  ProductResponse({required this.products});

  factory ProductResponse.fromJson(dynamic json) {
    if (json is List) {
      // API returns a list directly
      return ProductResponse(
        products: List<ProductModel>.from(
          json.map((product) => ProductModel.fromJson(product)).toList(),
        ),
      );
    } else if (json is Map<String, dynamic>) {
      // Fallback if API returns a map
      return ProductResponse(
        products: List<ProductModel>.from(
          (json['products'] as List? ?? [])
              .map((product) => ProductModel.fromJson(product))
              .toList(),
        ),
      );
    }
    return ProductResponse(products: []);
  }

  Map<String, dynamic> toJson() {
    return {'products': products.map((product) => product.toJson()).toList()};
  }
}




















//=========================================
 //  {
  //       "id": 1,
  //       "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
  //       "price": 109.95,
  //       "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
  //       "category": "men's clothing",
  //       "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
  //       "rating": {
  //           "rate": 3.9,
  //           "count": 120
  //       }