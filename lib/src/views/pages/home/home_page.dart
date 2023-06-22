import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/user_controller.dart';
import 'package:hulu_advert/src/views/pages/feed/feed_page.dart';
import 'package:hulu_advert/src/views/pages/miniAdmin/mini_admin_page.dart';
import 'package:hulu_advert/src/views/pages/search/search_page.dart';
import 'package:hulu_advert/src/views/shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  late final ValueNotifier<bool> _isDialOpen;

  @override
  void initState() {
    super.initState();
    _isDialOpen = ValueNotifier<bool>(false);
    Get.find<UserController>();
  }

  @override
  void dispose() {
    _isDialOpen.dispose();
    super.dispose();
  }

  _onChooseUpload() async {}

  Widget _getBody() {
    switch (_page) {
      case 0:
        return const FeedPage();
      case 1:
        return const SearchPage();
      case 2:
        return const MiniAdminPage();
      default:
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Unknown screen")],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(showLeading: false),
      body: _getBody(),
      bottomNavigationBar: AppBottomNavBar(
        page: _page,
        onPageChange: (v) {
          _page = v;
          setState(() {});
        },
      ),
      floatingActionButton: _page == 2
          ? null
          : AppFloatingButton(
              isDialOpen: _isDialOpen,
              onChooseUpload: _onChooseUpload,
              visible: true,
            ),
    );
  }
}
