import "package:counter/provider/favourite_provider.dart";
import "package:counter/screen/favourite/my_favourite.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> fav = [];

  @override
  Widget build(BuildContext context) {
    //  final favouriteProvide = Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Favourite App')),
        backgroundColor: Colors.amber,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFavouriteItemScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.fav.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item ' + index.toString()),
                      trailing: Icon(value.fav.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
