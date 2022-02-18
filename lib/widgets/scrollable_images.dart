import 'package:flutter/material.dart';

class ScrollableImages extends StatelessWidget {
  const ScrollableImages({
    Key? key,
    required this.popularBooks,
  }) : super(key: key);

  final List popularBooks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          Positioned(
            left: -20,
            top: 0,
            right: 0,
            child: SizedBox(
              height: 180,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: popularBooks.length,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(popularBooks[index]['img']),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
