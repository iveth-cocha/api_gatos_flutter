import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/api_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoxProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Fox API',
        home: FoxScreen(),
      ),
    );
  }
}

class FoxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zorro'),
      ),
      body: Consumer<FoxProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.fox == null) {
            return Center(child: Text('Buscar zorro'));
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200, // Ajusta la altura según lo necesites
                  child: Image.network(
                    provider.fox!.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  provider.fox!.link,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<FoxProvider>(context, listen: false).fetchFox();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}