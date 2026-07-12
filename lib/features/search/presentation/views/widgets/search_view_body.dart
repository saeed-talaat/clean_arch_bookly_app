import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:clean_artc_bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:clean_artc_bookly_app/features/search/presentation/views/widgets/search_result_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(height: 16),
          Text('Search Result', style: AppStyles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
