import 'package:flutter/material.dart';

import 'result_calc.dart';

class CalcOylikHisoblagich extends StatefulWidget {
  const CalcOylikHisoblagich({Key? key}) : super(key: key);

  @override
  State<CalcOylikHisoblagich> createState() => _CalcOylikHisoblagichState();

 
}

class _CalcOylikHisoblagichState extends State<CalcOylikHisoblagich> {
  @override
  Widget build(BuildContext context) {
   
    double monthBudjetN = 0;
    double monthDayN = 0;
    double weekDayN = 0;
    double dayHourN = 0;
    double dayBudjet = 0;
    double weekHour = 0;
    double weekBudjet = 0;
    double monthHour = 0;
    double hourBudjet = 0;
    double minutBudjet = 0;
    double secondsBudjet = 0;

    final monthBudjet = TextEditingController();
    final monthDay = TextEditingController();
    final weekDay = TextEditingController();
    final dayHour = TextEditingController();

    void calcOylikHisoblagich() {
      if (monthBudjet.text.isEmpty) {
        return;
      } else if (monthDay.text.isEmpty) {
        return;
      } else if (weekDay.text.isEmpty) {
        return;
      } else if (dayHour.text.isEmpty) {
        return;
      }

      monthBudjetN = double.parse(monthBudjet.text);
      monthDayN = double.parse(monthBudjet.text);
      weekDayN = double.parse(monthBudjet.text);
      dayHourN = double.parse(monthBudjet.text);

      weekHour = weekDayN * dayHourN;
      monthHour = weekHour * 4;
      weekBudjet = monthBudjetN / 4;
      dayBudjet = weekBudjet / dayHourN;
      hourBudjet = dayBudjet / dayHourN;
      minutBudjet = hourBudjet / 60;
      secondsBudjet = minutBudjet / 60;

      
    }
    void resultOylikHisoblagich(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return ResultCalc(monthHour,weekBudjet,dayBudjet,hourBudjet,minutBudjet,secondsBudjet);
        
      },
    );
  }
  print("Bir oyda $monthHour soat ishlar ekansiz \nBir haftada $weekBudjet pul topar ekansiz \nBir kunda $dayBudjet pul topar ekansiz \nBir soatda $hourBudjet pul topar ekansiz \nBir minutda $minutBudjet pul topar ekansiz \nBir sekundda $secondsBudjet pul topar ekansiz");


    return Container(
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
          SizedBox(
            height: 50,
          ),
          Text(
            "Oylik hisoblagich",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Qancha oylik olishingizni kiriting",
                  ),
                  controller: monthBudjet,
                  keyboardType: TextInputType.number,
                ),
                TextField(
              decoration: InputDecoration(
                labelText: "Bir oyda nechi kun ishlashingizni kiriting",
              ),
              controller: monthDay,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Bir haftada nechi kun ishlashingizni kiriting",
              ),
              controller: weekDay,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Bir kunda nechi soat ishlashingizni kiriting",
              ),
              controller: dayHour,
              keyboardType: TextInputType.number,
            ),
              ],
            ),
          ),
          
         
          ElevatedButton(
            onPressed: () {
              calcOylikHisoblagich();
              resultOylikHisoblagich(context);
            },
            child: Text("HISOBLASH"),
          ),
        ],
      ),
    );
  }
}
