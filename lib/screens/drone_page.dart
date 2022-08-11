import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  dynamic _selectedIndex = {};

  final CarouselController _carouselController = CarouselController();

  final List<dynamic> _products = [
    {
      'title': 'DJI Mavic 3 \n Mavic 3 Cine',
      'image': 'images/william-bayreuther-_oDcaB6xMNY-unsplash.jpg',
      'description': 'Limited Edition'
    },
    {
      'title': 'Yuneec typhoon H Plus',
      'image': 'images/jakob-owens-ewzL1sbiLZI-unsplash.jpg',
      'description': 'limited Edition'
    },
    {
      'title': 'Autel evo II Pro',
      'image': 'images/alex-perez-eL4N2-OAnbw-unsplash.jpg',
      'description': 'Limited collection'
    },
    {
      'title': 'Dji Air 2S',
      'image': 'images/nathan-dumlao-J1QkzNckrRQ-unsplash.jpg',
      'description': 'Limited collection'
    },
    {
      'title': 'DJI Phantom \n 4 Pro V2.0',
      'image': 'images/keith-wickramasekara-_AHrPgajc8U-unsplash.jpg',
      'description': 'limited Edition'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const BackButton(),
          backgroundColor: Colors.transparent,
          /*title: const Text(
            'Drone Shop',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w200),
          ),*/
          // centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          // Carousel Slider being called and customized here.
          child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                  height: 450.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  onPageChanged: (index, reason) {
                    setState(() {});
                  }),
              items: _products.map((drones) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIndex == drones) {
                            _selectedIndex = {};
                          } else {
                            _selectedIndex = drones;
                          }
                        });
                      },
                      //Animation section starts here.
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: _selectedIndex == drones
                                ? Border.all(
                                    color: Colors.blue.shade500, width: 3)
                                : null,
                            boxShadow: _selectedIndex == drones
                                ? [
                                    BoxShadow(
                                        color: Colors.blue.shade100,
                                        blurRadius: 30,
                                        offset: const Offset(0, 10))
                                  ]
                                : [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 20,
                                        offset: const Offset(0, 5))
                                  ]),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 320,
                                margin: const EdgeInsets.only(top: 20),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset(drones['image'],
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                drones['title'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                drones['description'],
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList()),
        ),
      ),
    );
  }
}
