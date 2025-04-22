import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// This widget represents a card that displays basic information about a cat breed.
/// It adjusts its height dynamically based on a random value and shows a shimmer effect
/// while the image is loading.
class CatBreedCard extends StatelessWidget {
  /// Constructor
  const CatBreedCard({required this.catBreed, super.key});

  final CatBreed catBreed;

  @override
  Widget build(BuildContext context) {
    final randomHeight = 180;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Imagen con altura aleatoria y efecto shimmer como placeholder
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              height: randomHeight.toDouble(),
              child: CachedNetworkImage(
                imageUrl: catBreed.imageUrl ?? '',
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.grey[300],
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.error, color: Colors.red),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido de texto
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              catBreed.name,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
