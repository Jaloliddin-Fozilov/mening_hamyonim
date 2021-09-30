import 'package:flutter/material.dart';

class ActiveDate extends StatelessWidget {
  final Function selectDate;

  ActiveDate(
    this.selectDate,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              selectDate(context);
            },
            child: Text(
              "August, 2021",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
