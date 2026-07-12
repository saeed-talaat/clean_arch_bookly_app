import 'package:clean_artc_bookly_app/constants.dart';
import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          BookImage(),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(
                    'Harry Potter and the Goblet of Fire',
                    style: AppStyles.textStyle20.copyWith(
                      fontFamily: kAppFontFamily,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3),
                Text('J.K. Rowling', style: AppStyles.textStyle14, maxLines: 1),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      r'19.19$',
                      style: AppStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    BookRating(),
                    SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
