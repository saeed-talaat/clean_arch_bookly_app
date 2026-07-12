import 'package:clean_artc_bookly_app/constants.dart';
import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          BookImage(image: bookEntity.imageUrl ?? ''),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(
                    bookEntity.title,
                    style: AppStyles.textStyle20.copyWith(
                      fontFamily: kAppFontFamily,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3),
                Text(bookEntity.authorName ?? 'noName', style: AppStyles.textStyle14, maxLines: 1),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      bookEntity.price.toString() ,
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
