import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:littlefish/question_three/entities/character.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: character.image,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                character.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
