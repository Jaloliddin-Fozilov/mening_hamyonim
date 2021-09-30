import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentAndMoney extends StatelessWidget {
  const PercentAndMoney({
    Key? key,
  }) : super(key: key);

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
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text(
                      "10,000,000 so'm",
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "90.0%",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          LinearPercentIndicator(
            alignment: MainAxisAlignment.spaceAround,
            width: 320,
            lineHeight: 5,
            percent: 0.9,
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