import 'package:flutter/material.dart';
import 'package:test_challenge/ui/widgets/organisms/app_bar.dart';
import 'package:test_challenge/ui/widgets/organisms/nav_bar.dart';

class Layout extends StatelessWidget {
  final String currentPage;

  const Layout({super.key, required this.child, required this.currentPage});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const OwnAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(child: child),
      ),
      bottomNavigationBar: OwnNavBar(currentPage: currentPage),
    );
  }
}
