import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/featured_list_view_bloc_builder.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/newset_list_view_bloc_builder.dart';
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
              FeaturedListViewBlocBuilder(),
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
          NewsetListViewBlocBuilder()
        ],
      ),
    );
  }
}
