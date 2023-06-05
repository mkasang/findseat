import 'package:flutter/material.dart';
import 'package:genielogiciel/utils/dummy_data.dart';

class CustomerSlider extends StatelessWidget {
  final index;
  const CustomerSlider({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width,
      color: Colors.red,
      child: Image.asset(
        sliderData[index].url,
        fit: BoxFit.cover,
      ),
    );
  }
}
