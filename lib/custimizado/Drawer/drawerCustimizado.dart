import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drawerCutimizado() {
  return Drawer(
    child: ListView(
      children: const [
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: CircleAvatar(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/vetores-gratis/fundo-futurista-de-tecnologia-isometrica_52683-74304.jpg?w=740&t=st=1647686552~exp=1647687152~hmac=758842c64f795617532cc5aae94922ec2111029dea1a007da756aeacae27b722"),
                fit: BoxFit.cover),
          ),
        ),
      ],
    ),
  );
}
