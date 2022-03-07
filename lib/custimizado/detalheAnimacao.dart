import 'dart:ui';

import 'package:flutter/material.dart';
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
        Positioned.fill(
          top: (20 + topPadind) * (1 - bootmPercet),
          bottom: 160 * (1 - bootmPercet),
          child: Transform.scale(
            scale: lerpDouble(1, 1.3, bootmPercet),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: PageController(viewportFraction: .9),
                    itemCount: imageurl?.length, //iamgeurl.legth
                    itemBuilder: (context, index) {
                      final imagesUrl = imageurl![index];
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(imagesUrl),
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(
                                Colors.black26, BlendMode.darken),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    imageurl!.length, //imageurl.letg
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      color: Colors.black,
                      height: 3,
                      width: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
