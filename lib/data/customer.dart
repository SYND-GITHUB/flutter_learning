import 'package:hello_flutter/resources/configs.dart';

class Customer {
  final String? name;
  final int numberOfBooks;
  final bool isVIP;

  Customer(
      {required this.name, required this.numberOfBooks, required this.isVIP});

  double getTotalCost() =>
      numberOfBooks * BOOK_PRICE * (isVIP ? ((100 - VIP_DISCOUNT) / 100) : 1);

  String getTotalCostStr() => getTotalCost().toStringAsFixed(1);

  bool isValid() {
    return (name?.isNotEmpty ?? false) && numberOfBooks > 0;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$name buys $numberOfBooks books";
  }
}
