import 'package:flutter/material.dart';
import 'package:mening_hamyonim/models/list_model.dart';
import 'listtile_royxat.dart';

class ListRoyxatlar extends StatelessWidget {
  final List<ListModeli> royxatlar;
  final Function removeList;

  ListRoyxatlar(this.royxatlar, this.removeList);

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
          child: royxatlar.length > 0
              ? ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTileRoyxat(royxatlar[index], removeList);
                  },
                  itemCount: royxatlar.length,
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/financial-profit.png",
                        fit: BoxFit.cover,
                        width: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ro'yxat hozircha bo'sh \n+\n tugmasini bosib o'z xarajatingizni kiritishingiz mumkin.",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
