import 'package:flutter/material.dart';

class TopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0, // Set a fixed height for the top navbar
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Align items to the right
        children: <Widget>[
          _buildDropdownButton(
            context,
            'Language',
            ['English', 'Spanish', 'French'],
          ),
          SizedBox(width: 20.0), // Add some spacing between options
          _buildDropdownButton(
            context,
            'Font Size',
            ['Small', 'Medium', 'Large'],
          ),
          SizedBox(width: 20.0),
          TextButton(
            onPressed: () {
              // Handle login/register logic
            },
            child: Text(
              'Login/Register',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: 20.0),
          TextButton(
            onPressed: () {
              // Handle track status logic
            },
            child: Text(
              'Track Status',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: 20.0), // Add some spacing at the end
        ],
      ),
    );
  }

  Widget _buildDropdownButton(
      BuildContext context, String title, List<String> items) {
    return DropdownButton<String>(
      hint: Text(title),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // Handle dropdown change
      },
    );
  }
}
