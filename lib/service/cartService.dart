import 'package:bajulo/model/cartModel';

class CartService {
  static List<Cart> cartData =
      cartRawData.map((data) => Cart.fromJson(data)).toList();
}

var cartRawData = [
  {
    'image': [
      'assets/images/details_a1.png',
    ],
    'name': 'Mahagrid Oval Logo Hoodie',
    'price': 900000,
    'itemCost': 900000,
    'count': 1,
  },
  {
    'image': [
      'assets/images/produk1.png',
    ],
    'name': "Acne Studios Crewneck Bubble Logo",
    'price': 6350000,
    'itemCost': 6350000,
    'count': 1,
  },
  {
    'image': [
      'assets/images/produk4.png',
    ],
    'name': "Ader  Block Block Crew Sweat",
    'price': 4000000,
    'itemCost': 4000000,
    'count': 1,
  },
];
