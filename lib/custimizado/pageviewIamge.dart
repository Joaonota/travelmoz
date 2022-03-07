import 'package:flutter/material.dart';

class PageViewIamge extends StatelessWidget {
  const PageViewIamge({
    Key? key,
    required this.imageurl,
  }) : super(key: key);

  final List<String>? imageurl;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
