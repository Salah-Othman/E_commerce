import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runway/core/api/product/product_bloc.dart';
import 'package:runway/core/widgets/custom_text.dart';
import 'package:runway/model/category_model.dart';
import 'package:runway/view/product_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<CategoryModel> categoryList = [
    CategoryModel(image: 'assets/images/women.png', type: 'Women'),
    CategoryModel(image: 'assets/images/men.png', type: 'Men'),
    CategoryModel(image: 'assets/images/kids.png', type: 'Kids'),
    CategoryModel(image: 'assets/images/deals.png', type: 'Deals'),
    CategoryModel(image: 'assets/images/kids.png', type: 'Home'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/bar.png'),
        title: Text(
          'Runway',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/home_background.png',
            width: 430,
            height: 530,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomText(
              text: 'Categories',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(19, 19, 19, 1),
            ),
          ),
          SizedBox(height: 17),
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                final category = categoryList[index];
                return Container(
                  width: 95,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (_) => ProductBloc(Dio())..add(FetchProductEvent()),
                            child: ProductScreen(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(category.image),
                            ),
                          ),
                        ),
                        CustomText(
                          text: category.type,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(19, 19, 19, 1),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        fixedColor: Color.fromRGBO(0, 0, 0, 1),

        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromRGBO(0, 0, 0, 1)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken, color: Color.fromRGBO(0, 0, 0, 1)),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge, color: Color.fromRGBO(0, 0, 0, 1)),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_4_outlined,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
