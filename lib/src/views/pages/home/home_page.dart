import 'package:flutter/material.dart';
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
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("List screen")],
          ),
        );
      case 1:
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Search screen")],
          ),
        );
      case 2:
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Analytics screen")],
          ),
        );
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
      floatingActionButton: AppFloatingButton(
        isDialOpen: _isDialOpen,
        onChooseUpload: _onChooseUpload,
        visible: true,
      ),
    );
  }
}
