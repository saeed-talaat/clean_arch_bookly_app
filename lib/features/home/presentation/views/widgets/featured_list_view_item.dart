import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 150 / 224,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
