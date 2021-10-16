import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mening_hamyonim/models/list_model.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import './widgets/active_date.dart';
import './widgets/money_widget.dart';
import './widgets/percent_money.dart';
import './widgets/list_royxatlar.dart';
import './widgets/add_consumption.dart';
import './models/list_model.dart';
import './widgets/add_budjet.dart';

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
  ListData royxatlar = ListData();
  DateTime tanlanganOy = DateTime.now();
  double budjet = 0;
  double percent = 0.0;

  void _addConsumptionModalWindow(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return AddConsumtionModal(_xarajat);
      },
    );
  }

  void _allBudjet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (ctx) {
        return AddBudjet(_addAllBudjet);
      },
    );
  }

  void _addAllBudjet(double iBudjet) {
    setState(() {
      budjet = iBudjet;
    });
  }

  void _xarajat(String name, DateTime day, double price, IconData icon) {
    setState(() {
      royxatlar.addToList(name, day, price, icon);
    });
  }
  void _oylikHisoblagichBottomSheet(){
    showModalBottomSheet(context: context, builder: (ctx){
      return Container(child: Column(children: [Text("data"),],),);
    },);
  }

  double percentCalc() {
    setState(() {
      percent = totalPriceSum() / (budjet / 100);
    });
    return percent;
  }

  void selectDate(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (selectedMonth) {
        if (selectedMonth != null) {
          setState(
            () {
              tanlanganOy = selectedMonth;
            },
          );
        }
      },
    );
  }

  double totalPriceSum() {
    return royxatlar
        .sortByMonth(tanlanganOy)
        .fold(0, (price, _royxat) => price + _royxat.price);
  }

  void removeList(String id) {
    setState(() {
      print("main $id");
      print("main ${royxatlar.royxat.length}");
      royxatlar.removeConsumption(id);
    });
  }

  void previousMonth() {
    setState(() {
      if (tanlanganOy != null) {
        tanlanganOy = DateTime(tanlanganOy.year, tanlanganOy.month - 1);
      }
    });
  }

  void nextMonth() {
    setState(() {
      if (tanlanganOy != null) {
        tanlanganOy = DateTime(tanlanganOy.year, tanlanganOy.month + 1);
      }
    });
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
              _oylikHisoblagichBottomSheet();
            },
            icon: Icon(Icons.money),
          ),
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
            tanlanganOy,
          ),
          MoneyWidget(previousMonth, nextMonth, totalPriceSum()),
          PercentAndMoney(_allBudjet, budjet, percentCalc()),
          ListRoyxatlar(royxatlar.sortByMonth(tanlanganOy), removeList),
        ],
      ),
    );
  }
}
