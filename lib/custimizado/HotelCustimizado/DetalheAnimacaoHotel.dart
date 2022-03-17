import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelmoz/custimizado/HotelCustimizado/avaliacao.dart';
import 'package:travelmoz/models/hotel.dart';

import '../pageviewIamge.dart';
import '../translationAnimation.dart';

class DetalheAnimacaoHotel extends StatelessWidget {
  const DetalheAnimacaoHotel(
      {Key? key,
      required this.hotel,
      required this.topPercet,
      required this.bootmPercet})
      : super(key: key);
  final Hotel hotel;
  final double topPercet;
  final double bootmPercet;

  @override
  Widget build(BuildContext context) {
    final topPadind = MediaQuery.of(context).padding.top;
    final imageurl = hotel.fotos;
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: (20 + topPadind) * (1 - bootmPercet),
                  bottom: 160 * (1 - bootmPercet),
                ),
                child: Transform.scale(
                  scale: lerpDouble(1, 1.3, bootmPercet)!,
                  child: PageViewIamge(imageurl: imageurl!),
                ),
              ),
              Positioned(
                top: topPadind,
                left: -60 * (1 - bootmPercet),
                child: const BackButton(
                  color: Colors.white,
                ),
              ),
              Positioned(
                top:
                    lerpDouble(-30, 140, topPercet)!.clamp(topPercet + 10, 140),
                left: lerpDouble(60, 20, topPercet)!.clamp(20.0, 50.0),
                child: Text(
                  "${hotel.nome}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: lerpDouble(20, 40, topPercet)!,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
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
                    CupertinoIcons.heart_circle,
                    color: Colors.red,
                  ),
                  label: const Text("LIKE"),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.reply_all,
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
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
          child: TranslationAnimation(
              child: Avaliacao(hotels: hotel) //DetalheUser(mozs: mozs),
              ),
        )
      ],
    );
  }
}
