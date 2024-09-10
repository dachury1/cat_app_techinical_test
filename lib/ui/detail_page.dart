import 'package:cat_app_technical_test/model/breed.dart';
import 'package:cat_app_technical_test/ui/widgets/adaptability_widget.dart';
import 'package:cat_app_technical_test/ui/widgets/afection_level_widget.dart';
import 'package:cat_app_technical_test/ui/widgets/intelligence_widget.dart';
import 'package:cat_app_technical_test/ui/widgets/tags_widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.breed,
  });
  final Breed breed;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Breed breed;
  @override
  void initState() {
    breed = widget.breed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          onTap: () => Navigator.pop(context),
          child: const SizedBox(
            width: 30,
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  breed.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Image.network(
                breed.image.url,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    breed.description,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[200],
                    ),
                  ),
                  TextLabel(
                    title: 'Alternative Names',
                    text: breed.altNames ?? '',
                    isVisible: breed.altNames != null && breed.altNames != '',
                  ),
                  TextLabel(
                    title: 'Origin',
                    text: breed.origin,
                  ),
                  const TitleLabelWidget(title: 'Intelligence'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: IntelligenceWidget(intelligence: breed.intelligence),
                  ),
                  TextLabel(
                    title: 'Life Span',
                    text: breed.lifeSpan ?? '',
                    isVisible: breed.lifeSpan != null,
                  ),
                  const TitleLabelWidget(title: 'Adaptability'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: AdptabilityWidget(
                      adaptability: breed.adaptability,
                    ),
                  ),
                  Visibility(
                    visible: breed.temperament != null,
                    child: const TitleLabelWidget(title: 'Temperament'),
                  ),
                  Visibility(
                    visible: breed.temperament != null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TagsWidget(
                        tags: breed.temperament ?? '',
                      ),
                    ),
                  ),
                  Visibility(
                    visible: breed.affectionLevel != null,
                    child: const TitleLabelWidget(title: 'Affection Level'),
                  ),
                  Visibility(
                    visible: breed.affectionLevel != null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: AffectionLevelWidget(
                        affectionLevel: breed.affectionLevel ?? 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextLabel extends StatelessWidget {
  const TextLabel({
    super.key,
    required this.text,
    this.isVisible = true,
    this.title,
  });
  final String text;
  final String? title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: title != null,
              child: TitleLabelWidget(title: title ?? ''),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleLabelWidget extends StatelessWidget {
  const TitleLabelWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            height: 1, // altura de la primera línea
            color: Colors.grey[600], // color de la primera línea
          ),
        ),
        const SizedBox(width: 4), // espacio entre las líneas
        Text(
          title,
          style: const TextStyle(
            fontSize: 16, // ajusta el tamaño del título según tus preferencias
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(width: 4), // espacio entre el título y la segunda línea
        Flexible(
          flex: 9,
          child: Container(
            height: 1, // altura de la segunda línea
            color: Colors.grey[600], // color de la segunda línea
          ),
        ),
      ],
    );
  }
}
