import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class GradientAppbarWidget extends AppBar {
  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      gradient: LinearGradient(
        colors: [
          Colors.orange[900],
          Colors.orange[300],
        ],
      ),
    );
  }
}
