import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/news/newsdetailpage.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';
import '../../../view_model/view_model_news.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const NewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    double sizecontent = size.width / 2;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: sizecontent,
                height: sizecontent / 2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                    fontSize: sizecontent / 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  viewModel.truncateText(description, 30),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppTheme.black,
                    fontFamily: 'Helvetica',
                    fontSize: sizecontent / 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailPage(
                      title: title,
                      image: imageUrl,
                      description: description,
                    ),
                  ),
                );
              },
              child: Container(
                height: sizecontent / 8,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      4.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Baca Selengkapnya',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: sizecontent / 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
