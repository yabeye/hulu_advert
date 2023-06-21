import 'package:flutter/material.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/views/pages/product/widgets/widgets.dart';

import 'package:hulu_advert/src/views/shared/shared.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomTabScrollView(
      children: [
        [
          SliverToBoxAdapter(
            child: 10.height(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: ProductCard(),
                );
              },
              childCount: 10,
            ),
          ),
        ],
        [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ListTile(title: Text('Second')),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
