import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

int index = 0;

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> noteCard = [
      {'title': "Thermodynamics", 'author': "Shiv"},
      {'title': "Thermodynamics", 'author': "Shi"},
      {'title': "Thermodynamics", 'author': "Shiva"},
      {'title': "Thermodynamics", 'author': "Shivam"},
    ];
    return SafeArea(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          enableInfiniteScroll: false,
          viewportFraction: 0.6,
          autoPlay: false,
          aspectRatio: 2.0,
        ),
        items: noteCard
            .map(
              (note) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: () => {
                    // Navigator.of(context)
                    Navigator.pushNamed(context, '/noteDetails'),
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      note['title'].toString(),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      note['author'].toString(),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
