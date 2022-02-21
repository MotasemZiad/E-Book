import 'package:flutter/material.dart';

class CustomRoundedBottomBar extends StatelessWidget {
  const CustomRoundedBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
                size: 20,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star_border,
                color: Colors.black,
                size: 20,
              ),
              label: 'Star',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.black,
                size: 20,
              ),
              label: 'Watch',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.share,
                color: Colors.black,
                size: 20,
              ),
              label: 'Share',
            ),
          ],
        ),
      ),
    );
  }
}
