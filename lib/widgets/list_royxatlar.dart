import 'package:flutter/material.dart';
import 'package:mening_hamyonim/models/list_model.dart';
import 'listtile_royxat.dart';

class ListRoyxatlar extends StatelessWidget {
  final List<ListModeli> royxatlar;
  final Function removeList;

  ListRoyxatlar(this.royxatlar,this.removeList);

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
              return ListTileRoyxat(royxatlar[index],removeList);
            },
            
            itemCount: royxatlar.length,
          ),
        ),
      ),
    );
  }
}

