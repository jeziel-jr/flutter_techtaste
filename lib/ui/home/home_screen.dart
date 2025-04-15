import 'package:flutter/material.dart';
import 'package:flutter_techtaste/data/categories_data.dart';
import 'package:flutter_techtaste/data/restaurant_data.dart';
import 'package:flutter_techtaste/model/restaurant.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_techtaste/ui/home/widgets/category_widget.dart';
import 'package:flutter_techtaste/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text(
                'Boas-vindas!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.laranjaClaro,
                ),
              ),
              TextFormField(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.cinzaTextoCards,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  labelText: 'O que você quer comer?',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.cinzaTextoCards,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.cinzaTextoCards,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.cinzaTextoCards,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: AppColors.cinzaTextoCards,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: AppColors.cinzaTextoCards,
                      width: 1,
                    ),
                  ),
                ),
              ),
              Text(
                'Escolha por categoria',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: AppColors.laranjaClaro,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem avaliados',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.laranjaClaro,
                    ),
                  ),
                  Column(
                    spacing: 16,
                    children: List.generate(
                      restaurantData.listRestarant.length,
                      (index) {
                        Restaurant restaurant =
                            restaurantData.listRestarant[index];
                        return RestaurantWidget(restaurant: restaurant);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
