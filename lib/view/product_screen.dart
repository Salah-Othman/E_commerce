import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runway/core/api/product/product_bloc.dart';
import 'package:runway/core/widgets/custom_text.dart';
import 'package:runway/view/details_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            final products = state.productResponse.products;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            image: products[index].image,
                            title: products[index].title,
                            price: products[index].price.toString(),
                            description: products[index].description,
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 200,
                                height: 220,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      products[index].image,
                                      width: 200,
                                      height: 190,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                width: 200,
                                height: 73,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    CustomText(
                                      text: '\$${products[index].price}',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is ProductError) {
            print(state.message);
            return Center(
              child: Text(state.message, style: TextStyle(color: Colors.red)),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
