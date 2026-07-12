import 'package:clean_artc_bookly_app/core/utils/app_images.dart';
import 'package:clean_artc_bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(Assets.assetsImagesLogo, height: 18),
        IconButton(
          onPressed: () {
            context.push(AppRouter.searchViewRouter);
          },
          icon: Icon(Icons.search, size: 28, color: Colors.white),
        ),
      ],
    );
  }
}
