import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';


void main() => runApp(MyApp());
Color konfioPurple = const Color.fromARGB(0xFF, 0x72, 0x64, 0xc9);
Color konfioDarkPurple = const Color.fromARGB(0xFF, 0x57, 0x4b, 0xa8);
Color konfioLightPurple = const Color.fromARGB(0xFF, 0xB4, 0xC5, 0xF1);
Color konfioGreenDark = const Color.fromARGB(0xFF, 0x00, 0xC2, 0xA2);
Color konfioGreyLight = const Color.fromARGB(0xFF, 0xB1, 0xB9, 0xC1);
Color konfioGreenLight = const Color.fromARGB(0xFF, 0x67, 0xE8, 0xD3);
var data = [3.0, 1.0, 3.0, 2.0];
var data1 = [2.0, 10.0, 8.0, 12.0];
var data2 = [0.0, 8.0, 7.0, 5.0];
var data3 = [0.0, 6.0, 9.0, 4.0];

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Asesor Financiero Pyme';



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: MyStatefulWidget(),

    );

  }
}

/**
 *  Facturación
 */
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Material mychart1Items(String title, String priceVal,String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: konfioGreenDark,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(subtitle, style: TextStyle(
                      fontSize: 20.0,
                      color: konfioGreenDark,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data1,
                      fillMode: FillMode.below,
                      fillGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [konfioGreenDark, konfioGreenLight],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Material mychart2Items(String title, String priceVal,String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: konfioDarkPurple,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(subtitle, style: TextStyle(
                      fontSize: 20.0,
                      color: konfioDarkPurple,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data3,
                      fillMode: FillMode.below,
                      fillGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [konfioDarkPurple, konfioLightPurple],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          width: 100,
          height: 100,
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            title: Text('Gastos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Facturación'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Ventas'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: konfioPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody(int index) {
    double cardHeight = 200;
    switch (index) {
      case 0: // Gastos
        return
          Container(
          child: StaggeredGridView.count(
          crossAxisCount: 1,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: <Widget>[
              /// NUMERO DE PROVEEDORES
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Material(
                      color: konfioDarkPurple,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.directions_boat,
                            color: konfioLightPurple,
                            size: 50,
                          ),
                          Text(
                            '1179',
                            overflow: TextOverflow.ellipsis,
                            textScaleFactor: 3,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Proveedores en el periodo',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                            textScaleFactor: 1.5,
                          )
                        ],
                      )
                  )
              ),
              ///  GASTO MAS GRANDE
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.event_available,
                          color: konfioLightPurple,
                          size: 50,
                        ),
                        Text(
                          "\$11,005,280",
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: 2,
                          style: TextStyle(color: konfioPurple),
                        ),
                        Text(
                          'Gasto más grande del periodo',
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          'google operaciones de méxico, s. de r.l. de c.v.',
                          overflow: TextOverflow.visible,
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
              ),
              /// PROVEEDOR MAS GRANDE
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.star,
                          color: konfioLightPurple,
                          size: 50,
                        ),
                        Text(
                          "\$263,719,700",
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: 2,
                          style: TextStyle(color: konfioPurple),
                        ),
                        Text(
                          'Proveedor más grande del periodo',
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          'red amigo dal sapi de cv sofom enr',
                          overflow: TextOverflow.visible,
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ),
                Text(
                  'Facturas de gastos más altos del periodo',
                  style: TextStyle(color: konfioPurple),
                  textScaleFactor: 2,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  shadowColor: Color(0x802196F3),
                  child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                        children: [
                          Text(
                            'Fecha',
                            style: TextStyle(fontStyle: FontStyle.italic, color: konfioPurple),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'RFC',
                            style: TextStyle(fontStyle: FontStyle.italic, color: konfioPurple),
                            textAlign: TextAlign.center,

                          ),
                          Text(
                            'Razón Social',
                            style: TextStyle(fontStyle: FontStyle.italic, color: konfioPurple),
                            textAlign: TextAlign.center,

                          ),
                          Text(
                            'Importe',
                            style: TextStyle(fontStyle: FontStyle.italic, color: konfioPurple),
                            textAlign: TextAlign.center,
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Text(
                            '1/11/18',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'GOM0809114P5',
                            textAlign: TextAlign.center,

                          ),
                          Text(
                            'Google Operaciones de México',
                            textAlign: TextAlign.center,

                          ),
                          Text(
                            '\$11,005.28',
                            textAlign: TextAlign.center,
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Text(
                            '1/02/19',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'GOM0809114P5',
                            textAlign: TextAlign.center,

                          ),
                          Text(
                            'Google Operaciones de México',
                            textAlign: TextAlign.center,

                          ),
                          Text(
                            '\$10,282.169',
                            textAlign: TextAlign.center,
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Text(
                            '2/12/18',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'GOM0809114P5',
                            textAlign: TextAlign.center,

                          ),
                          Text(
                            'Google Operaciones de México',
                            textAlign: TextAlign.center,

                          ),
                          Text(
                            '\$8,597.975',
                            textAlign: TextAlign.center,
                          )
                        ]
                      )
                    ],
                  )
                )
                ),
              ],
              staggeredTiles: [
                StaggeredTile.extent(1, 200),
                StaggeredTile.extent(1, 250),
                StaggeredTile.extent(1, 250),
                StaggeredTile.extent(1, 75),
                StaggeredTile.extent(1, 250)
              ],
            )
        );
        break;

      case 1: // Facturacion
        return
          Container(
              child: StaggeredGridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 0.0,
                children: <Widget>[
                  Text(
                    "Tu Facturación",
                    textAlign: TextAlign.center,
                    textScaleFactor: 2.5,
                  ),
                  /// VENTAS
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Material(
                          color: konfioGreenDark,
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(24.0),
                          shadowColor: Color(0x802196F3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Colors.white,
                                size: 80,
                              ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                Text(
                                  '293,019,991',
                                  overflow: TextOverflow.ellipsis,
                                  textScaleFactor: 3,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Ventas',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                  textScaleFactor: 1.5,
                                )
                              ]
                                ),
                              ],
                          )
                      )
                  ),
                  ///GASTOS
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Material(
                          color: konfioDarkPurple,
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(24.0),
                          shadowColor: Color(0x802196F3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Colors.white,
                                size: 80,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '180,141,485',
                                      overflow: TextOverflow.ellipsis,
                                      textScaleFactor: 3,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Gastos',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white),
                                      textScaleFactor: 1.5,
                                    )
                                  ]
                              ),
                            ],
                          )
                      )
                  ),
                  /// GANANCIAS
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Material(
                          color: konfioGreyLight,
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(24.0),
                          shadowColor: Color(0x802196F3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Colors.white,
                                size: 80,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '112,878,506',
                                      overflow: TextOverflow.ellipsis,
                                      textScaleFactor: 3,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Ganancias',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white),
                                      textScaleFactor: 1.5,
                                    )
                                  ]
                              ),
                            ],
                          )
                      )
                  ),
                  ///GRAFICA
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mychart1Items("Ingresos","",""),
                  ),
                  ///GRAFICA
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mychart2Items("Egresos","",""),
                  ),
                  ///IVA
                  Text(
                    "Tu IVA",
                    textAlign: TextAlign.center,
                    textScaleFactor: 2.5,
                  ),
                  /*
                  ///GRAFICA
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mychart2Items("Ingresos vs Egresos","",""),
                  ),
                  *
                  /
                   */
                  Padding(
                    padding: EdgeInsets.all(8),
                          child: Material(
                            color: Colors.white,
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(24.0),
                            shadowColor: Color(0x802196F3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Image.asset(
                                  'images/cir1.png',
                                  width: 180,
                                  height: 180,
                                ),
                                Text(
                                  "\$ 40,416,550",
                                  style: TextStyle(color: konfioGreenLight),
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 2.0,

                                ),
                                Text(
                                  "IVA Cobrado",
                                  style: TextStyle(color: konfioGreyLight),
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.5,

                                ),
                              ],
                            ),
                      ),
                      ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Material(
                      color: Colors.white,
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                          'images/cir2.png',
                          width: 180,
                          height: 180,
                      ),
                        Text(
                          "\$ 24,847,101",
                          style: TextStyle(color: konfioDarkPurple),
                          textAlign: TextAlign.center,
                          textScaleFactor: 2.0,

                        ),
                          Text(
                            "IVA Pagado",
                            style: TextStyle(color: konfioGreyLight),
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.5,

                          ),
                        ],
                      ),
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Material(
                      color: Colors.white,
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "\$ 15,569,449",
                            style: TextStyle(color: konfioDarkPurple),
                            textAlign: TextAlign.center,
                            textScaleFactor: 2.5,

                          ),
                          Text(
                            "IVA a pagar",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.5,

                          ),
                          Text(
                            "*Esta información es una estimación aproximada basada en los datos de tu facturación",
                            style: TextStyle(color: konfioGreyLight),
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.0,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),

                  )
                ],
                staggeredTiles: [
                  StaggeredTile.extent(1, 50),
                  StaggeredTile.extent(1, 125),
                  StaggeredTile.extent(1, 125),
                  StaggeredTile.extent(1, 125),
                  StaggeredTile.extent(1, 250),
                  StaggeredTile.extent(1, 250),
                  StaggeredTile.extent(1, 50),
                  StaggeredTile.extent(1, 270),
                  StaggeredTile.extent(1, 270),
                  StaggeredTile.extent(1, 250)
                ],
              )
          );

        break;

      case 2: // Ventas
        return
          Container(
              child: StaggeredGridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 0.0,
                children: <Widget>[
                  /// NUMERO DE CLIENTES
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Material(
                          color: konfioGreenDark,
                          elevation: 14.0,
                          borderRadius: BorderRadius.circular(24.0),
                          shadowColor: Color(0x802196F3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.person,
                                color: konfioGreenLight,
                                size: 50,
                              ),
                              Text(
                                '2749',
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 3,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Clientes en el periodo',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                                textScaleFactor: 1.5,
                              )
                            ],
                          )
                      )
                  ),
                  ///  VENTA MAS GRANDE
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.event_available,
                              color: konfioGreenLight,
                              size: 50,
                            ),
                            Text(
                              "\$3,990.750",
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 2,
                              style: TextStyle(color: konfioGreenDark),
                            ),
                            Text(
                              'Venta más grande del periodo',
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.5,
                            ),
                            Text(
                              'scotiabank inverlat, s. a.',
                              overflow: TextOverflow.visible,
                              textScaleFactor: 1.5,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                  ),
                  /// Cliente MAS GRANDE
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.star,
                              color: konfioGreenLight,
                              size: 50,
                            ),
                            Text(
                              "\$9,828.196",
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 2,
                              style: TextStyle(color: konfioGreenDark),
                            ),
                            Text(
                              'Cliente más grande del periodo',
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.5,
                            ),
                            Text(
                              'scotiabank inverlat, s. a.',
                              overflow: TextOverflow.visible,
                              textScaleFactor: 1.5,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                  ),
                  Text(
                    'Facturas de ventas más altas del periodo',
                    style: TextStyle(color: konfioGreenDark),
                    textScaleFactor: 2,
                  ),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Material(
                          color: Colors.white,
                          elevation: 14.0,
                          shadowColor: Color(0x802196F3),
                          child: Table(
                            border: TableBorder.all(),
                            children: [
                              TableRow(
                                  children: [
                                    Text(
                                      'Fecha',
                                      style: TextStyle(fontStyle: FontStyle.italic, color: konfioGreenDark),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'RFC',
                                      style: TextStyle(fontStyle: FontStyle.italic, color: konfioGreenDark),
                                      textAlign: TextAlign.center,

                                    ),
                                    Text(
                                      'Razón Social',
                                      style: TextStyle(fontStyle: FontStyle.italic, color: konfioGreenDark),
                                      textAlign: TextAlign.center,

                                    ),
                                    Text(
                                      'Importe',
                                      style: TextStyle(fontStyle: FontStyle.italic, color: konfioGreenDark),
                                      textAlign: TextAlign.center,
                                    )
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Text(
                                      '10/01/19',
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'SIN941202514',
                                      textAlign: TextAlign.center,

                                    ),
                                    Text(
                                      'SCOTIABANK INVERLAT, S.A.',
                                      textAlign: TextAlign.center,

                                    ),
                                    Text(
                                      '\$3,990,750',
                                      textAlign: TextAlign.center,
                                    )
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Text(
                                      '1/02/19',
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'SIN9412025IA',
                                      textAlign: TextAlign.center,

                                    ),
                                    Text(
                                      'SCOTIABANK INVERLAT, S.A.',
                                      textAlign: TextAlign.center,

                                    ),
                                    Text(
                                      '\$3,174,240',
                                      textAlign: TextAlign.center,
                                    )
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Text(
                                      '14/02/19',
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'SIN9412025I4',
                                      textAlign: TextAlign.center,

                                    ),
                                    Text(
                                      'SCOTIABANK INVERLAT, S.A.',
                                      textAlign: TextAlign.center,

                                    ),
                                    Text(
                                      '\$2,363,900',
                                      textAlign: TextAlign.center,
                                    )
                                  ]
                              )
                            ],
                          )
                      )
                  ),
                ],
                staggeredTiles: [
                  StaggeredTile.extent(1, 200),
                  StaggeredTile.extent(1, 250),
                  StaggeredTile.extent(1, 250),
                  StaggeredTile.extent(1, 75),
                  StaggeredTile.extent(1, 300)
                ],
              )
          );
        break;
        
      default: 
        return Container(
            child: Text('Error!')
        );
    }
  }
}