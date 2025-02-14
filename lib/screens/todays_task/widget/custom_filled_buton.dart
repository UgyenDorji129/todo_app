import 'package:flutter/material.dart';

Widget customFilledButton({label, color, updateIndex, index}) {
  return Container(
    margin: EdgeInsets.only(top: 10, right: 15), 
    child: FilledButton(
        style:
            ButtonStyle(backgroundColor: WidgetStateProperty.all(color)),
        onPressed: () {updateIndex(index);},
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600),
        )),
  );
}
