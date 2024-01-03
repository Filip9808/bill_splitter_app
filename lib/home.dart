import 'package:bill_splitter_app/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillSplit  extends StatefulWidget {
  @override
  _BillSplitState createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  double friends = 0.0;
  double tip = 0.0;
  String bill = '';
  buildbutton(String text){
    return Expanded(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all((28))
          ),
          onPressed: (){
            if(text == 'C'){
              setState(() {
                bill = '';
              });
            }else{
              setState(() {
                bill += text;
              });
            }
          },
            child: Text(
                text,
                style:  GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w700 , color: Colors.black)
            ),
        ),
    );
  }
  TextStyle mystyle = GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700 , color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 50),
              child: Text("No to po ile?", style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black
              ),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rachunek", style: mystyle,
                        ),
                        Text("${bill} zł", style: mystyle,
                        ) ,
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ilość Osób: ", style: mystyle),
                            Text("Napiwek: ", style: mystyle),
                          ],
                        ),
                        SizedBox(width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(friends.round().toString(), style: mystyle),
                            Text("${tip.round().toString()} zł", style: mystyle),
                          ],
                        ),
                      ],

                    ),
                  ),

                ],
              ) ,
            ),
            SizedBox(height: 15,),
            Text("Ilość osób do podziału rachunku ?",
              style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700 , color: Colors.black),
            ),
            Slider(
              min: 0,
              max: 15,
              divisions: 15,
              activeColor: Colors.orange,
              inactiveColor: Colors.black,
              value: friends,
              onChanged: (value) {
                setState(() {
                  friends = value;
                });
              },
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular((20)),
                  ),
                  child: Column(
                    children: [
                      Text("NAPIWEK", style: mystyle
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 40,
                            height:  40,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  tip-- ;
                                });
                              },
                              backgroundColor: Colors.orange[400],
                              child: Icon(Icons.remove, color: Colors.black),
                            ),
                          ),
                            Text("${tip.round().toString()} zł", style: mystyle),

                          Container(
                            width: 40,
                            height:  40,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  tip++ ;
                                });
                              },
                              backgroundColor: Colors.orange[400],
                              child: Icon(Icons.add, color: Colors.black),
                            ),
                          ),
                        ],
                      )
                    ]
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                buildbutton("1"),
                buildbutton("2"),
                buildbutton("3"),

              ],
            ),
            Row(
              children: [
                buildbutton("4"),
                buildbutton("5"),
                buildbutton("6"),

              ],
            ),
            Row(
              children: [
                buildbutton("7"),
                buildbutton("8"),
                buildbutton("9"),

              ],
            ),
            Row(
              children: [
                buildbutton("."),
                buildbutton("0"),
                buildbutton("C"),

              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(bill, friends, tip))),
              child: Center(
                child: Text(
                  "Podziel rachunek",
                  style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700 , color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),

    )
    );
  }
}
