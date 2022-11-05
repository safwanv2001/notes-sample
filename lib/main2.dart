import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:providersample1/provider_class.dart';

import 'addnote.dart';
import 'constants.dart';

class Main2 extends StatelessWidget {
   Main2({Key? key}) : super(key: key);

  int? d;
  int a = 1;
  int? f;

  TextEditingController txt2controller=TextEditingController();
  clr() {
    if (a == 1) {
      a = 2;
      return const Color.fromRGBO(204, 214, 166, 100);
    } else if (a == 2) {
      a = 3;
      return const Color.fromRGBO(218, 226, 182,100);
    } else if (a == 3) {
      a = 4;
      return const Color.fromRGBO(223, 232,204,100);
    }
    else if(a==4){
      a=1;
      return const Color.fromRGBO(247, 237, 219,100);
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.centerLeft,
                  color:const Color.fromRGBO(249, 166, 2, 130),
                  child:
                  Text('  Notes', style: GoogleFonts.lato(fontSize: 28,color: Colors.black))),
            ),
            const Divider(),
            Expanded(
              flex: 11,
              child: SingleChildScrollView(
                child: Container(
                  child: Provider.of<ProviderClass>(context).notes.isEmpty
                      ? Container(child:const Center(child: Text('Empty')))
                      : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children:
                          Provider.of<ProviderClass>(context).notes.map((e) {

                         return  InkWell(
                           onTap: () {
                             e['body'] ??
                                 '';
                             showDialog(
                                 context: context,
                                 builder: (context) {
                                   return AlertDialog(
                                     elevation: 20,
                                     title: Text(
                                         e['title'] ??
                                             '',
                                         style: GoogleFonts.aBeeZee(
                                             fontSize: 30)),
                                     content: TextField(
                                         readOnly: true,
                                         maxLines: 10,
                                         controller: txt2controller,
                                         style: GoogleFonts.lato(
                                             fontSize: 20)),

                                   );
                                 });
                           },
                           child: Container(
                                 width: Provider.of<ProviderClass>(context).notes.indexOf(e)%3!=0?(deviceWidth/2)-11:deviceWidth-18,
                                 height: 190,
                                 decoration: BoxDecoration(
                                 color: clr(),
                             borderRadius:
                             BorderRadius.circular(25)),
                             child: Padding(
                             padding: const EdgeInsets.fromLTRB(
                             20, 20, 10, 10),
                               child: Padding(
                                 padding: const EdgeInsets.fromLTRB(
                                     0, 0, 10, 10),
                                 child: Column(
                                   crossAxisAlignment:
                                   CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       '${e['title']}'??'',
                                       style: GoogleFonts.actor(
                                         fontSize: 40,
                                       ),
                                     ),
                                     Padding(
                                       padding:
                                       const EdgeInsets.all(8.0),
                                       child: Text(
                                           '${e['body']}' ??
                                               '',overflow: TextOverflow.fade,maxLines: 4,
                                           style: GoogleFonts.lato(
                                               fontSize: 20,
                                               color: const Color.fromRGBO(
                                                   255, 144, 2, 100))),
                                     ),
                                   ],
                                 ),
                               ),)),
                         );
                         }).toList()
                  ,),
                      )
                  ),
              ),
              ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addnote(),
                ));
          },
          child: Icon(Icons.add)),
    );
  }
}
