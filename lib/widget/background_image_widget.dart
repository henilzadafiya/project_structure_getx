import 'package:flutter/material.dart';
import 'package:project_structure/utils/assets.dart';

class BackGroundImageWidget extends StatefulWidget {
  final Widget child;
  final String? image;

  const BackGroundImageWidget({super.key, required this.child, this.image});

  @override
  State<BackGroundImageWidget> createState() => _BackGroundImageWidgetState();
}

class _BackGroundImageWidgetState extends State<BackGroundImageWidget> {
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(ImagesAsset.onboardingScreenBg), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.image ?? ImagesAsset.onboardingScreenBg), // Asset image
          fit: BoxFit.cover, // Fit the image within the container
        ),
      ),
      child: widget.child,
    );
  }
}
