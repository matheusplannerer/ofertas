import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onTap;
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;
  final String text;

  ButtonWidget({this.height, this.margin, this.onTap, this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF8A65), Color(0xFFFF5722), Color(0xFFD84315)],
        ),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
              color: Color(0xFF6078ea).withOpacity(.3),
              offset: Offset(0.0, 8.0),
              blurRadius: 8.0)
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins-Bold",
                  fontSize: 18,
                  letterSpacing: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
