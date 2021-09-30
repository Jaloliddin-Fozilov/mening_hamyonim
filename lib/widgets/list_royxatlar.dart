import 'package:flutter/material.dart';

class ListRoyxatlar extends StatelessWidget {
  const ListRoyxatlar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Color(0xffEFEEFC),
        body: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            ),
          ),
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xffEFEEFC),
                    child: Icon(
                      (Icons.home),
                      color: Colors.black45,
                      size: 24,
                    ),
                  ),
                ),
                title: Text("Konditsioner"),
                subtitle: Text("13-August, 2021"),
                trailing: Text("350,000 so'm"),
              );
            },
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
