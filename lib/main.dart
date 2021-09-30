import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import './widgets/active_date.dart';
import './widgets/money_widget.dart';
import './widgets/percent_money.dart';
import './widgets/list_royxatlar.dart';
import './widgets/add_consumption.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: HamyonDastur(),
    );
  }
}

class HamyonDastur extends StatefulWidget {
  @override
  State<HamyonDastur> createState() => _HamyonDasturState();
}

class _HamyonDasturState extends State<HamyonDastur> {
  void _addConsumptionModalWindow(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return AddConsumtionModal();
      },
    );
  }

  void selectDate(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mening hamyonim"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _addConsumptionModalWindow(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ActiveDate(
            selectDate,
          ),
          MoneyWidget(),
          PercentAndMoney(),
          ListRoyxatlar(),
        ],
      ),
    );
  }
}
