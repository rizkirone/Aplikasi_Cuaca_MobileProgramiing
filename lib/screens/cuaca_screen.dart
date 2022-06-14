import 'package:cuaca/providers/cuaca_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CuacaScreen extends StatefulWidget {
  const CuacaScreen({Key? key}) : super(key: key);
  @override
  _CuacaScreenState createState() => _CuacaScreenState();
}

class _CuacaScreenState extends State<CuacaScreen> {
  @override
  Widget build(BuildContext context) {
    var ukuranscreen= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text ('191011401194 - Rizki Setiawan',
        style: TextStyle (color:Colors.black,fontWeight:  FontWeight.bold)
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),

      body:
      Consumer<CuacaProvider>(
        builder: (context, provider, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row( children: const [SizedBox(height: 20,
                      )],),
                
                Row(
                 children:[
                   Row(
                  children:[
                  SizedBox(
                    height: 60,
                  width: ukuranscreen.width*0.05,
                  ),
                  ],
                ),
                  SizedBox(
                  height: 60,
                  width: ukuranscreen.width*0.60,
                  child: TextFormField(
                  controller: provider.inputcity,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,color: Colors.black,),
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nama Kota',hintStyle: const TextStyle(color: Colors.grey,),
                    border: OutlineInputBorder(),
                  ),  
                ),
                  ),

                Row(
                  children:[
                  SizedBox(
                    height: 60,
                  width: ukuranscreen.width*0.05,
                  ),
                  ],
                ),


                   SizedBox(
                     height: 60,
                     width: ukuranscreen.width*0.25,
                          child:ElevatedButton(   
                                onPressed: () => provider.tampilkanDataCuaca(
                                      city: provider.inputcity.text),
                                      style: ButtonStyle( 
                                      side: MaterialStateProperty.all( 
                                const BorderSide(width: 1.5, color: Colors.grey)),
                                     ), 
                            child: const Text('Tampilkan',style: TextStyle(color: Colors.black87,fontSize: 22,)), 
                ),
                   ),
                 ],
                ),

                
                Text(
                  provider.cuacaModel.name ?? '-',
                  style: const TextStyle(
                    fontSize: 70,color: Colors.cyan,
                  ),
                ),


                Container(
                  color:Colors.cyan,
                  height: 200,
                  width: 200,
                  child: Image.network(
                    'http://openweathermap.org/img/wn/${provider.cuacaModel.weather?.first.icon ?? ''}@4x.png',
                    fit: BoxFit.cover,
                  ),
                ),

              ListTile(
                  title:  Text(
                  provider.cuacaModel.weather?.first.description ?? '-',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30, fontWeight:  FontWeight.bold, color: Colors.cyan
                  ),
                 )
              ),
                ListTile(
                title : const Text('Suhu',
                style: TextStyle(fontSize: 22,)),
                trailing : Text(
                  '${provider.cuacaModel.main?.temp ?? '-'}°Celcius',
                  style: const TextStyle(
                    fontSize: 22, fontWeight:  FontWeight.bold
                  ),
                 )
                ),

                ListTile(
                title : const Text('Kecepatan Angin',
                style: TextStyle(fontSize: 22,)),
                trailing : Text(
                  '${provider.cuacaModel.wind?.speed?? '-'} Km/Jam ',
                  style: const TextStyle(
                    fontSize: 22, fontWeight:  FontWeight.bold
                  ),
                 )
                ),

                ListTile(
                title : const Text('Latitude',
                style: TextStyle(fontSize: 22,)),
                trailing : Text(
                  '${provider.cuacaModel.coord?.lat?? '-'}  ',
                  style: const TextStyle(
                    fontSize: 22,fontWeight:  FontWeight.bold
                  ),
                 )
                ),

                ListTile(
                title : const Text('Longtitude',
                style: TextStyle(fontSize: 22,)),
                trailing : Text(
                  '${provider.cuacaModel.coord?.lon?? '-'}  ',
                  style: const TextStyle(
                    fontSize: 22,fontWeight:  FontWeight.bold
                  ),
                 )
                ),

                Container(height: 90.0,),

              ],
            ),
          );
        },
      ),
    );
  }
}
