import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/data/customer.dart';
import 'package:hello_flutter/resources/colors.dart';
import 'package:hello_flutter/resources/configs.dart';
import 'package:hello_flutter/resources/dimens.dart';
import 'package:hello_flutter/resources/strings.dart';
import 'package:hello_flutter/utils/main_utils.dart';

class Lession9 extends StatefulWidget {
  const Lession9({Key? key}) : super(key: key);

  @override
  _Lession9State createState() => _Lession9State();
}

class _Lession9State extends State<Lession9> {
  final List<Customer?> customerList = [];
  TextEditingController? nameController, numberOfBooksController;
  FocusNode? nameFocusNode;
  bool isVIPChecked = false;
  bool isNext = true;
  String totalCost = "";

  bool _calculateCost() {
    int numberOfBooks = 0;
    try {
      if (nameController == null ||
          nameController!.text.isEmpty ||
          numberOfBooksController == null ||
          numberOfBooksController!.text.isEmpty) {
        setState(() {
          totalCost = INVALID_INFO;
        });
        return false;
      }
      numberOfBooks = (numberOfBooksController != null &&
              numberOfBooksController!.text.isNotEmpty)
          ? int.parse(numberOfBooksController!.text)
          : 0;
    } catch (e) {
      setState(() {
        totalCost = INVALID_INFO;
      });
      return false;
    }
    setState(() {
      totalCost = (numberOfBooks *
              BOOK_PRICE *
              (isVIPChecked ? ((100 - VIP_DISCOUNT) / 100) : 1))
          .toStringAsFixed(1);
    });
    return true;
  }

  bool _addNewCustomer() {
    int numberOfBooks = 0;
    try {
      if (nameController == null ||
          nameController!.text.isEmpty ||
          numberOfBooksController == null ||
          numberOfBooksController!.text.isEmpty) {
        return false;
      }
      numberOfBooks = (numberOfBooksController != null &&
              numberOfBooksController!.text.isNotEmpty)
          ? int.parse(numberOfBooksController!.text)
          : 0;
    } catch (e) {
      return false;
    }
    Customer? customer = Customer(
        name: nameController?.text,
        numberOfBooks: numberOfBooks,
        isVIP: isVIPChecked);
    print(customer);
    totalCost = customer.getTotalCostStr();
    if (isNext) {
      customerList.add(customer);
      isNext = false;
    } else {
      customerList.last = customer;
    }
    setState(() {});
    return true;
  }

  _resetState() {
    nameController?.clear();
    numberOfBooksController?.clear();
    setState(() {
      isVIPChecked = false;
      totalCost = "";
      isNext = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    numberOfBooksController = TextEditingController();
    nameFocusNode = FocusNode();
    totalCost = "";
    isNext = true;
  }

  @override
  void dispose() {
    super.dispose();
    nameController?.dispose();
    numberOfBooksController?.dispose();
    nameFocusNode?.dispose();
  }

  Widget _buildInputContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(flex: 1, child: Text(CUSTOMER_NAME)),
              Expanded(
                flex: 1,
                child: TextField(
                  autofocus: true,
                  controller: nameController,
                  focusNode: nameFocusNode,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(flex: 1, child: Text(NUMBER_OF_BOOKS)),
              Expanded(
                flex: 1,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: numberOfBooksController,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(flex: 1, child: SizedBox.shrink()),
              Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.only(left: 0),
                    title: Text(
                      CUSTOMER_VIP,
                      style: TextStyle(fontSize: TEXT_MEDIUM),
                    ),
                    value: isVIPChecked,
                    onChanged: (value) {
                      setState(() {
                        isVIPChecked = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(flex: 1, child: Text(COST)),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.greenAccent,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(totalCost),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    child: Text(COST_CALCULATE),
                    onPressed: () {
                      _calculateCost();
                      hideKeyboard();
                    },
                  )),
              SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    child: Text(NEXT),
                    onPressed: () {
                      _addNewCustomer();
                      _resetState();
                      nameFocusNode?.requestFocus();
                    },
                  )),
              SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    child: Text(SUMMARY),
                    onPressed: () {},
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(flex: 1, child: Text(TOTAL_CUSTOMER)),
              Expanded(
                flex: 1,
                child: Text("${customerList.length}"),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(flex: 1, child: Text(TOTAL_VIP_CUSTOMER)),
              Expanded(
                flex: 1,
                child: Text(
                    "${customerList.where((element) => element!.isVIP).length}"),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(flex: 1, child: Text(TOTAL_EARN)),
              Expanded(
                flex: 1,
                child: Text("${_getTotalEarning()}"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double _getTotalEarning() {
    double total = 0;
    customerList.forEach((element) {
      total += element!.getTotalCost();
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LESSION_9_TITLE),
        backgroundColor: Color(GREEN),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /** Header Bill Info **/
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(GREEN),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      BILL_INFO,
                      style: TextStyle(
                        color: Color(BLACK),
                        fontSize: TEXT_LARGE,
                      ),
                    ),
                  ),
                  /** Input Customer Info **/
                  _buildInputContainer(),
                  /** Header Summary Info **/
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(GREEN),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      SUMMARY_INFO,
                      style: TextStyle(
                        color: Color(BLACK),
                        fontSize: TEXT_LARGE,
                      ),
                    ),
                  ),
                  _buildSummaryContainer(),
                ],
              ),
            )),
      ),
    );
  }
}
