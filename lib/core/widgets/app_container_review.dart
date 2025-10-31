import 'package:flutter/material.dart';
import 'package:respi/app/theme/app_colors.dart';

// ignore: camel_case_types
class app_container_review extends StatelessWidget {
  final String route;
  final String sport;
  final String locate;

  const app_container_review({
    super.key,
    required this.route,
    required this.sport,
    required this.locate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: outerSpace,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: const Color(0xFFDDF864),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  route,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(width: 22),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sport,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                Text(
                  locate,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                ),

                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(
                            index < 2 ? Icons.star : Icons.star_border,
                            size: 16,
                            color: const Color(0xFFBFEA44),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
