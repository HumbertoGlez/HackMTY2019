import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());
Color konfioPurple = const Color.fromARGB(0xFF, 0x72, 0x64, 0xc9);
Color konfioDarkPurple = const Color.fromARGB(0xFF, 0x57, 0x4b, 0xa8);
Color konfioLightPurple = const Color.fromARGB(0xFF, 0xB4, 0xC5, 0xF1);
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
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Gastos',
      style: optionStyle,
    ),
    Text(
      'Index 1: Facturación',
      style: optionStyle,
    ),
    Text(
      'Index 2: Ventas',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Asesor Financiero'),
//        backgroundColor: konfioPurple,
//      ),
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
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  shadowColor: Color(0x802196F3),
                  child: ListView(
                    children: [
                      Text(
                        'Facturas de gastos más altos del periodo',
                        style: TextStyle(color: konfioPurple),
                        textScaleFactor: 2,
                      ),
                      Table(
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
                  ]
                )
                  )
                )
              ],
              staggeredTiles: [
                StaggeredTile.extent(1, 200),
                StaggeredTile.extent(1, 250),
                StaggeredTile.extent(1, 250),
                StaggeredTile.extent(1, 300)
              ],
            )
        );
        break;

      case 1: // Facturacion
        return Stack(
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Card(
                    child: Column(

                    ),
                  )
                ],
              ),
            )
          ],
        );
        break;

      case 2: // Ventas
        return Stack(
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Card(
                    child: Column(

                    ),
                  )
                ],
              ),
            )
          ],
        );
        break;
        
      default: 
        return Container(
            child: Text('Error!')
        );
    }
  }
}