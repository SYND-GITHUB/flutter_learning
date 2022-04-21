import 'package:hello_flutter/data/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref _sharedPref = SharedPref._internal();

  // Private constructor
  SharedPref._internal();

  factory SharedPref() {
    return _sharedPref;
  }

  add(int index, Customer customer) async {
    if (!customer.isValid()) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    List<String> data = [
      customer.name!,
      customer.numberOfBooks.toString(),
      customer.isVIP.toString(),
      customer.getTotalCostStr()
    ];
    await prefs.setStringList(index.toString(), data);
  }
}
