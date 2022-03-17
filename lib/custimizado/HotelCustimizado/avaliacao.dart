import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travelmoz/models/hotel.dart';

class Avaliacao extends StatelessWidget {
  const Avaliacao({
    Key? key,
    required this.hotels,
  }) : super(key: key);

  final Hotel hotels;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              (hotels.fotos![0]),
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
                "Avalicao do Hotel",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Text(
                "${hotels.nome}",
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          /* Container(
            color: Colors.blue.shade100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Text("5.5"),
          )*/
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
                primary: Colors.blue.shade600,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            icon: const Icon(
              Icons.star,
            ),
            label: Text(hotels.avaliacao.toString()),
          ),
        ],
      ),
    );
  }
}
