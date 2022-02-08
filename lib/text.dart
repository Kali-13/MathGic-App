import 'package:flutter/material.dart';

class Texx extends StatelessWidget {
  Texx({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 259,
      child: TextFormField(
        maxLength: 5,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.deepPurple[200],
          contentPadding: EdgeInsets.all(6),
          isDense: true,
          isCollapsed: true,
          suffixIcon: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: onPressed,
            color: Colors.deepPurple,
          ),
          hintText: "Your's Turn",
          hintStyle: TextStyle(color: Colors.deepPurple, fontSize: 20),
          errorStyle: TextStyle(
            color: Colors.cyan,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        textAlign: TextAlign.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Can not be Empty";
          } else if (value.length < 5) {
            return "Please Enter 5 Digit Number";
          }
          return null;
        },
      ),
    );
  }
}
