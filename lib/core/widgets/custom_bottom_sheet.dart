import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:runway/core/widgets/custom_button.dart';
import 'package:runway/core/widgets/custom_text.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
    required this.name,
    required this.price,
    required this.description,
  });
  final String name, price, description;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showMaterialModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                width: 430,
                height: 400,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 42,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomText(
                      text: widget.name,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: '\$${widget.price}',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),

                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 4),
                            CustomText(
                              text: '3.7',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: widget.description,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 40),
                    CustomButton(text: 'Add To Bag', onPressed: () {}),
                  ],
                ),
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          height: 138,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 42,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                text: widget.name,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '\$${widget.price}',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      CustomText(
                        text: '3.7',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
