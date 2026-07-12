import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomBookActionButtons extends StatelessWidget {
  const CustomBookActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: r'19.19$',
            textColor: Colors.black,
            backGroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),

        Expanded(
          child: CustomButton(
            fontSize: 16,
            text: 'Free preview',
            textColor: Colors.white,
            backGroundColor: Color(0xFFEF8262),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
