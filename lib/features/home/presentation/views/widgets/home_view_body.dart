import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHomeAppBar(),
                SizedBox(height: 32),
                FeaturedListView(),
                SizedBox(height: 50),
                Text(
                  'Best Seller',
                  style: AppStyles.textStyle20.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 16),
              ],
            ),
          ),
          BestSellerListView(),
        ],
      ),
    );
  }
}
