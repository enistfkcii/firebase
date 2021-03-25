import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.cyan

    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String ad,kategori,id;
  double fiyat;
  urunAdiAl(urunadi){
    this.ad = urunadi;
  }
  urunIdAl(urunid){
    this.id = urunid;
  }
  urunkategoriAl(urunkategori){
    this.kategori = urunkategori;
  }
  urunfiyatAl(urunfiyati){
    this.fiyat = double.parse(urunfiyati);
  }
  veriEkle(){
    print("Eklendi");
    DocumentReference veriYolu = FirebaseFirestore.instance.collection("Urunler").doc(ad);
    //coklu veri gönderme asagıda
    Map<String,dynamic> urunler = {
      "urunAdi":ad,
      "urunFiyat":fiyat,
      "urunKategori":kategori,
      "urunid":id
    };
    veriYolu.set(urunler).whenComplete(() {
      print(ad + " Eklendi");
    });
  }
  veriOku(){
    print("Okundu");
  }
  veriGuncelle(){
    print("Güncellendi");
  }
  veriSil(){
    print("Silindi");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün envanteri"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Ürün adı",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    width: 2.0
                    )
                  )
                ),
                onChanged: (String urunadi){
                urunAdiAl(urunadi);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Ürün id",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0
                        )
                    )
                ),
                onChanged: (String urunid){
                urunIdAl(urunid);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Ürün kategorisi",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0
                        )
                    )
                ),
                onChanged: (String urunkategori){
                urunkategoriAl(urunkategori);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Ürün fiyatı",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0
                        )
                    )
                ),
                onChanged: (String urunfiyati){
                urunfiyatAl(urunfiyati);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed:(){
                  veriEkle();
                },
                child: Text("Ekle"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green
                  ),
                ),
                ElevatedButton(onPressed:(){
                  veriOku();
                },
                  child: Text("Oku"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.brown
                  ),
                ),
                ElevatedButton(onPressed:(){
                  veriGuncelle();
                },
                  child: Text("Güncelle"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent
                  ),
                ),
                ElevatedButton(onPressed:(){
                  veriSil();
                },
                  child: Text("Sil"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent
                  ),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}
