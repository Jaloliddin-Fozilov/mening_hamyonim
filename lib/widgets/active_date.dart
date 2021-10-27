import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActiveDate extends StatelessWidget {
  final Function selectDate;
  final DateTime? tanlanganOy;

  ActiveDate(
    this.selectDate,
    this.tanlanganOy,
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
              tanlanganOy == null
                  ? DateFormat("MMMM, yyyy").format(DateTime.now())
                  : DateFormat("MMMM, yyyy").format(tanlanganOy!),
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
