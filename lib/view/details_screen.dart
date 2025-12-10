import 'package:flutter/material.dart';
import 'package:runway/core/widgets/custom_bottom_sheet.dart';
import 'package:runway/core/widgets/custom_text.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
  final String image, title, price, description;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: CustomText(
          text: 'Men',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset('assets/images/bag.png'),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Image.network(widget.image.toString(), height: 580)),
          Spacer(),
          CustomBottomSheet(
            name: widget.title.toString(),
            price: widget.price.toString(),
            description: widget.description.toString(),
          ),
        ],
      ),
    );
  }
}
