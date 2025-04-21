import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:flutter/material.dart';

/// This widget represents a card that displays basic information about a cat breed.
/// It includes:
/// - An image representing the cat breed.
/// - Basic details such as the breed name and other relevant information.
class CatBreedCard extends StatelessWidget {
  /// Constructor
  const CatBreedCard({required this.catBreed, super.key});

  final CatBreed catBreed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Placeholder(
          child: Text(
            catBreed.name,
          ),
        ),
      ),
    );
  }
}
