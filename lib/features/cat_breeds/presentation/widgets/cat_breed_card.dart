// ignore: depend_on_referenced_packages
// ignore_for_file: public_member_api_docs
// ignore: depend_on_referenced_packages
import 'package:catbreedsapp/core/shared/constants/assets_image_constant.dart';
import 'package:catbreedsapp/core/shared/l10n/l10n.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/presentation/widgets/cat_breed_description.dart';
import 'package:catbreedsapp/features/cat_breeds/presentation/widgets/cat_breed_origin.dart';
import 'package:flutter/material.dart';
import 'cat_breed_image.dart';

/// A widget that displays detailed information about a cat breed in a card format.
///
/// Shows the breed's name, a sample post description, awards, an image,
/// and interactive actions such as like, dislike, comment, share, and award.
/// Designed to mimic a social media post style for engaging UI presentation.
class CatBreedCard extends StatelessWidget {
  const CatBreedCard({
    required this.catBreed,
    required this.onTap,
    super.key,
  });
  final CatBreed catBreed;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 6),
          CatBreedOrigin(origin: catBreed.origin),
          const SizedBox(height: 13),
          GestureDetector(
            onTap: onTap,
            child: CatBreedDescription(
              description: catBreed.description,
              maxLines: 2,
            ),
          ),
          const SizedBox(height: 13),
          GestureDetector(
            onTap: onTap,
            child: CatBreedImage(
              imageUrl: catBreed.imageUrl,
              heroTag: 'cat-image-${catBreed.id}',
            ),
          ),
          _buildActions(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => Row(
        children: [
          CircleAvatar(
            radius: 19,
            backgroundImage: AssetImage(AssetsImageConstant.icReddit),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'r/${catBreed.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  context.l10n.defaultPosted,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4500),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          const Icon(
            Icons.more_vert_outlined,
            size: 30,
          )
        ],
      );

  Widget _buildOrigin(BuildContext context) => Row(
        children: [
          Image.asset(
            AssetsImageConstant.premiumBonus,
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 8),
          Visibility(
            visible: catBreed.origin != null,
            child: Text(
              '${context.l10n.origin}: ${catBreed.origin}',
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          )
        ],
      );

  Widget _buildDescription() => Visibility(
        visible: catBreed.description != null,
        child: Text(
          catBreed.description ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      );

  Widget _buildActions(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.star_border_outlined, size: 24),
                label: const Text(
                  '90',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  minimumSize: const Size(0, 32),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.heart_broken_outlined, size: 24),
                label: const Text(
                  '3',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  minimumSize: const Size(0, 32),
                ),
              ),
            ],
          ),
          Flexible(
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.comment_outlined, size: 24),
              label: const Text(
                '2.9k',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                minimumSize: const Size(0, 32),
              ),
            ),
          ),
          Flexible(
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined, size: 24),
              label: Text(
                context.l10n.share,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                minimumSize: const Size(0, 32),
              ),
            ),
          ),
          Flexible(
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.monetization_on_outlined, size: 24),
              label: Text(
                context.l10n.award,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                minimumSize: const Size(0, 32),
              ),
            ),
          ),
        ],
      );
}
