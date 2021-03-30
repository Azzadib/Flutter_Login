import 'package:flutter/material.dart';
import 'model/vehicle.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main_screen';
  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.lightBlue,
        title: Text('Welcome $name'),
      ),
      backgroundColor: Colors.red,
      body: FutureBuilder<String>(
        future:
        DefaultAssetBundle.of(context).loadString('assets/vehicle.json'),
        builder: (context, snapshot) {
          final List<Vehicle> vehicles = parseVehicles(snapshot.data);
          return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              return _buildVehicleItem(context, vehicles[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildVehicleItem(BuildContext context, Vehicle vehicle) {
    return Card(
      elevation: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                vehicle.urlToImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    vehicle.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Tipe: ${vehicle.type}'),
                  Text('Fitur: ${vehicle.equipment}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}