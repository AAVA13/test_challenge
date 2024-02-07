import 'package:flutter/material.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';

// Creating a StatelessWidget for a general button
class OwnAppBar extends StatelessWidget {
  const OwnAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/deepcompany_logo.jpg'),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              'DeepCompany',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
      centerTitle: true,
    );
  }
}
