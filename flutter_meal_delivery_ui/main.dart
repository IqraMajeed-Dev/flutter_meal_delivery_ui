import 'package:flutter/material.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/auth': (context) => AuthScreen(),
        '/home': (context) => HomeScreen(),
        '/addToBasket': (context) => AddToBasketScreen(),
        '/orderList': (context) => OrderListScreen(),
        '/orderComplete': (context) => OrderCompleteScreen(),
      },
    );
  }
}

/// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome_bg.png'), // Add your welcome background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/auth');
            },
            child: Image.asset(
              'assets/get_started_button.png', // Add your "Get Started" button image
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}

/// Authentication Screen
class AuthScreen extends StatelessWidget {
  const AuthScreen(super.key),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Home Screen
class HomeScreen extends StatelessWidget {
  final List<String> categories = ['Pizza', 'Burgers', 'Drinks', 'Desserts'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/addToBasket');
            },
            child: Card(
              elevation: 4,
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Add To Basket Screen
class AddToBasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add to Basket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/food_item.png', height: 200), // Replace with your food item image
            SizedBox(height: 20),
            Text('Delicious Pizza', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Price: \$12.99', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/orderList');
              },
              child: Text('Add to Basket'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Order List Screen
class OrderListScreen extends StatelessWidget {
  final List<String> items = ['Pizza - \$12.99', 'Burger - \$8.99'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Basket')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: Icon(Icons.delete),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/orderComplete');
              },
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}

/// Order Complete Screen
class OrderCompleteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/order_complete.png', height: 150), // Add a success image
            SizedBox(height: 20),
            Text('Order Complete!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
