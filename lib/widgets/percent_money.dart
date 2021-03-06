import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

class PercentAndMoney extends StatefulWidget {
  final Function _allBudjet;
  final double budjet;
  final double percentCalc;
  var budjetF = NumberFormat("###.0#");

  PercentAndMoney(
    this._allBudjet,
    this.budjet,
    this.percentCalc,
  );

  @override
  State<PercentAndMoney> createState() => _PercentAndMoneyState();
}

class _PercentAndMoneyState extends State<PercentAndMoney> {
  void perdentCalc() {
    int percentResult = widget.percentCalc.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEFEEFC),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
      ),
      padding: const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    "Oylik byudjet: ",
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      widget._allBudjet(context);
                    },
                    icon: Icon(Icons.edit),
                    label: Text(
                      "${NumberFormat.currency(symbol: "").format(widget.budjet)} so'm",
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "${widget.percentCalc.toStringAsFixed(1)}%",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          LinearPercentIndicator(
            alignment: MainAxisAlignment.spaceAround,
            width: 320,
            lineHeight: 5,
            animationDuration: 50,
            percent:
                double.parse(widget.percentCalc.toStringAsFixed(1)) / 100 < 1.0
                    ? double.parse(widget.percentCalc.toStringAsFixed(1)) / 100
                    : 1,
            backgroundColor: Colors.grey,
            linearGradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.lightBlueAccent,
                Colors.blue,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
