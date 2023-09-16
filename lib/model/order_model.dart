class Order {
  String name, address, phoneNumber, amount, notes, combo;
  List<String> size,color;

  Order(
      {required this.name,
      required this.address,
      required this.phoneNumber,
      required this.amount,
      required this.notes,
      required this.size,
      required this.color,
      required this.combo
      });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "phoneNumber": phoneNumber,
      "amount": amount,
      "notes": notes,
      "size": size,
      "color": color,
      "combo": combo
    };
  }
}
