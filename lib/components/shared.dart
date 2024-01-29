import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget buildRowItem(BuildContext context, articles) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.26,
          height: MediaQuery.of(context).size.height * 0.16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                articles['urlToImage'] != null ? '${articles['urlToImage']}' : 'https://clipart-library.com/images_k/no-symbol-transparent-background/no-symbol-transparent-background-14.png',
            ),
          ),
        ),
      ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${articles['title']}', //title
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
               Text(
                '${articles['publishedAt']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}