import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart%20';
import 'package:genielogiciel/utils/dummy_data.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menus.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 10.0),
            child: GestureDetector(
              onTap: () {
                print(menus[i].name);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      menus[i].asset,
                      height: 35.0,
                      width: 35.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    menus[i].name,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
