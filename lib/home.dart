import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:sewa_setu/search_section.dart';
import 'package:sewa_setu/top_nav.dart';
import 'footer.dart';
import 'nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();
  Color _barColor = Colors.blue;
  int _hoveredIndex = -1;

  @override
  void initState() {
    super.initState();
    _startColorAnimation();
  }

  void _startColorAnimation() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _barColor = _barColor == Colors.blue ? Colors.green : Colors.blue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TopNavbar(),
            Navbar(),
          ],
        ),
      ),
      body: SingleChildScrollView( // Make the page scrollable
        child: Column(
          children: [
            CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.width > 600 ? 300.0 : 200.0, // Adjust the height dynamically
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: MediaQuery.of(context).size.width > 600 ? 16/9 : 4/3, // Adjust aspect ratio for responsiveness
              ),
              items: ['assets/sewasetulaunchbanner.jpeg', 'assets/banner1.webp'].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Image.asset(
                          i,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: double.infinity, // Ensure the image covers the entire height of the carousel
                        ),
                        Positioned(
                          left: 10.0,
                          top: 0.0,
                          bottom: 0.0,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.7)),
                            onPressed: () {
                              _controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 10.0,
                          top: 0.0,
                          bottom: 0.0,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.7)),
                            onPressed: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.easeInOut,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width > 600 ? 16.0 : 8.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_barColor, _barColor.withOpacity(0.5)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isWideScreen = constraints.maxWidth > 600;
                    return isWideScreen
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildLottieCard(0, 'assets/Animation - 1723359479150.json', '387', 'Citizen Services'),
                        _buildLottieCard(1, 'assets/Animation - 1723359957202.json', '219', 'Business Services'),
                        _buildLottieCard(2, 'assets/Animation - 1723360163600.json', '13', 'Utility Services'),
                      ],
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildLottieCard(0, 'assets/Animation - 1723359479150.json', '387', 'Citizen Services'),
                        _buildLottieCard(1, 'assets/Animation - 1723359957202.json', '219', 'Business Services'),
                        _buildLottieCard(2, 'assets/Animation - 1723360163600.json', '13', 'Utility Services'),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            SearchAndExploreSection(),
            SizedBox(height: 20.0),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildLottieCard(int index, String animationPath, String number, String text) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _hoveredIndex = index;
      }),
      onExit: (_) => setState(() {
        _hoveredIndex = -1;
      }),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width > 600 ? 400 : MediaQuery.of(context).size.width - 16, // Adjust the width dynamically
        height: 150,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: _hoveredIndex == index ? Colors.blue.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: _hoveredIndex == index
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            )
          ]
              : [],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Lottie.asset(
                animationPath,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 1.0,
              height: 80.0,
              color: Colors.grey.shade300,
            ),
            SizedBox(width: 16.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    number,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
