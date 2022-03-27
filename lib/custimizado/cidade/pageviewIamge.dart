

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PageViewIamge extends StatelessWidget {
  final List<String> imageurl;
  const PageViewIamge({
    Key? key,
    required this.imageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: PageController(viewportFraction: .9),
            itemCount: imageurl.length, //iamgeurl.legth
            itemBuilder: (context, index) {
              final imagesUrl = imageurl[index];
              return Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: imagesUrl == null
                        ? const NetworkImage(
                            "https://img.freepik.com/vetores-gratis/fundo-futurista-de-tecnologia-isometrica_52683-74304.jpg?w=740&t=st=1647686552~exp=1647687152~hmac=758842c64f795617532cc5aae94922ec2111029dea1a007da756aeacae27b722")
                        : NetworkImage(imagesUrl),
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
            imageurl.length, //imageurl.letg
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
