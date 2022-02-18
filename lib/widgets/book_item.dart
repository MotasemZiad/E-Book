import 'package:flutter/material.dart';
import 'package:e_book/utils/constants.dart';

class BookItem extends StatelessWidget {
  const BookItem({Key? key, required this.books, required this.index})
      : super(key: key);
  final List books;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: tabBarViewColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
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
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 24,
                      color: starColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      books[index]['rating'],
                      style: const TextStyle(
                        color: menu2Color,
                      ),
                    ),
                  ],
                ),
                Text(
                  books[index]['title'].toString().toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  books[index]['text'],
                  style: const TextStyle(color: subTitleColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: 40,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: loveColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Love',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
