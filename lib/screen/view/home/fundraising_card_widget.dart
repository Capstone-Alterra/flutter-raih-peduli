import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';

class FundraisingCard extends StatelessWidget {
  final FundraisingData fundraisingData;
  final Widget bookmarkWidget;

  const FundraisingCard({
    required this.fundraisingData,
    required this.bookmarkWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Rounded rectangle container for the image
          Container(
            width: 100, // Adjust the width as needed
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              color: Colors.grey, // You can set a background color for the rounded rectangle
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              child: Image.network(
                fundraisingData.imageUrl,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Padding for spacing
          const SizedBox(width: 8.0),
          // Data
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fundraisingData.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  LinearProgressIndicator(
                    value: fundraisingData.progress / fundraisingData.target,
                    backgroundColor: Colors.grey,
                  ),
                  Text('Progress: ${fundraisingData.progress.toStringAsFixed(2)}%'),
                  Text('Target: ${fundraisingData.target.toStringAsFixed(2)}'),
                  Text('Sisa Hari: ${fundraisingData.daysLeft}'),
                ],
              ),
            ),
          ),
          // Bookmark widget
          bookmarkWidget,
        ],
      ),
    );
  }
}
