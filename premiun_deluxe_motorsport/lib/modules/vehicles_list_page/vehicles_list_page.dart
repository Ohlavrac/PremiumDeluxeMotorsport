import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/models/vehicle.dart';
import 'package:premiun_deluxe_motorsport/services/gta_api.dart';
import 'package:premiun_deluxe_motorsport/shared/repositories/vehicle_repository.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/input_widget.dart';

class VehiclesListPage extends StatefulWidget {
  const VehiclesListPage({ Key? key }) : super(key: key);

  @override
  _VehiclesListPageState createState() => _VehiclesListPageState();
}

class _VehiclesListPageState extends State<VehiclesListPage> {
  final list_vehicles = VehicleRepository.list_vehicles;
  List<Vehicle> _search_vehicle = [];

  void _runSearch(String value) {
    List<Vehicle> results = [];

    if (value.isEmpty) {
      results = list_vehicles;
    } else {
      results = list_vehicles.where((vehicle) => vehicle.name.contains(value)).toList();
    }

    setState(() {
      _search_vehicle = results;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _search_vehicle = list_vehicles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.menu_buttom,
        title: Image.asset('images/logo.png'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                onChanged: (value) {
                  _runSearch(value);
                },
                decoration: InputDecoration(
                  label: Text(
                    "Procurar",
                    style: TextStyles.title_input,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  suffix: Icon(Icons.search, color: AppColors.secondary,),
                ),
                style: TextStyles.title_input,
              ),
            ),
            Expanded(
              child: _search_vehicle.isNotEmpty 
              ? ListView.builder(
                itemBuilder: (BuildContext context, int vehicle) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 360,
                          height: 170,
                          decoration: BoxDecoration(color: AppColors.menu_buttom, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), 
                            image: DecorationImage(
                              image: NetworkImage(_search_vehicle[vehicle].image),
                              fit: BoxFit.cover
                            ),
                          ), 
                        ),
                        Container(
                          width: 360,
                          height: 75,
                          
                          decoration: BoxDecoration(
                            color: AppColors.menu_buttom,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      //list_vehicles[vehicle].name,
                                      _search_vehicle[vehicle].name,
                                      style: TextStyles.title_comprovante,
                                    ),
                                    Text(
                                      "${_search_vehicle[vehicle].capacity.toString()} Kg",
                                      style: TextStyles.title_comprovante,
                                    ),
                                    
                                  ],
                                ),
                                Text(
                                  "${_search_vehicle[vehicle].price.toString()} \$",
                                  style: TextStyles.title_comprovante,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                //separatorBuilder: (_, ____) => Divider(),
                itemCount: _search_vehicle.length
              )
              : Text(
                "Carro não encontrado",
                style: TextStyles.title_input
              )
            ),
          ],
        ),
      )
    );

  }
}