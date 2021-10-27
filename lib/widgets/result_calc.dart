import 'package:flutter/material.dart';

class ResultCalc extends StatelessWidget {
  
  double monthHour;
  double weekBudjet;
  double dayBudjet;
  double hourBudjet;
  double minutBudjet;
  double secondsBudjet;

  ResultCalc(this.monthHour, this.weekBudjet, this.dayBudjet, this.hourBudjet, this.minutBudjet, this.secondsBudjet);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Text(
              "Bir oyda $monthHour soat ishlar ekansiz \nBir haftada $weekBudjet pul topar ekansiz \nBir kunda $dayBudjet pul topar ekansiz \nBir soatda $hourBudjet pul topar ekansiz \nBir minutda $minutBudjet pul topar ekansiz \nBir sekundda $secondsBudjet pul topar ekansiz"),
    );
  }
}