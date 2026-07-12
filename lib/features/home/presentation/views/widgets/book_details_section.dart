import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/custom_action_buttons.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        SizedBox(
          height: MediaQuery.sizeOf(context).width * 150 / 214,
          child: BookImage(),
        ),
        SizedBox(height: 43),
        Text('The Jungle Book', style: AppStyles.textStyle30),
        SizedBox(height: 6),
        Text(
          'Rudyard Kipling',
          style: AppStyles.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            color: Colors.white.withValues(alpha: 0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 18),
        BookRating(),
        SizedBox(height: 37),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomBookActionButtons(),
        ),
      ],
    );
  }
}
