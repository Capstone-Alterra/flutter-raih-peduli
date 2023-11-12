import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';

class VolunteerCard extends StatelessWidget {
  final VolunteerData volunteerData;
  final Widget? bookmarkWidget;

  const VolunteerCard({
    required this.volunteerData,
    this.bookmarkWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            volunteerData.imageUrl,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  volunteerData.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text('Periode: ${volunteerData.period}'),
                LinearProgressIndicator(
                  value: volunteerData.progress,
                  backgroundColor: Colors.grey,
                ),
                Text('Lokasi: ${volunteerData.location}'),
                Text('Slot Tersedia: ${volunteerData.slot}'),
              ],
            ),
          ),
          if (bookmarkWidget != null) bookmarkWidget!,
        ],
      ),
    );
  }
}