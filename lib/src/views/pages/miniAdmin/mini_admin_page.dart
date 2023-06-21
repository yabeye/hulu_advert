import 'package:flutter/material.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/views/pages/miniAdmin/widgets/user_mini_profile.dart';
import 'package:hulu_advert/src/views/pages/miniAdmin/widgets/widgets.dart';

class MiniAdminPage extends StatefulWidget {
  const MiniAdminPage({super.key});

  @override
  State<MiniAdminPage> createState() => _MiniAdminPageState();
}

class _MiniAdminPageState extends State<MiniAdminPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: 20.height(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.height(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Current User",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      "joined on Dec 12, 2022",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                10.height(),
                const UserMiniProfile(),
                20.height(),
                Text(
                  "Mini Admin",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                10.height(),
                const ActivityGraph(),
                const StatCard(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
