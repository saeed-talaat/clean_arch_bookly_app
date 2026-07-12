import 'package:clean_artc_bookly_app/core/utils/app_images.dart';
import 'package:clean_artc_bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.bookDetailsViewRouter);
      },
      child: AspectRatio(
        aspectRatio: 150 / 224,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesTestImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
