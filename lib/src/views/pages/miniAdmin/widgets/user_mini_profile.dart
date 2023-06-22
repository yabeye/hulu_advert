import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/auth_controller.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/utils.dart';

class UserMiniProfile extends StatelessWidget {
  UserMiniProfile({
    super.key,
  });

  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(
      () {
        final user = _authController.currentUser.value;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.superLightGray,
            borderRadius: BorderRadius.circular(defaultBorderRadiusSize),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imgNoUser,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName ?? "",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "@${user.username}   •   ",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              user.phone ?? "",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        20.height(),
                      ],
                    ),
                  ],
                ),
                10.height(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "My Products",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "4",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Container(
                      width: 2,
                      height: 16,
                      decoration: BoxDecoration(
                        color: AppColors.black.withAlpha(108),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "My Promotions",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "8",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                20.height(),
              ],
            ),
          ),
        );
      },
    );
  }
}
