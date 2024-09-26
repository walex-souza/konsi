import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  const PrimaryButtonWidget({super.key, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0), // Bordas arredondadas
          ),
          backgroundColor: const Color(0xff2E8896),
        ),
        onPressed: onPressed,
        child: Text(
          title ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
