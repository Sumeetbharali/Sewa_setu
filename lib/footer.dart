import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 800;
        return Container(
          color: Colors.grey.shade900,  // Set the background color to match the footer in the image
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: isWideScreen ? 40.0 : 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isWideScreen
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildHelpDeskColumn()),
                  Expanded(child: _buildQuickLinksColumn()),
                  Expanded(child: _buildImportantLinksColumn()),
                  Expanded(child: _buildVisitorsInfoColumn()),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHelpDeskColumn(),
                  SizedBox(height: 20.0),
                  _buildQuickLinksColumn(),
                  SizedBox(height: 20.0),
                  _buildImportantLinksColumn(),
                  SizedBox(height: 20.0),
                  _buildVisitorsInfoColumn(),
                ],
              ),
              Divider(color: Colors.grey.shade700),  // Horizontal line
              SizedBox(height: 10.0),
              _buildFooterBottomRow(isWideScreen),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHelpDeskColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Help Desk',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.white),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                '1800-345-3574 (8:00 AM to 8:00 PM)',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Row(
          children: [
            Icon(Icons.email, color: Colors.white),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                'helpdesk@example.com',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          'Follow us on:',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            SvgPicture.asset('assets/facebook.svg', width: 20, color: Colors.white),
            SizedBox(width: 8.0),
            SvgPicture.asset('assets/twitter.svg', width: 20, color: Colors.white),
            SizedBox(width: 8.0),
            SvgPicture.asset('assets/youtube.svg', width: 20, color: Colors.white),
            SizedBox(width: 8.0),
            SvgPicture.asset('assets/instagram.svg', width: 20, color: Colors.white),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickLinksColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        _buildLinkText('About Us'),
        _buildLinkText('FAQs'),
        _buildLinkText('Policies'),
        _buildLinkText('Contact Us'),
      ],
    );
  }

  Widget _buildImportantLinksColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Important Links',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        _buildLinkText('Assam State Portal'),
        _buildLinkText('CM Portal'),
        _buildLinkText('MyGov Assam'),
        _buildLinkText('National Portal Of India'),
      ],
    );
  }

  Widget _buildVisitorsInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Visitors: 20343607',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 5.0),
        Text(
          'Last updated 26.03.2023',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 5.0),
        Text(
          'Copyright © 2024 | Government of Assam',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildLinkText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }

  Widget _buildFooterBottomRow(bool isWideScreen) {
    return isWideScreen
        ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Implementation Agency: AITEC & CSD Society, IT Dept, Govt. of Assam',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        Text(
          'Nodal Department: Information Technology Department, Govt. of Assam',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        Text(
          'Designed & Developed by National Informatics Centre, Assam',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Implementation Agency: AITEC & CSD Society, IT Dept, Govt. of Assam',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        SizedBox(height: 10.0),
        Text(
          'Nodal Department: Information Technology Department, Govt. of Assam',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        SizedBox(height: 10.0),
        Text(
          'Designed & Developed by National Informatics Centre, Assam',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ],
    );
  }
}
