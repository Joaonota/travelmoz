import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelmoz/custimizado/pageviewIamge.dart';
import 'package:travelmoz/models/moz.dart';

class DetalheAnimacao extends StatelessWidget {
  final Moz mozs;
  const DetalheAnimacao({
    Key? key,
    required this.mozs,
    required this.topPercet,
    required this.bootmPercet,
  }) : super(key: key);

  final double topPercet;
  final double bootmPercet;

  @override
  Widget build(BuildContext context) {
    final topPadind = MediaQuery.of(context).padding.top;
    final imageurl = mozs.fotos;
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: Padding(
            padding: EdgeInsets.only(
              top: (20 + topPadind) * (1 - bootmPercet),
              bottom: 160 * (1 - bootmPercet),
            ),
            child: Transform.scale(
              scale: lerpDouble(1, 1.3, bootmPercet)!,
              child: PageViewIamge(imageurl: imageurl),
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 140,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.heart,
                    color: Colors.red,
                  ),
                  label: const Text("0"),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.reply,
                    color: Colors.green,
                  ),
                  label: const Text("10K"),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      primary: Colors.blue.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  icon: const Icon(
                    Icons.check_circle_outline,
                  ),
                  label: const Text("verficado"),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    ("${mozs.fotoPM}"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Presidente do municipio",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      "${mozs.presidenteM}",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
