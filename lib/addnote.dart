import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:providersample1/provider_class.dart';
import 'constants.dart';
import 'main2.dart';

class Addnote extends StatefulWidget {
  const Addnote({Key? key}) : super(key: key);

  @override
  State<Addnote> createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  TextEditingController txt1controller = TextEditingController();
  TextEditingController txt2controller = TextEditingController();
  String? txt1;
  String? txt2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(  5, 20,5,5),
                  child: TextField(
                    style: GoogleFonts.lato(fontSize: 30,),
                    controller: txt1controller,
                    onChanged: (value) {
                      txt1 = value;
                    },
                    decoration:  InputDecoration(hintText: 'Add title',hintStyle: GoogleFonts.lato(fontSize: 30)),
                  ),
                ),
                Divider(),
                Padding(
                  padding:  EdgeInsets.fromLTRB(5, 0, 5, 5),
                  child:
                  TextField(
                    style: TextStyle(fontSize: 20),
                  maxLines: 35,
                    controller: txt2controller,
                    onChanged: (value) {
                      txt2 = value;
                    },
                    decoration: InputDecoration(hintText: 'Add content',hintStyle: GoogleFonts.lato(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
Provider.of<ProviderClass>(context,listen: false).addNote({'title': txt1, 'body': txt2});
        print(Provider.of<ProviderClass>(context,listen: false).notes);
        Navigator.pop(context, MaterialPageRoute(
          builder: (context) {
            return  Main2();
          },
        ));
      },child: const Icon(Icons.done),backgroundColor: Colors.amber),
    );
  }
}
