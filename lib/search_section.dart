import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchAndExploreSection extends StatefulWidget {
  @override
  _SearchAndExploreSectionState createState() => _SearchAndExploreSectionState();
}

class _SearchAndExploreSectionState extends State<SearchAndExploreSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Looking for a particular service? Search here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),

            // Animated "Explore All" button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.explore),
                label: Text('Explore All'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Animated containers arranged in a triangular layout
            SlideTransition(
              position: _offsetAnimation,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    // Larger screens
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child:  _buildAnimatedContainer('Login', 'Login/ Register to apply', 'assets/Animation - 1723546286444.json'),
                            ),
                            SizedBox(width: 20.0),
                            Flexible(
                              flex: 1,
                              child:   _buildAnimatedContainer('Track', 'Real-time file status', 'assets/Animation - 1723792421789.json'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: _buildAnimatedContainer('Grievance', 'Grievance Redressal', 'assets/Animation - 1723792611414.json'),

                            ),
                            SizedBox(width: 20.0),
                            Flexible(
                              flex: 1,
                              child: _buildAnimatedContainer('Appeal', 'Appeal Management', 'assets/Animation - 1723792421789.json'),
                            ),
                            SizedBox(width: 20.0),
                            Flexible(
                              flex: 1,
                              child:  _buildAnimatedContainer('PFC Locators', 'Locate your nearest PFC', 'assets/Animation - 1723793743100.json'),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    // Smaller screens
                    return Column(
                      children: [
                        _buildAnimatedContainer('Login', 'Login/ Register to apply', 'assets/Animation - 1723546286444.json'),
                        SizedBox(height: 20.0),
                        _buildAnimatedContainer('Track', 'Real-time file status', 'assets/Animation - 1723792421789.json'),
                        SizedBox(height: 20.0),
                        _buildAnimatedContainer('Grievance', 'Grievance Redressal', 'assets/Animation - 1723792611414.json'),
                        SizedBox(height: 20.0),
                        _buildAnimatedContainer('Appeal', 'Appeal Management', 'assets/Animation - 1723792421789.json'),
                        SizedBox(height: 20.0),
                        _buildAnimatedContainer('PFC Locators', 'Locate your nearest PFC', 'assets/Animation - 1723793743100.json'),
                      ],
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 40.0),

            // Image grid or slider
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  // Larger screens, show all six images in a row
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildImageContainer('assets/Incredible-india_S.png'),
                      _buildImageContainer('assets/Digital_India-Black.png'),
                      _buildImageContainer('assets/Swach-Bharat-Large.png'),
                      _buildImageContainer('assets/RTI-L.png'),
                      _buildImageContainer('assets/Aadhaar_Large.png'),
                      _buildImageContainer('assets/DigiLocker_S.png'),
                    ],
                  );
                } else {
                  // Smaller screens, show one image at a time and make it slidable
                  return Container(
                    height: 100.0, // Height of the image container
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildImageContainer('assets/Incredible-india_S.png'),
                        _buildImageContainer('assets/Digital_India-Black.png'),
                        _buildImageContainer('assets/Swach-Bharat-Large.png'),
                        _buildImageContainer('assets/RTI-L.png'),
                        _buildImageContainer('assets/Aadhaar_Large.png'),
                        _buildImageContainer('assets/DigiLocker_S.png'),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedContainer(String title, String subtitle, String animationPath) {
    return Container(
      width: 380,
      height: 250,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(fontSize: 14.0, color: Colors.grey)),
              Align(
                alignment: Alignment.centerRight,
                child: Lottie.asset(animationPath, width: 150.0, height: 150.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: 180.0, // Fixed width for each image container
      height: 80.0, // Fixed height for each image container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.grey),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover, // Ensures the image covers the entire container
        ),
      ),
    );
  }
}
