

import 'package:flutter/material.dart';
import 'package:weather_app/core/design/colors.dart';
import 'package:weather_app/core/design/dimensions.dart';
import 'package:weather_app/core/design/styles.dart';

class LoadingUI extends StatelessWidget {

  const LoadingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Идет загрузка...", style: bodyTextStyle, textAlign: TextAlign.center),
            SizedBox(height: height12),
            CircularProgressIndicator(
              color: blackColor,
            )
          ],
        ),
      ),
    ) ;
  }
}