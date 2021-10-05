import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class AddConsumtionModal extends StatefulWidget {
  final Function xarajat;

  AddConsumtionModal(this.xarajat);

  @override
  State<AddConsumtionModal> createState() => _AddConsumtionModalState();
}

class _AddConsumtionModalState extends State<AddConsumtionModal> {
  DateTime? tanlanganKun;
  IconData? tanlanganIcon;

  final inputXarajatName = TextEditingController();
  final inputXarajatMiqdor = TextEditingController();

  void submitXarajat() {
    if (inputXarajatName.text.isEmpty &&
        inputXarajatMiqdor.text.isEmpty &&
        tanlanganKun == null &&
        tanlanganIcon == null) {
      return;
    }
    widget.xarajat(inputXarajatName.text, tanlanganKun,
        double.parse(inputXarajatMiqdor.text), tanlanganIcon);
    Navigator.of(context).pop();
  }

  void selectDateDay(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((selectedDay) {
      if (selectedDay != null) {
        setState(() {
          tanlanganKun = selectedDay;
        });
      }
    });
  }

  void selectIcon(BuildContext context) {
    FlutterIconPicker.showIconPicker(
      context,
      iconPackMode: IconPack.material,
    ).then(
      (selectedIcon) {
        if (selectedIcon != null) {
          setState(() {
            tanlanganIcon = selectedIcon;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    controller: inputXarajatName,
                  ),
                ),
                Container(
                  width: 150.0,
                  child: TextField(
                    decoration: InputDecoration(labelText: "Xarajat miqdori"),
                    controller: inputXarajatMiqdor,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tanlanganKun == null
                      ? "Sana hali tanlanmagan!"
                      : DateFormat("MMMM  d, yyyy").format(tanlanganKun!),
                ),
                TextButton(
                  onPressed: () {
                    selectDateDay(context);
                  },
                  child: Text("KUNNI TANLASH"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tanlanganIcon != null
                    ? Icon(tanlanganIcon)
                    : Text("Icon tanlanmagan!"),
                TextButton(
                  onPressed: () {
                    selectIcon(context);
                  },
                  child: Text("ICON TANLASH"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("BEKOR QILISH"),
                ),
                ElevatedButton(
                  onPressed: () {
                    submitXarajat();
                  },
                  child: Text("KIRITISH"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
