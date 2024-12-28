import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: orientation == Orientation.portrait
                ? Image.asset('assets/local_image.png') // Gambar lokal
                : CachedNetworkImage(
                    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDSF6Fs9BVfX8orNEumLNUayGXGKInSW9bNg&s',
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
          );
        },
      ),
    );
  }
}
