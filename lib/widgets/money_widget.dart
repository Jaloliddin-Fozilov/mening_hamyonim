import 'package:flutter/material.dart';

class MoneyWidget extends StatelessWidget {
  final Function() previousMonth;
  final Function() nextMonth;
  
  MoneyWidget(
    this.previousMonth,
    this.nextMonth,
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
              radius: 16,
              backgroundColor: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.arrow_left),
                color: Colors.black45,
                iconSize: 24,
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
                  text: "4,895,000",
                  style: TextStyle(
                    fontSize: 46,
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
              radius: 16,
              backgroundColor: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.arrow_right),
                color: Colors.black45,
                iconSize: 24,
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
