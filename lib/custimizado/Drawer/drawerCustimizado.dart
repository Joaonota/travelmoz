import 'dart:ui';

import 'package:flutter/material.dart';

Widget drawerCutimizado() {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/vetores-gratis/fundo-futurista-de-tecnologia-isometrica_52683-74304.jpg?w=740&t=st=1647686552~exp=1647687152~hmac=758842c64f795617532cc5aae94922ec2111029dea1a007da756aeacae27b722"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 190, top: 50),
                child: Material(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  elevation: 8.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 39,
                      backgroundImage: NetworkImage(
                        "https://img.freepik.com/vetores-gratis/fundo-digital-do-espaco-azul-da-copia_23-2148821698.jpg?w=740&t=st=1647735310~exp=1647735910~hmac=91e7b543fdd35612d7d18cb6cb3d1ee4ecacc9c7a6b47a6920869de5d95f2515",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
