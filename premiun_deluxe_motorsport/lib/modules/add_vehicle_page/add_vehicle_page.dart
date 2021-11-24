import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/models/vehicle.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/input_number_widget.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/input_widget.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/large_button.dart';

class AddVehiclePage extends StatelessWidget {
  AddVehiclePage({ Key? key }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  String name_vehicle = "";
  String? url_image;
  int? price_vehicle;
  String? type;
  int? capacity;
  int? topspeed;
  int? seats;

  createSearchParam(String name_vehicle) {
    List<String> searchList = [];
    String aux = "";
    int count;

    for (count = 0; count < name_vehicle.length; count++) {
      aux = aux + name_vehicle[count];
      searchList.add(aux);
    }
    return searchList;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference vehicleDb = FirebaseFirestore.instance.collection('vehicles');

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.menuButtom,
        title: Image.asset('images/logo.png'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Adicionando Carro",
                    style: TextStyles.title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: InputWidget(
                    label: "Nome",
                    onChanged: (value) {
                      name_vehicle = value;
                    }
                  ),
                ),
          
                InputNumberWidget(
                  label: "Preço",
                  onChanged: (value) {
                    price_vehicle = int.parse(value);
                  }
                ),
          
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: InputWidget(
                    label: "Url Imagem",
                    onChanged: (value) {
                      url_image = value;
                    }
                  ),
                ),
          
                InputNumberWidget(
                  label: "Capacidade (KG)",
                  onChanged: (value) {
                    capacity = int.parse(value);
                  }
                ),
          
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: InputNumberWidget(
                    label: "Assentos",
                    onChanged: (value) {
                      seats = int.parse(value);
                    }
                  ),
                ),
          
                InputNumberWidget(
                  label: "Top Speed",
                  onChanged: (value) {
                    topspeed = int.parse(value);
                  }
                ),
          
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 60),
                  child: InputWidget(
                    label: "Categoria",
                    onChanged: (value) {
                      type = value;
                    }
                  ),
                ),
                LargeButon(
                  label: "Salvar e Sair", onPressed: () {
                    if (name_vehicle == null || name_vehicle == "" || price_vehicle == null || url_image == null || capacity == null || topspeed == null || seats == null || type == null) {
                      print("ERRO");
                    }
                    else if (_formKey.currentState!.validate())   {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Veiculo salvo no banco de dados")),
                      );

                      vehicleDb
                        .add({'name': name_vehicle, 'price' : price_vehicle, 'image' : url_image, 'seats' : seats, 'topspeed' : topspeed, 'type' : type, 'capacity' : capacity, "name_search" : createSearchParam(name_vehicle)})
                        .then((value) => print("Veiculo Adicionado"));

                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}