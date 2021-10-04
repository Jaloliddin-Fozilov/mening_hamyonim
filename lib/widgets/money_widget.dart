import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyWidget extends StatelessWidget {
  final Function() previousMonth;
  final Function() nextMonth;
  final double totalPriceSum;

  MoneyWidget(
    this.previousMonth,
    this.nextMonth,
    this.totalPriceSum,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: Colors.black45),
            ),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.arrow_left),
                color: Colors.black45,
                iconSize: 20,
                padding: const EdgeInsets.all(0),
                onPressed: previousMonth,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: NumberFormat.currency(symbol: "").format(totalPriceSum),
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
                TextSpan(
                  text: " so'm",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: Colors.black45),
            ),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.arrow_right),
                color: Colors.black45,
                iconSize: 20,
                padding: const EdgeInsets.all(0),
                onPressed: nextMonth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
