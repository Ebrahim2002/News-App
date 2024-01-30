import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildRowItem(BuildContext context, articles) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
            width: MediaQuery.of(context).size.width * 0.26,
            height: MediaQuery.of(context).size.height * 0.16,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            imageUrl: '${articles['urlToImage']}',
            placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error,color: Colors.grey,)),
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
Widget shimmerCard(context)
{
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(.25),
    highlightColor: Colors.white.withOpacity(0.6),
    period: const Duration(seconds: 2),
    direction: ShimmerDirection.ltr,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.9),
            ),
          ),
        ),
        Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 17,
                  width: MediaQuery.of(context).size.width-160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 17,
                width: MediaQuery.of(context).size.width-160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 17,
                width: MediaQuery.of(context).size.width-200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}