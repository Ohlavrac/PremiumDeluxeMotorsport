import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.menu_buttom,
        title: Image.asset('images/logo.png'),
        centerTitle: true,
      ),
      /*body: ListView.separated(
        itemBuilder: (BuildContext context, int vehicle) {
          return Container(
            width: 395,
            height: 60,
            decoration: BoxDecoration(color: AppColors.menu_buttom, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(list_vehicles[vehicle].image),             
                ),
              ),
              title: Text(list_vehicles[vehicle].name.toString()),
              subtitle: Text(list_vehicles[vehicle].price.toString()),
            ),
          );
        },
        separatorBuilder: (_, ____) => Divider(),
        itemCount: list_vehicles.length,
      )*/
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int vehicle) {
            return Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Column(
                children: [          
                  Container(
                    width: 360,
                    height: 170,
                    decoration: BoxDecoration(color: AppColors.menu_buttom, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), 
                      image: DecorationImage(
                        image: NetworkImage(list_vehicles[vehicle].image),
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
                                list_vehicles[vehicle].name,
                                style: TextStyles.title_comprovante,
                              ),
                              Text(
                                "${list_vehicles[vehicle].capacity.toString()} Kg",
                                style: TextStyles.title_comprovante,
                              ),
                              
                            ],
                          ),
                          Text(
                            "${list_vehicles[vehicle].price.toString()} \$",
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
          separatorBuilder: (_, ____) => Divider(),
          itemCount: list_vehicles.length
        ),
      )
    );

  }
}