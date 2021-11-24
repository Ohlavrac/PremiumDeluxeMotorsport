import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:premiun_deluxe_motorsport/models/vehicles.dart';
=======
import 'package:premiun_deluxe_motorsport/models/vehicle.dart';
import 'package:premiun_deluxe_motorsport/shared/repositories/vehicle_repository.dart';
>>>>>>> dd3d5696c47989f64eea95695d11fa96138551a6
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';

class VehiclesListPage extends StatefulWidget {
  const VehiclesListPage({Key? key}) : super(key: key);

  @override
  _VehiclesListPageState createState() => _VehiclesListPageState();
}

class _VehiclesListPageState extends State<VehiclesListPage> {
  String name = "";

<<<<<<< HEAD
  final Stream<QuerySnapshot> vehiclesDB = FirebaseFirestore.instance.collection('vehicles').snapshots();
=======
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
>>>>>>> dd3d5696c47989f64eea95695d11fa96138551a6

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.menuButtom,
        title: Image.asset('images/logo.png'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/add_vehicle");
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
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
              child: Container(
                height: 300,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: StreamBuilder<QuerySnapshot>(
                  stream: (name != "" && name != null)
                  ? FirebaseFirestore.instance
                    .collection('vehicles')
                    .where("name", isGreaterThanOrEqualTo: name)
                    .snapshots()
                  : vehiclesDB,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Tem Algo errado");
                    }
                  
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Carregando");
                    }
                  
                    final data = snapshot.requireData;
                  
                    return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Container(
                                width: 360,
                                height: 170,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data.docs[index]['image'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
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
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.docs[index]['name'],
                                            style: TextStyles.titleComprovante
                                          ),
                                          Text(
                                            "${data.docs[index]['price'].toString()} U\$",
                                            style: TextStyles.titleComprovante
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
