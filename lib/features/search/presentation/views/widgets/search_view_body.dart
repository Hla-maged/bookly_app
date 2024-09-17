import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'search_result_list.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                SearchTextField(),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: SearchResultList())
              ],
            ),
          )
        ],
      ),
    );
  }
}
