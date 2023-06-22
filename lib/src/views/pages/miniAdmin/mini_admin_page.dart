import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hulu_advert/src/controllers/auth_controller.dart';
import 'package:hulu_advert/src/extensions/extensions.dart';
import 'package:hulu_advert/src/views/pages/miniAdmin/widgets/user_mini_profile.dart';
import 'package:hulu_advert/src/views/pages/miniAdmin/widgets/widgets.dart';

class MiniAdminPage extends StatefulWidget {
  const MiniAdminPage({super.key});

  @override
  State<MiniAdminPage> createState() => _MiniAdminPageState();
}

class _MiniAdminPageState extends State<MiniAdminPage> {
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mini Admin",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              InkWell(
                onTap: _authController.logout,
                child: const Icon(Icons.logout),
              ),
            ],
          ),
          floating: true,
          snap: true,
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
                    const SizedBox.shrink(),
                    Column(
                      children: [
                        // Text(
                        //   "Current User",
                        //   style: Theme.of(context).textTheme.displaySmall,
                        // ),
                        Text(
                          "joined on ${_authController.currentUser.value.createdAt!.joinedFormat()}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                10.height(),
                UserMiniProfile(),
                20.height(),
                10.height(),
                ActivityGraph(),
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
