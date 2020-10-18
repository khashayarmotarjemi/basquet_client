class Product {
  final int id;
  final String name;
  final Price price;

  Product(this.id, this.name, this.price);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(json["id"], json["name"], Price.fromJson(json["price"]));
  }

  Map<String, dynamic> toJson() {
    return {"id": id.toString(), "name": name, "price": price.toJson()};
  }
}

class Price {
  final int amount;
  final String currency;

  Price(this.amount, this.currency);

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(json["amount"], json["currency"]);
  }

  Map<String, dynamic> toJson() {
    return {"amount": amount.toString(), "currency": currency};
  }
}
