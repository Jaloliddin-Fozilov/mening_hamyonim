import 'package:flutter/material.dart';

class AddBudjet extends StatelessWidget {

  final inputBudjet = TextEditingController();
  final Function addAllBudjet;
  late double budjet;

  AddBudjet(this.addAllBudjet);
  
  void submitBudjet(){
    if(inputBudjet.text.isEmpty){
      return;
    }
    budjet = double.parse(inputBudjet.text);
    addAllBudjet(budjet);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Oylik byudjetni kiriting",
          ),
          controller: inputBudjet,
          keyboardType: TextInputType.number,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Bekor qilish"),),
            ElevatedButton(onPressed: submitBudjet, child: Text("Kiritish"),),
          ],
        ),
      ],
    ),);
  }
}