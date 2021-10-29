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
    late double monthHour;
    late double monthBudjetN;
    late double monthDayN;
    late double dayHourN;
    late double weekDay;
    late double weekBudjet;
    late double dayBudjet;
    late double hourBudjet;
    late double minutBudjet;
    late double secondsBudjet;

    final monthBudjet = TextEditingController();
    final monthDay = TextEditingController();
    final dayHour = TextEditingController();

    void calcOylikHisoblagich() {
      if (monthBudjet.text.isEmpty) {
        return;
      } else if (monthDay.text.isEmpty) {
        return;
      } else if (dayHour.text.isEmpty) {
        return;
      }

      monthBudjetN = double.parse(monthBudjet.text);
      monthDayN = double.parse(monthDay.text);
      dayHourN = double.parse(dayHour.text);

      monthHour = monthDayN * dayHourN;

      /*  Week determination*/
      weekDay = monthDayN / 4;
      weekBudjet = monthBudjetN / weekDay;
      /* Day determination  */
      dayBudjet = monthBudjetN / monthDayN;
      hourBudjet = dayBudjet / dayHourN;
      minutBudjet = hourBudjet / 60;
      secondsBudjet = minutBudjet / 60;
    }

    void resultOylikHisoblagich(BuildContext context) {
      showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (ctx) {


           print("Bir oyda $monthHour soat ishlar ekansiz \nBir oyda $monthBudjetN pul topar ekansiz \nBir haftada $weekBudjet pul topar ekansiz \nBir kunda $dayBudjet pul topar ekansiz \nBir soatda $hourBudjet pul topar ekansiz \nBir minutda $minutBudjet pul topar ekansiz \nBir sekundda $secondsBudjet pul topar ekansiz");
       
          return ResultCalc(monthHour, monthBudjetN, weekBudjet,
              dayBudjet, hourBudjet, minutBudjet, secondsBudjet);
        },
      );
    }

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
