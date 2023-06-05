import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart%20';
import 'package:genielogiciel/utils/dummy_data.dart';
import 'package:genielogiciel/utils/theme.dart';

class MoviesItems extends StatelessWidget {
  const MoviesItems({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 150 + 80,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 10.0),
            child: GestureDetector(
              onTap: () {
                print(movies[i].title);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      movies[i].bannerUrl,
                      height: 150.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    movies[i].title,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: MyTheme.splash,
                      ),
                      Text(
                        "${movies[i].like} %",
                        style: const TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
