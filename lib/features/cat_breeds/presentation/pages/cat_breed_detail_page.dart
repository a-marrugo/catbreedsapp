// ignore_for_file: public_member_api_docs

import 'package:catbreedsapp/core/presentation/pages/base_page.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/presentation/widgets/cat_breed_description.dart';
import 'package:catbreedsapp/features/cat_breeds/presentation/widgets/cat_breed_image.dart';
import 'package:catbreedsapp/features/cat_breeds/presentation/widgets/cat_breed_origin.dart';
import 'package:flutter/material.dart';

/// CatBreedDetailPage displays detailed information about a specific cat breed.
/// Uses BasePage for consistent app structure.
class CatBreedDetailPage extends StatelessWidget {
  /// Constructor
  const CatBreedDetailPage({required this.catBreed, super.key});

  final CatBreed catBreed;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      leading: IconButton(
        iconSize: 18,
        splashRadius: 20,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      appBarTitle: catBreed.name,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatBreedImage(
                imageUrl: catBreed.imageUrl,
                heroTag: 'cat-image-${catBreed.id}',
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CatBreedOrigin(origin: catBreed.origin),
                      const SizedBox(height: 13),
                      CatBreedDescription(
                        description: catBreed.description,
                      ),
                      CatBreedDescription(
                        description: catBreed.description,
                      ),
                      const SizedBox(height: 13),
                      if (catBreed.temperament != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Temperament: ${catBreed.temperament}',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      if (catBreed.lifeSpan != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Life Span: ${catBreed.lifeSpan}',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      if (catBreed.wikipediaUrl != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.language,
                                size: 18,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    catBreed.wikipediaUrl!,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
