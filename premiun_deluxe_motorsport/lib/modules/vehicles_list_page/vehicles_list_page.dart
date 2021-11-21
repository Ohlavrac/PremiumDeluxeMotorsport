import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/models/vehicle.dart';
import 'package:premiun_deluxe_motorsport/shared/repositories/vehicle_repository.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/input_widget.dart';

class VehiclesListPage extends StatefulWidget {
  const VehiclesListPage({Key? key}) : super(key: key);

  @override
  _VehiclesListPageState createState() => _VehiclesListPageState();
}

class _VehiclesListPageState extends State<VehiclesListPage> {
  final listVehicles = VehicleRepository.listVehicles;
  List<Vehicle> searchVehicle = [];

  void _runSearch(String value) {
    List<Vehicle> results = [];
    // TODO: Criar uma forma de ordenar por nome/preço/porta-malas etc.

    if (value.isEmpty) {
      results = listVehicles;
    } else {
      results = listVehicles
          .where((vehicle) =>
              vehicle.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }

    setState(() {
      searchVehicle = results;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    searchVehicle = listVehicles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.menuButtom,
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
                      style: TextStyles.titleInput,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white)),
                    suffix: const Icon(
                      Icons.search,
                      color: AppColors.secondary,
                    ),
                  ),
                  style: TextStyles.titleInput,
                ),
              ),
              Expanded(
                  child: searchVehicle.isNotEmpty
                      ? ListView.builder(
                          itemBuilder: (BuildContext context, int vehicle) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    width: 360,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: AppColors.menuButtom,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              searchVehicle[vehicle].image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    width: 360,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                      color: AppColors.menuButtom,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                //list_vehicles[vehicle].name,
                                                searchVehicle[vehicle].name,
                                                style:
                                                    TextStyles.titleComprovante,
                                              ),
                                              Text(
                                                "${searchVehicle[vehicle].capacity.toString()} Kg",
                                                style:
                                                    TextStyles.titleComprovante,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${searchVehicle[vehicle].price.toString()} \$",
                                            style: TextStyles.titleComprovante,
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
                          itemCount: searchVehicle.length)
                      : Text("Carro não encontrado",
                          style: TextStyles.titleInput)),
            ],
          ),
        ));
  }
}
