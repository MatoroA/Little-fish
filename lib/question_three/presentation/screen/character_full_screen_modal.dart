import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:littlefish/question_three/domain/entities/character.dart';

Future<void> showCharacterDialog({
  required BuildContext context,
  required Character character,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: CachedNetworkImage(
                imageUrl: character.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Text('Name: ${character.name}'),
            Text('gender: ${character.gender}'),
            const SizedBox(height: 14),
            Text('Episode:'),
            Expanded(
              child: ListView.builder(
                itemCount: character.episode.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(character.episode[index]),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
