

import 'package:flutter/material.dart';
import 'package:weather_app/core/design/dimensions.dart';

class ContentCard extends StatelessWidget {
  final Widget child;
  final double childPadding;


  const ContentCard({
    super.key,
    required this.child,
    this.childPadding = padding16,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(childPadding),
                child: child,
              ),
            ]
        )
    );
  }

}
