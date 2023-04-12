import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model.dart';

List<Contact> Contactlist= [
    Contact(
      name:"Dixit",
      num: "7069760596",

    ),
  Contact(
    name: "darshan",
    num: "1234567897",
  ),
  Contact(
    name: "yash",
    num: "5746534867",
  ),
  Contact(
    name: "krunal",
    num: "1254379865",
  ),
  Contact(
    name: "Vidit Sir",
    num: "0098765456"
  ),
  Contact(
     name: "Bhargav",
    num: "1254345676"
  ),
  Contact(
    name: "vivek",
    num: "2121233243"
  ),
  Contact(
    name: "krish",
    num: "5763543232",
  ),
  Contact(
    name: "smit",
    num: "3412900867",
  ),
  Contact(
    name: "bhavin",
    num: "0000000000"
  )

];

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(child: Text("Settings")),
                PopupMenuItem(child: Text("Help")),
                PopupMenuItem(child: Text("Profile")),
              ],
            ),
          ),
          Text("Contact Dairy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black54, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black54),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                label: Text("Search", style: TextStyle(color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 260),
            child: Text(
              "MY CONTACT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 20,),

          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Contacttile(
                  index,
                  Contactlist[index],
                );
              },
              itemCount: Contactlist.length,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
          bottomNavigationBar: Container(
            height: 60,
            width: double.infinity,
            color: Colors.indigo.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.star,
                  size: 30,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "add").then((value) {
                        setState(() {});
                      });
                    },
                    child: Icon(
                      Icons.person_add,
                      size: 30,
                    )),

              ],
            ),

      ),
    ));
  }

  Widget Contacttile(int index, Contact c1) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text("${c1.name}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff3E98E4))),
        subtitle: Text(
          "${c1.num}",
          style: TextStyle(color: Color(0xff3E98E4), fontSize: 15),
        ),
        leading: (c1.image == null)
            ? CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/images/user.png"),
        )
            : CircleAvatar(
          backgroundImage: FileImage(File("${c1.image}")),
        ),
        trailing: InkWell(
          onTap: () async {
            String link = "tel:${c1.num} ";
            await launchUrl(Uri.parse(link));
          },
          child: Icon(
            Icons.call,
            color: Color(0xff3E98E4),
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    Contactlist.removeAt(index);
                  });
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () {
                  txtname = TextEditingController(text: c1.name);
                 txtnumber  = TextEditingController(text: c1.num);

                  upDialogue(index);
                },
                icon: Icon(Icons.edit),
                color: Colors.green.shade300,
              ),
              IconButton(
                onPressed: () async {
                  String link = "sms:${c1.num}";
                  await launchUrl(Uri.parse(link));
                },
                icon: Icon(Icons.message),
                color: Colors.blue,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.video_call),
                color: Colors.black,
                style: IconButton.styleFrom(iconSize:


                40),
              ),
              IconButton(
                onPressed: () {
                  Share.share("${c1.image} & ${c1.name} & ${c1.num}");
                },
                icon: Icon(Icons.share),
                color: Colors.amber,
              )
            ],
          )
        ],
      ),
    );

}
  void upDialogue(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your name";
                  }
                },
                controller: txtname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3E98E4), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3E98E4), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xff3E98E4)),
                  ),
                  label: Text("First name",
                      style: TextStyle(color: Color(0xff3E98E4))),
                  suffixIcon: Icon(
                    Icons.person_add_alt,
                    color: Color(0xff3E98E4),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value?.length != 10) {
                    return "Please Enter 10 Number";
                  }
                },
                controller: txtnumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade200, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade200, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xff3E98E4)),
                  ),
                  label: Text("Number",
                      style: TextStyle(color: Color(0xff3E98E4))),
                  suffixIcon: Icon(
                    Icons.call,
                    color: Color(0xff3E98E4),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (txtkey.currentState!.validate()) {
                      String Nname = txtname.text;
                      String Nnumber = txtnumber.text;

                      setState(() {
                        Contactlist[index] =
                            Contact(name: Nname, num: Nnumber);
                      });
                    }
                    Navigator.pop(context);
                  },
                  child: Text("Update"))
            ],
          ),
        );
      },
    );
  }
}
