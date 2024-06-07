class Product {
  final int id;
  final String name;
  final String img;
  final double price;
  final double ratings;
  final int review;
  final String description;
  final int totalAvailable;

  Product(
      {required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.ratings,
      required this.review,
      required this.description,
      required this.totalAvailable});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        img: json["img"] ?? "",
        price: json["price"] ?? 3,
        ratings: json["ratings"] ?? 34,
        review: json["review"] ?? 65,
        description: json["description"] ?? "",
        totalAvailable: json["totalAvailable"] ?? "");
  }
}

List<Map<String, dynamic>> productList = [
  {
    "id": 1,
    "name": "Black Simple Lamp",
    "img": "jonny-caspari.png",
    "price": 25.00,
    "rating": 24,
    "review": 432,
    "description":
        " Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.",
    "totalAvailable": 40
  },
  {
    "id": 2,
    "name": "Minimal Stand",
    "img": "jonnny-chair.png",
    "price": 20.00,
    "rating": 98,
    "review": 500,
    "description":
        " Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.",
    "totalAvailable": 40
  },
  {
    "id": 3,
    "name": "Coffe desk",
    "img": "sarah-dorweiler.png",
    "price": 50.00,
    "rating": 45,
    "review": 345,
    "description":
        " Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.",
    "totalAvailable": 40
  },
  {
    "id": 4,
    "name": "Simple chair",
    "img": "simple-desk.png",
    "price": 12.00,
    "rating": 78,
    "review": 333,
    "description":
        " Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.",
    "totalAvailable": 40
  }
];
