// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:discover/screens/preview_item.dart';

class ProductItemList extends StatelessWidget {
  final String name;
  final String price;
  final List<String> rating;
  final List<String> images;
  final String description;
  final String review;
  final List<String> size;
  final String old_price;
  final int productId;
  final product;

  const ProductItemList(
      {super.key,
      required this.name,
      required this.price,
      required this.rating,
      required this.images,
      required this.description,
      required this.review,
      required this.size,
      required this.old_price,
      required this.productId,
      this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewItem(
              product: product,

              // {
              //   'name': name,
              //   'price': price,
              //   'rating': rating,
              //   'image': images,
              //   'description': description,
              //   'review': review,
              //   'size': size,
              //   'old price': old_price,
              // },
              productId: productId,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(37, 158, 158, 158),
              ),
              child: Image.asset(
                images.first,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          rating[0],
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '\$$price',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
