import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/active_date.dart';
import './widgets/money_widget.dart';
import './widgets/percent_money.dart';
import './widgets/list_royxatlar.dart';

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

class HamyonDastur extends StatelessWidget {
  void _addConsumptionModalWindow(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom > 0
                    ? MediaQuery.of(context).viewInsets.bottom + 16
                    : 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150.0,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Xarajat nomi",
                          ),
                        ),
                      ),
                      Container(
                        width: 150.0,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: "Xarajat miqdori"),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Xarajat kuni tanlanmadi!"),
                      TextButton(
                        onPressed: () {},
                        child: Text("KUNNI TANLASH"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("icon tanlanmagan!"),
                      TextButton(
                        onPressed: () {},
                        child: Text("ICON TANLASH"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("BEKOR QILISH"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("KIRITISH"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
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
              _addConsumptionModalWindow(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ActiveDate(),
          MoneyWidget(),
          PercentAndMoney(),
          ListRoyxatlar(),
        ],
      ),
    );
  }
}
