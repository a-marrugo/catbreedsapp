// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// Widget to display the description of the cat breed with
/// customizable maxLines.
class CatBreedDescription extends StatelessWidget {
  /// Constructor
  const CatBreedDescription({
    required this.description,
    super.key,
    this.maxLines,
  });

  final String? description;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: description != null,
      child: Text(
        description ?? '',
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
