import 'package:Musama/services/Utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Musama/services/Authenticatiion_Services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget sideDrawer = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(
            "Jays_Nathan",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white54),
          ),
          accountEmail: new Text(
            "ssebagalanathan@gmail.com",
            style: TextStyle(color: Colors.grey),
          ),
          currentAccountPicture: new GestureDetector(
            onTap: () => print("Current User"),
            child: new CircleAvatar(
              backgroundColor: Colors.black54.withOpacity(.2),
              backgroundImage: AssetImage(
                "images/Profilepic.png",
              ),
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/h3.jpg"), fit: BoxFit.cover)),
        ),
        new ListTile(
          title: Text(
            "Categories",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          leading: new Icon(
            Icons.filter_list,
            color: Colors.orange,
            size: 20.0,
          ),
          trailing: new Icon(
            Icons.arrow_drop_down,
            color: Colors.orange,
            size: 20.0,
          ),
        ),
        new ListTile(
          leading: new Icon(
            Icons.shopping_basket,
            color: Colors.orange,
            size: 20.0,
          ),
          title: Text(
            "My Cart",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          trailing: new Icon(
            Icons.arrow_drop_down,
            size: 20.0,
            color: Colors.orange,
          ),
        ),
        new ListTile(
          leading: new Icon(
            Icons.settings,
            color: Colors.orange,
            size: 20.0,
          ),
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        new ListTile(
          leading: new Icon(
            Icons.help,
            color: Colors.orange,
            size: 20.0,
          ),
          title: Text(
            "Help",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        new ListTile(
          leading: new Icon(
            Icons.close,
            color: Colors.orange,
            size: 20.0,
          ),
          title: Text(
            "Exit",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        new ListTile(
          leading: new Icon(
            Icons.exit_to_app,
            color: Colors.orange,
            size: 20.0,
          ),
          title: Text(
            "Logout",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
    Widget carouselSlider = new Container(
        child: CarouselSlider(
      height: screenAwaresize(240, context),
      aspectRatio: 16 / 9,
      autoPlay: true,
      autoPlayAnimationDuration: Duration(milliseconds: 2000),
      viewportFraction: 0.7,
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enableInfiniteScroll: true,
      pauseAutoPlayOnTouch: Duration(milliseconds: 2000),
      items: [
        //Item 1
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Image.asset('images/carousel/Carousel.png',
                      fit: BoxFit.cover)),
            ],
          ),
        ),
        //Item 2
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Image.asset(
                    'images/carousel/Carousel2.png',
                    fit: BoxFit.cover,
                  )),
            ],
          ),
        ),
        //Item 3
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            // boxShadow:BoxShadow[
            //   colors

            // ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Image.asset('images/carousel/Carousel3.png')),
            ],
          ),
        ),
        //Item 4
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Image.asset('images/carousel/Carousel5.png')),
            ],
          ),
        )

        ////Item5
        ,
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Image.asset('images/carousel/Carousel6.png')),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Image.asset('images/carousel/Carousel11.png')),
            ],
          ),
        )
      ],
    ));

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.shoppingCart,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            FlatButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red),
                  child: Text(
                    "SignOut",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.listUl,
              color: Colors.white,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Musama",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              sideDrawer,
            ],
          ),
        ),
        body: ListView(children: [
          Column(
            children: [
              BigPicBg(),
              carouselSlider,
              StreamBuilder(
                  // ignore: deprecated_member_use
                  stream: Firestore.instance.collection("Item").snapshots(),
                  builder: (context, snapshot) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot item = snapshot.data.documents[index];
                        return ListTile(
                          leading: Image.network(
                            item.data()['imageUrl'],
                            width: 125,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            item.data()["itemName"] ?? '',
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                          subtitle: Text(
                            item.data()["category"] ?? '',
                            style: TextStyle(color: Colors.green),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.black,
                        );
                      },
                    );
                  }),
            ],
          ),
        ]));
  }
}

class BigPicBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bgpost.png"), fit: BoxFit.cover)),
    );
  }
}
