import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:providersample1/provider_class.dart';
import 'addnote.dart';
import 'main2.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (ctx)=>ProviderClass(),child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Main2(),
    ),);


  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? d;
  int a = 1;
  TextEditingController txtcontroller=TextEditingController();
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
              child: Container(
                child: Provider.of<ProviderClass>(context).notes.isEmpty
                    ? Container(child:const Center(child: Text('Empty')))
                    : ListView.builder(
                        itemCount: d = Provider.of<ProviderClass>(context).notes.length,
                        itemBuilder: (context, index) {
                          if (Provider.of<ProviderClass>(context).notes.isEmpty) {
                            return const ListTile(
                              title: Text('Empty'),
                            );
                          } else {
                            return SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(7, 0, 5, 5),
                                child: index%3==0?Wrap(
                                  spacing: 8,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        txt2controller.text=Provider.of<ProviderClass>(context).notes[index]
                                        ['body'] ??
                                            '';
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                elevation: 20,
                                                title: Text(
                                                    Provider.of<ProviderClass>(context).notes[index]
                                                    ['title'] ??
                                                        '',
                                                    style: GoogleFonts.aBeeZee(
                                                        fontSize: 30)),
                                                content: TextField(
                                                    readOnly: true,
                                                    maxLines: 10,
                                                    controller: txtcontroller,
                                                    style: GoogleFonts.lato(
                                                        fontSize: 20)),

                                              );
                                            });
                                      },
                                      child: Container(
                                        width: 370,
                                        height: 190,
                                        decoration: BoxDecoration(
                                            color: clr(),
                                            borderRadius:
                                            BorderRadius.circular(25)),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 20, 10, 10),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Provider.of<ProviderClass>(context).notes[index]['title']??'',
                                                style: GoogleFonts.actor(
                                                  fontSize: 40,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                    Provider.of<ProviderClass>(context).notes[index]
                                                    ['body'] ??
                                                        '',overflow: TextOverflow.fade,maxLines: 4,
                                                    style: GoogleFonts.lato(
                                                        fontSize: 20,
                                                        color: const Color.fromRGBO(
                                                            255, 144, 2, 100))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ):Wrap(
                                    spacing: 8,
                                    children: [
                                    InkWell(
                                    onTap: () {
                                  txtcontroller.text=Provider.of<ProviderClass>(context).notes[index]
                                  ['body'] ??
                                  '';
                                  showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      elevation: 20,
                                      title: Text(
                                          Provider.of<ProviderClass>(context).notes[index]
                                          ['title'] ??
                                              '',
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: 30)),
                                      content: TextField(
                                          readOnly: true,
                                          maxLines: 10,
                                          controller: txtcontroller,
                                          style: GoogleFonts.lato(
                                              fontSize: 20)),

                                    );
                                  });
                            },
                              child: Container(
                                width: 185,
                                height: 190,
                                decoration: BoxDecoration(
                                    color: clr(),
                                    borderRadius:
                                    BorderRadius.circular(25)),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 20, 10, 10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Provider.of<ProviderClass>(context).notes[index]['title']??'',
                                        style: GoogleFonts.actor(
                                          fontSize: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.all(8.0),
                                        child: Text(
                                            Provider.of<ProviderClass>(context).notes[index]
                                            ['body'] ??
                                                '',overflow: TextOverflow.fade,maxLines: 4,
                                            style: GoogleFonts.lato(
                                                fontSize: 20,
                                                color: const Color.fromRGBO(
                                                    255, 144, 2, 100))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),])
                              ),
                            );
                          }
                        },
                      ),
              ),
            )
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
