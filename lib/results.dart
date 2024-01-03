import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultPage extends StatefulWidget {
  final String bill;
  final double friends;
  final double tip;
  ResultPage(this.bill, this.friends, this.tip);
  @override
  _ResultPageState createState() => _ResultPageState();

}

class _ResultPageState extends State<ResultPage> {

  String kwota1 = '';

  @override
  void initState() {
    super.initState();
    kwota();
  }

  kwota(){

    double finalbill =
        (double.parse(widget.bill) + widget.tip) / widget.friends;

    setState(() {
      kwota1 = finalbill.toStringAsFixed(2);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20,  right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40),
              child: Text("Kwota na głowę: ", style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w700 , color: Colors.black)),
            ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.orange
          ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("To po tyle: ", style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700 , color: Colors.black),
                    ),
                    Text("${kwota1}zł", style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700 , color: Colors.black),
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
                        Text("Rachunek: ", style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700 , color: Colors.black)),
                        Text("Napiwek: ", style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700 , color: Colors.black)),
                        Text("Ilość Osób: ", style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700 , color: Colors.black))
                      ],
                    ),
                    SizedBox(width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.bill.toString()} zł", style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700 , color: Colors.black)),
                        Text("${widget.tip.round().toString()} zł", style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700 , color: Colors.black)),
                        Text(widget.friends.round().toString(), style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700 , color: Colors.black))
                      ],
                    ),
                  ],

                ),
              ),

            ],
          ) ,
        ),
            SizedBox(height: 25),
            Text("Każdy powinien zapłacić $kwota1 zł", style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700 , color: Colors.black),
            ),
            Container(
              width: MediaQuery.of(context).size.width /2,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: ()=>Navigator.pop(context),
                child: Center(child: Text("Nowa kalkulacja ? ",
                  style: GoogleFonts.roboto(fontSize: 20 ,
                    fontWeight: FontWeight.w700 ,
                    color: Colors.black),
              ),
              ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
