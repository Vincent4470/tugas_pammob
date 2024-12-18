import 'package:flutter/material.dart';
import 'package:tugas_pammob/models/product.dart';
import 'package:tugas_pammob/screen/product_detail_screen.dart';
import 'package:tugas_pammob/widget/product_grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample products data
    final List<Product> products = [
      Product(
        id: '1',
        name: 'Samsung Galaxy S24 Ultra 5G Smartphone',
        price: 19999000,
        description:
            'Smartphone flagship dengan layar 6.8 inci Dynamic AMOLED, kamera 200MP, dan baterai 5000mAh.',
        imageUrl:
            'https://images.samsung.com/is/image/samsung/p6pim/id/2401/gallery/id-galaxy-s24-s928-sm-s928bztqxid-thumb-539319761',
      ),
      Product(
        id: '2',
        name: 'iPhone 15 Pro',
        price: 18249000,
        description:
            'Smartphone premium dengan chip A17 Pro, kamera Pro, dan bodi titanium.',
        imageUrl:
            'https://ibox.co.id/_next/image?url=https%3A%2F%2Fcdnpro.eraspace.com%2Fmedia%2Fcatalog%2Fproduct%2Fa%2Fp%2Fapple_iphone_15_pro_natural_titanium_1_4.jpg&w=3840&q=45',
      ),
      Product(
        id: '3',
        name: 'ASUS Zenbook Pro Duo 14 OLED',
        price: 31199000,
        description:
            'Laptop dengan layar ganda OLED 14 inci, Intel Core i9, dan SSD 2TB.',
        imageUrl:
            'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/MTA-166301013/asus_asus_zenbook_duo_ux8406ma-oleds921_notebook_-_inkwell_grey_-_ultra_9-185h_-_32gb_-_2tb_ssd_-_uma_-_14-_oled_3k_touch_-_win11_-_ohs_-_full14_searackh.jpeg',
      ),
      Product(
        id: '4',
        name: 'Dell XPS 13 Plus',
        price: 28999000,
        description: 'Laptop ultrabook dengan layar InfinityEdge 13.4 inci, Intel Core i7, dan desain modern.',
        imageUrl: 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/MTA-172322057/dell_laptop_dell_xps_13_plus_-9320-_i71360p-_16gb_ram-_1tb_ssd-_13-4-_oled_3-5k-_win11_pro_-touch-_full01_ikjq59hc.jpg',
      ),
      Product(
        id: '5',
        name: 'HP Spectre x360 14',
        price: 21999000,
        description: 'Laptop convertible 2-in-1 dengan layar OLED 14 inci dan prosesor Intel Core i7.',
        imageUrl: 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/92/MTA-176312062/hp_hp_spectre_x360_14_eu0005tu_eu0004tu_oled_ultra_7_155h_32gb_2tb_14-0_2-8k_120hz_w11_ohs_full01_f2nb6d6n.jpg',
      ),
      Product(
        id: '6',
        name: 'Lenovo Yoga Slim 7 Pro',
        price: 18999000,
        description: 'Laptop tipis dengan layar 14 inci 2.8K, prosesor AMD Ryzen 7, dan daya tahan baterai tinggi.',
        imageUrl: 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//105/MTA-85818318/lenovo_lenovo_yoga_slim_7_pro_14ach5-eaid-r5-5600h-16g-512g_full03_i4dewrxj.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko GG Gimang'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductGridItem(
          product: products[i],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: products[i]),
              ),
            );
          },
        ),
      ),
    );
  }
}
