import 'package:flutter/material.dart';
import '../../utils/color.dart';

class RecommendationHeaderWidget extends StatelessWidget {
  const RecommendationHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Recommendations For You',
                  style: TextStyle(
                      color: kTextSecondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text(
                'Lots of interesting comics here ~',
                style: TextStyle(color: kTextSecondColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
