import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  String labelText;
  Color buttonColor;
  TextEditingController controller;
  Function onTap;

  SearchWidget({
    this.labelText = 'Github username',
    this.buttonColor,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.subtitle,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: -15,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 100,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: buttonColor != null
                    ? buttonColor
                    : Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 10,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Text(
                'Search',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
        )
      ],
    );
  }
}
