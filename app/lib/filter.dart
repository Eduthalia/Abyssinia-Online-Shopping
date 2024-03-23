import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Map<String, bool> _buttonStates = {
    'All': false,
    'Men': false,
    'Women': false,
    'Adidas': false,
    'Puma': false,
    'CR7': false,
    'Nike': false,
    'Yeezy': false,
    'Supreme': false,
    'White': false,
    'Black': false,
    'Grey': false,
    'Yellow': false,
    'Red': false,
    'Green': false,
  };

  double _lowerValue = 16;
  double _upperValue = 543;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Filter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            _buildFilterOption('Gender', ['All', 'Men', 'Women']),
            SizedBox(height: 20),
            _buildFilterOption('Brand', ['Adidas', 'Puma', 'CR7'],
                ['Nike', 'Yeezy', 'Supreme']),
            SizedBox(height: 20),
            Text(
              'Price Range',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Slider(
              min: 16,
              max: 543,
              value: _lowerValue,
              onChanged: (double value) {
                setState(() {
                  _lowerValue = value;
                });
              },
              activeColor: Colors.purple,
              inactiveColor: Colors.grey,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${_lowerValue.round()}'),
                Text('\$543'),
              ],
            ),
            SizedBox(height: 20),
            _buildFilterOption('Color', ['White', 'Black', 'Grey'],
                ['Yellow', 'Red', 'Green']),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Another Option',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold, // Make it bold
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black, // Set icon color
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                minimumSize: Size(double.infinity, 50), // Set the button width
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Apply Filter',
                style: TextStyle(color: Colors.white), // Make text white
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: Size(double.infinity, 50), // Set the button width
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, List<String> row1,
      [List<String>? row2]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: row1.map((option) {
            return Expanded(
                child: _buildFilterButton(option)); // Wrap with Expanded
          }).toList(),
        ),
        if (row2 != null) SizedBox(height: 10),
        if (row2 != null)
          Row(
            children: row2.map((option) {
              return Expanded(
                  child: _buildFilterButton(option)); // Wrap with Expanded
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildFilterButton(String text) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _buttonStates[text] = !_buttonStates[text]!;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: _buttonStates[text]! ? Colors.white : Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _buttonStates[text]! ? Colors.purple : Colors.grey[200],
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FilterPage(),
  ));
}
