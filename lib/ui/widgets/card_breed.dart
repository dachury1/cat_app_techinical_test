import 'package:cat_app_technical_test/model/breed.dart';
import 'package:cat_app_technical_test/ui/detail_page.dart';
import 'package:cat_app_technical_test/ui/widgets/intelligence_widget.dart';
import 'package:flutter/material.dart';

class CardBreed extends StatelessWidget {
  const CardBreed({
    super.key,
    required this.breed,
  });
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              breed: breed,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(15),
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    breed.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100],
                    ),
                  ),
                  Text(
                    'More...',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.network(
                breed.image.url,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    breed.origin,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[200],
                    ),
                  ),
                  IntelligenceWidget(intelligence: breed.intelligence)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
