import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key, required this.logoString});

  final String logoString;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 5),
      width: size.width <= 320 ? 55 : 70,
      height: size.width <= 320 ? 55 : 70,
      // padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            spreadRadius: 2,
            offset: Offset(0, 3),
          )
        ],
        image: DecorationImage(
          image: AssetImage(logoString),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
