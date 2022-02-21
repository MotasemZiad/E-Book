import 'package:flutter/material.dart';

class BookImageItem extends StatelessWidget {
  const BookImageItem({
    Key? key,
    required this.books,
    required this.index,
  }) : super(key: key);

  final List books;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        image: DecorationImage(
          image: AssetImage(books[index]['img']),
        ),
      ),
    );
  }
}
