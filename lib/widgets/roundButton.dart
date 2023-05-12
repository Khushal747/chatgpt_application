import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final VoidCallback ontap;
  final String title;
  const RoundButton({Key? key,
    required this.title,
    required this.ontap,
    // required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width:100,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(title,
          style: const TextStyle(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
