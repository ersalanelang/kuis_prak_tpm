import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_praktpm/detail_page.dart';

import 'model/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(10),
        child: _createListCard(),
      ),
    );
  }

  Widget _createListCard() {
    var dataMenu = getAllMenu();

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataMenu[index], context);
      },
      itemCount: dataMenu.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.yellow,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 7),
        );
      },
    );
  }

  Widget _createCard(Menu data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(
              image: data.image,
              name: data.name,
              desc: data.desc,
              price: data.price,
            );
          }));
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.network(data.image),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    child: Text(
                        data.name,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
