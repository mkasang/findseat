import 'package:flutter/material.dart';
import 'package:genielogiciel/model/event_model.dart';

class EventItems extends StatelessWidget {
  final List<EventModel> events;
  const EventItems({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 150 + 80,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 10.0),
            child: GestureDetector(
              onTap: () {
                print(events[i].title);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      events[i].bannerUrl,
                      height: 150.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    events[i].title,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    events[i].description,
                    style: const TextStyle(
                      fontSize: 10.0,
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
