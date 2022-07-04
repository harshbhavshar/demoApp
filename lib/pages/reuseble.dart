// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

txt(String text, double size, Color color, FontWeight Fwidth) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: Fwidth,
    ),
  );
}

sizebox(double height) {
  return SizedBox(
    height: height,
  );
}

textfild(String htxt, TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xfffaf4f4), borderRadius: BorderRadius.circular(8)),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: htxt,
        labelText: htxt,
        labelStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(),
      ),
    ),
  );
}

btn(context, String Btxt) {
  return ElevatedButton(
    onPressed: () {},
    child: Padding(
      padding: EdgeInsets.all(10),
      child: txt(Btxt, 18, Colors.white, FontWeight.normal),
    ),
    style: ElevatedButton.styleFrom(
      primary: Color(0xffFFB61D),
    ),
  );
}

snak(context, String txt) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(txt)));
}
