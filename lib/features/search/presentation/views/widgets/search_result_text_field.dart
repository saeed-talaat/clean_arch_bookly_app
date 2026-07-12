import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 13,
      itemBuilder: (BuildContext context, int index) {
        return BestSellerItem();
      },
    );
  }
}
