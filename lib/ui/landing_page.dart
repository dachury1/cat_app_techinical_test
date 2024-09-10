import 'package:cat_app_technical_test/model/breed.dart';
import 'package:cat_app_technical_test/repositories/cat_repository.dart';
import 'package:cat_app_technical_test/ui/widgets/card_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  CatRepository catRepository = CatRepository();
  bool isLoading = false;
  List<Breed> breeds = [];
  List<Breed> showingBreeds = [];

  loadBreeds() async {
    setState(() => isLoading = true);
    breeds = await catRepository.getBreeds();
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await loadBreeds();
        showingBreeds = breeds;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RefreshIndicator(
        onRefresh: () async => await loadBreeds(),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Image.asset('assets/cat_breeds_title.png'),
            ),
            _searchBar(),
            _listCard(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SearchBar(
        hintText: 'Type your breed',
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          List<Breed> filteredList = breeds
              .where((breed) => breed.name.toLowerCase().contains(value))
              .toList();
          setState(() {
            showingBreeds = filteredList;
          });
        },
      ),
    );
  }

  Widget _listCard() {
    if (!isLoading) {
      if (showingBreeds.isNotEmpty) {
        List<Widget> widgets = [];
        for (Breed breed in showingBreeds) {
          widgets.add(
            CardBreed(breed: breed),
          );
        }
        return Expanded(
          child: ListView(
            children: widgets,
          ),
        );
      } else {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/icon_cat_breeds.png'),
              ),
              const SizedBox(height: 10),
              Text(
                "Couldn't find that breed",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.orangeAccent[400],
                ),
              ),
            ],
          ),
        );
      }
    } else {
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.orangeAccent[400],
          ),
        ),
      );
    }
  }
}
