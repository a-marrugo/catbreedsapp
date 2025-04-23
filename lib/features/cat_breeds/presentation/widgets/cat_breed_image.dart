// ignore: depend_on_referenced_packages
// ignore_for_file: public_member_api_docs

// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreedsapp/core/shared/constants/assets_image_constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CatBreedImage extends StatelessWidget {
  /// Constructor
  const CatBreedImage({
    required this.imageUrl,
    required this.heroTag,
    this.fit = BoxFit.contain,
    super.key,
  });
  final String? imageUrl;
  final String heroTag;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(color: Colors.grey[300]),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[300],
            child: Container(
              margin: const EdgeInsets.all(50),
              child: CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage(AssetsImageConstant.icReddit),
              ),
            ),
          ),
          fit: fit,
        ),
      ),
    );
  }
}
