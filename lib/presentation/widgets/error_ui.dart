


import 'package:flutter/material.dart';
import 'package:weather_app/core/design/dimensions.dart';
import 'package:weather_app/core/design/styles.dart';

class ErrorUI extends StatelessWidget {
  final String errorMessage;

  //final void Function() onTap;

  const ErrorUI({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(padding16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, size: size48),
            const SizedBox(height: height12),
            Text(errorMessage, maxLines: 10, style: subtitleTextStyle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

}