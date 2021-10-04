import 'package:flutter/material.dart';
import 'package:mening_hamyonim/models/list_model.dart';
import 'package:intl/intl.dart';

import '../models/list_model.dart';

class ListTileRoyxat extends StatefulWidget {
  final ListModeli royxatlar;
  final Function removeList;
  ListTileRoyxat(this.royxatlar, this.removeList);

  @override
  State<ListTileRoyxat> createState() => _ListTileRoyxatState();
}

class _ListTileRoyxatState extends State<ListTileRoyxat> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        // Then show a snackbar.
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${widget.royxatlar.name} o'chirildi")));
      },
      // Show a red background as the item is swiped away.
      background: Container(
        padding: EdgeInsets.all(24),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(Icons.delete_forever, color: Colors.white),
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xffEFEEFC),
            child: Icon(
              (widget.royxatlar.icon),
              color: Colors.black45,
              size: 24,
            ),
          ),
        ),
        title: Text(
          widget.royxatlar.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "${DateFormat("d-MMMM-yyyy").format(widget.royxatlar.day)}",
          style: TextStyle(fontSize: 12),
        ),
        trailing: Text("${widget.royxatlar.price} so'm"),
      ),
    );
  }
}
