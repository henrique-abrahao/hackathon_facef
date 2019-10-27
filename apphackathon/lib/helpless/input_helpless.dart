import 'package:flutter/material.dart';

class InputHelp extends StatefulWidget {
  final String text;
  final bool pass;
  final TextEditingController controller;

  InputHelp({@required this.pass,  @required this.text, @required this.controller});

  @override
  _InputHelpState createState() => _InputHelpState();
}

class _InputHelpState extends State<InputHelp> {
  bool viewPass = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Container(
          color: Colors.white,
          child: TextField(
            controller: widget.controller,
            keyboardType: !widget.pass ? TextInputType.number : null,
            style: TextStyle(color: Theme
                .of(context)
                .primaryColor),
            decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  width: 0.8,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Theme
                    .of(context)
                    .primaryColor, width: 0.8),
              ),

              hintText: widget.text,
              suffixIcon: widget.pass == true
                  ? viewPass == true
                  ? IconButton(
                icon: Icon(
                  Icons.visibility_off,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
                onPressed: () {
                  onView();
                },
              )
                  : IconButton(
                  icon: Icon(Icons.visibility,
                      color: Theme
                          .of(context)
                          .primaryColor),
                  onPressed: () {
                    onView();
                  })
//                    : Icon(Icons.add),
                  : null,
              hintStyle: TextStyle(color: Theme
                  .of(context)
                  .primaryColor),
            ),
            obscureText:
            widget.pass == true ? viewPass == true ? true : false : false,
          ),
        ));
  }

  void onView() {
    setState(() {
      viewPass = !viewPass;
    });
  }
}
