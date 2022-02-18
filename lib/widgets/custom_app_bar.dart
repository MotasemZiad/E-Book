import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ImageIcon(
            AssetImage('assets/images/menu.png'),
            size: 24,
            color: Colors.black,
          ),
          Row(
            children: const [
              Icon(
                Icons.search,
                color: Colors.black,
                size: 24,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.notifications_active,
                color: Colors.black,
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
