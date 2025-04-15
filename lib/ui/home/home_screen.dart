import 'package:flutter/material.dart';
import 'package:flutter_techtaste/data/categories_data.dart';
import 'package:flutter_techtaste/ui/home/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            Center(child: Image.asset('assets/logo.png', width: 147)),
            Text('Boas-vindas!'),
            TextFormField(),
            Text('Escola por categoria'),
            Row(
              children: List.generate(CategoriesData.listCategories.length, (
                index,
              ) {
                return CategoryWidget(
                  category: CategoriesData.listCategories[index],
                );
              }),
            ),
            Image.asset('assets/banners/banner_promo.png'),
            Text('Bem avaliados'),
          ],
        ),
      ),
    );
  }
}
