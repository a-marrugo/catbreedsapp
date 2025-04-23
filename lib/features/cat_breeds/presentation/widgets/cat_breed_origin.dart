// ignore_for_file: public_member_api_docs

import 'package:catbreedsapp/core/shared/constants/assets_image_constant.dart';
import 'package:catbreedsapp/core/shared/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// Widget to display the origin of the cat breed.
class CatBreedOrigin extends StatelessWidget {
  /// Constructor
  const CatBreedOrigin({required this.origin, super.key});
  final String? origin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsImageConstant.premiumBonus,
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 8),
        Visibility(
          visible: origin != null,
          child: Text(
            '${context.l10n.origin}: $origin',
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
