import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  TextEditingController ControllerNominalPemasukan = TextEditingController();
  TextEditingController controllerDeskripsi = TextEditingController();

  String Deskripsi = "";
  String NominalPemasukan = "";
  List<String> MetodePembayaran = ['Tunai','Kredit/Debit','Transfer Bank','E-Waller'];
  String MPgroup ="";
  

  bool gaji = false;
  bool tabungan = false;
  bool Utang = false;
  bool Penjualan = false;

  @override
  void dispose() {
    ControllerNominalPemasukan.dispose();
    controllerDeskripsi.dispose();
    super.dispose();
  }
  
  void hapusValue(){
    ControllerNominalPemasukan.text = "";
    controllerDeskripsi.text = "";
  }

  @override
  Widget build(BuildContext context) {    
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 120, 129),
      body: ListView(
        children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Container(
                  width: lebar,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 67, 145, 155),
                  ),
                  child: Column(
                    
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.only(top: 10, left: 20),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("back.png"),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top:8),
                              child:
                                Text('Transaksi Baru',
                                style: GoogleFonts.oswald(
                                  textStyle : const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right:20,top:8),
                              child:
                                Text('Saleh',
                                style: GoogleFonts.oswald(
                                  textStyle : const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 155,
                            height: 40,
                            margin: EdgeInsets.only(left: 20, top:20,),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 35, 120, 129),
                              borderRadius: BorderRadius.circular(25),
                              
                            ),
                            child:  Text('Pemasukkan',
                              style: GoogleFonts.oswald(
                                textStyle : const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            ),
                          ),
                          Container(
                            width: 155,
                            height: 40,
                            margin: EdgeInsets.only(right: 20, top:20,),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 35, 120, 129),
                              borderRadius: BorderRadius.circular(25),
                              
                            ),
                            child:  Text('pengeluaran',
                              style: GoogleFonts.oswald(
                                textStyle : const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:10),
                      child:
                        Text('Informasi Transaksi',
                        style: GoogleFonts.oswald(
                            textStyle : const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                  
                  child:Column(
                    
                    children: [
                      TextField(
                        controller: ControllerNominalPemasukan ,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style: new TextStyle(color: Color.fromARGB(255, 255, 255, 255),),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 67, 145, 155),
                          
                          hintText: 'nominal transaksi',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 67, 145, 155),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height : 20),
                      TextFormField(
                        controller: controllerDeskripsi,
                        maxLines: 3,
                        style: new TextStyle(color: Color.fromARGB(255, 255, 255, 255),),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 67, 145, 155),
                          hintText: 'Deskripsi',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 67, 145, 155),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height : 20),
                      Container(
                        margin: EdgeInsets.only(top:10),
                        child:
                          Text('Metode Pembayaran',
                          style: GoogleFonts.oswald(
                              textStyle : const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            for(var item in MetodePembayaran)
                            Row(
                              children: [
                                Radio(
                                  value: item, 
                                  groupValue: MPgroup, 
                                  onChanged: (newValue){
                                    setState(() {
                                      MPgroup = newValue.toString();
                                    });
                                    
                                  },
                                ),
                                Text(item,
                                  style :GoogleFonts.montserrat(
                                      textStyle : const TextStyle(
                                        fontSize: 12,
                                        
                                        color: Color.fromARGB(255, 255, 255, 255),
                                     ),
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height : 20),
                      Column(
                        
                        children: [
                          Container(
                        
                        child:
                          Text('Metode Transaksi',
                          style: GoogleFonts.oswald(
                              textStyle : const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                      ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 10,bottom: 20),
                            child: Column(
                              
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      
                                      value: gaji, onChanged: (bool? value){
                                        setState(() {
                                          gaji= value!;
                                        });
                                      },
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 45),
                                      child: Text("Gaji",
                                        style :GoogleFonts.montserrat(
                                            textStyle : const TextStyle(
                                              fontSize: 12,
                                              
                                              color: Color.fromARGB(255, 255, 255, 255),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: tabungan, onChanged: (bool? value){
                                        setState(() {
                                          tabungan= value!;
                                        });
                                      },
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 45),
                                      child: Text("Tabungan",
                                        style :GoogleFonts.montserrat(
                                            textStyle : const TextStyle(
                                              fontSize: 12,
                                              
                                              color: Color.fromARGB(255, 255, 255, 255),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: Utang, onChanged: (bool? value){
                                        setState(() {
                                          Utang= value!;
                                        });
                                      },
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 45),
                                      child: Text("Utang",
                                        style :GoogleFonts.montserrat(
                                            textStyle : const TextStyle(
                                              fontSize: 12,
                                              
                                              color: Color.fromARGB(255, 255, 255, 255),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: Penjualan, onChanged: (bool? value){
                                        setState(() {
                                          Penjualan= value!;
                                        });
                                      },
                                    ),
                                    Text("Penjualan",
                                      style :GoogleFonts.montserrat(
                                          textStyle : const TextStyle(
                                            fontSize: 12,
                                            
                                            color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],  
                            ),
                          ),
                          
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            NominalPemasukan = ControllerNominalPemasukan.text ;
                            Deskripsi = controllerDeskripsi.text;
                            hapusValue();
                          });
                        },
                        child: Text("submit"),
                      ),
                      Text('nominal pemasukan : $NominalPemasukan'),
                      Text('Deskripsi : $Deskripsi'),
                      Text('Metode Pembayaran: $MPgroup'),
                      Text('kategori Transaksi: ${gaji ? "gaji": ""} ${tabungan ? "tabungan": ""} ${Utang ? "utang": ""} ${Penjualan ? "penjualan": ""}'),
                    ],
                  ),
                  
                ),
              ],
            ),
        ],
      ),
    );
  }
}