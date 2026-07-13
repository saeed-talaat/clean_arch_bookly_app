import 'package:clean_artc_bookly_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          context.read<SearchCubit>().searchBooks(query: value.trim());
        }
      },
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: Opacity(opacity: 0.7, child: Icon(Icons.search, size: 22)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
