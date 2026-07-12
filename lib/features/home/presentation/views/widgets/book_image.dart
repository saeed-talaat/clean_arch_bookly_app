import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_artc_bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.bookDetailsViewRouter);
      },
      child: AspectRatio(
        aspectRatio: 150 / 224,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
