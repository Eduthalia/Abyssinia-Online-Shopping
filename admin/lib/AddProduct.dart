import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Add New Product',
      home: AddProductScreen(),
    );
  }
}

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Product',
            style: TextStyle(fontWeight: FontWeight.w900, color: Color.fromARGB(255, 0, 0, 0), fontSize: 28)),
            centerTitle: false,
            titleSpacing: 38.0,
      ),
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  UploadButtonWidget(), // Upload button widget
                  SizedBox(height: 10.0),
                  ProductNameField(),
                  SizedBox(height: 30.0),
                  ProductPriceField(),
                  SizedBox(height: 10.0),
                  ProductDescriptionField(),
                  SizedBox(height: 30.0),
                  ProductSizeSelector(),
                  // ProductSizeDropdown(),
                ],
              ),
            ),
          ),
          AddProductButton(),
        ],
      ),
    );
  }
}

class UploadButtonWidget extends StatelessWidget {
  const UploadButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        onPressed: () {
          // Backend logic to upload product picture
        },
        icon: const Icon(
          Icons.file_upload_outlined,
          color: Color.fromARGB(255, 105, 73, 175),
          size: 30.0,
        ),
        label: const Text(
          'Upload product Picture',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color:  Color.fromARGB(255, 90, 63, 148)),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color:  Color.fromARGB(255, 74, 35, 161), width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        ),
      ),
    );
  }
}

class ProductNameField extends StatelessWidget {
  const ProductNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Product name',
        hintText: ' Nike',
        labelStyle: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class ProductPriceField extends StatelessWidget {
  const ProductPriceField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Product price',
        hintText: '2000 br',
        labelStyle: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),
      ),
      keyboardType: TextInputType.number,
    );
  }
}

class ProductDescriptionField extends StatelessWidget {
  const ProductDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Product Description',
        hintText:
            'Red and black Nike shoes with a white sole. Perfect for running and sports.',
        labelStyle: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),
      ),
      maxLines: 3,
    );
  }
}

class ProductSizeDropdown extends StatelessWidget {
  const ProductSizeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: ['Small', 'Medium', 'Large'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        );
      }).toList(),
      onChanged: (_) {},
      decoration: const InputDecoration(
        labelText: 'Product Size',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
         hintText: '\$300',
      ),
    );
  }
}



class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin:const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 80.0),
      child: ElevatedButton(
        onPressed: () {
          // Backend logic to add product to database
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 75, 84, 152),
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: const Text('ADD PRODUCT',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class ProductSizeSelector extends StatefulWidget {
  const ProductSizeSelector({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ProductSizeSelectorState createState() => _ProductSizeSelectorState();
}
class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  final List<String> sizes = ['Small', 'Medium', 'Large'];
  String? selectedSize;
  List<String> selectedSizes = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
    'Product Size:',
    style: TextStyle(
      fontSize: 16, // Set the font size
      fontWeight: FontWeight.bold, // Make the text bold
    ),
  ),
  const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          children: selectedSizes.map((size) {
            return Chip(
              label: Text(size, style: const TextStyle(fontSize: 14)),
              deleteIcon: const Icon(Icons.cancel, size: 18),
              onDeleted: () {
                setState(() {
                  selectedSizes.remove(size);
                  if (selectedSize == size) {
                    selectedSize = null;
                  }
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            );
          }).toList(),
        ),
        const SizedBox(height: 20), // This SizedBox creates space between the label and the dropdown
        DropdownButtonFormField<String>(
          value: selectedSize,
          hint: const Text('Select size'),
          onChanged: (String? newValue) {
            setState(() {
              if (newValue != null) {
                selectedSize = newValue;
                selectedSizes.add(newValue);
              }
            });
          },
          items: sizes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(
            ),
        ),
      ],
    );
  }
}
