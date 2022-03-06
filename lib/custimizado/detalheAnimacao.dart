import 'package:flutter/material.dart';
import 'package:travelmoz/models/moz.dart';

class DetalheAnimacao extends StatelessWidget {
  final Moz mozs;
  const DetalheAnimacao({
    Key? key,
    required this.mozs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageurl = mozs.fotos;
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: imageurl?.length, //iamgeurl.legth
            itemBuilder: (context, index) {
              final imagesUrl = imageurl![index];
              return Container(
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
    );
  }
}
