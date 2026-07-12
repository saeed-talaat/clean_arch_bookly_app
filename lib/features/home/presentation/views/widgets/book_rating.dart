import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 8),
        Text('4.8', style: AppStyles.textStyle16),
        SizedBox(width: 8),
        Opacity(
          opacity: 0.5,
          child: Text('(245)', style: AppStyles.textStyle14),
        ),
      ],
    );
  }
}
