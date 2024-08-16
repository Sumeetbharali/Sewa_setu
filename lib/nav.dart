import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures the navbar covers the full width of the screen
      color: Color(0xFF0078D7), // Background color similar to the image
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Large screen: display the full navbar
            return _buildLargeScreenNavbar(context);
          } else {
            // Small screen: display the dropdown for options
            return _buildSmallScreenNavbar(context);
          }
        },
      ),
    );
  }

  Widget _buildLargeScreenNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Image.asset(
              'assets/indiaemblem.png', // Add your government logo asset here
              height: 40,
            ),
            SizedBox(width: 10),
            Image.asset(
              'assets/SS_LOGO.png', // Add your Sewa Setu logo asset here
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'Sewa Setu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            _buildNavButton(context, 'HOME'),
            _buildNavButton(context, 'ABOUT'),
            _buildNavButton(context, 'SERVICES'),
            _buildNavButton(context, 'DOCUMENTS'),
            _buildNavButton(context, 'DASHBOARD'),
            _buildNavButton(context, 'CONTACT'),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login/register logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFA500), // Orange color for the button
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'LOGIN/REGISTER',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallScreenNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/indiaemblem.png', // Add your government logo asset here
              height: 40,
            ),
            SizedBox(width: 10),
            Image.asset(
              'assets/SS_LOGO.png', // Add your Sewa Setu logo asset here
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'Sewa Setu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            // Handle navigation logic here based on the value selected
          },
          icon: Icon(Icons.menu, color: Colors.white),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 'HOME',
                child: Text('HOME'),
              ),
              PopupMenuItem(
                value: 'ABOUT',
                child: Text('ABOUT'),
              ),
              PopupMenuItem(
                value: 'SERVICES',
                child: Text('SERVICES'),
              ),
              PopupMenuItem(
                value: 'DOCUMENTS',
                child: Text('DOCUMENTS'),
              ),
              PopupMenuItem(
                value: 'DASHBOARD',
                child: Text('DASHBOARD'),
              ),
              PopupMenuItem(
                value: 'CONTACT',
                child: Text('CONTACT'),
              ),
              PopupMenuItem(
                value: 'LOGIN/REGISTER',
                child: Text('LOGIN/REGISTER'),
              ),
            ];
          },
        ),
      ],
    );
  }

  Widget _buildNavButton(BuildContext context, String title) {
    return TextButton(
      onPressed: () {
        // Handle navigation logic here
      },
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
