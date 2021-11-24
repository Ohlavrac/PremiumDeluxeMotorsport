import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/models/comprando.dart';
import 'package:premiun_deluxe_motorsport/models/vehicle.dart';
import 'package:premiun_deluxe_motorsport/modules/proof_purchase/proof_purchase_page.dart';
import 'package:premiun_deluxe_motorsport/shared/repositories/vehicle_repository.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/input_number_widget.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/input_widget.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/large_button.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

final listVehicles = VehicleRepository.listVehicles;

class _PurchasePageState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    Comprando comprador = Comprando();

    showProofPurchasePage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ProofPurchasePage(comprandov: comprador)),
      );
    }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Comprando",
                  style: TextStyles.title,
                ),
              ),
              Text(
                "Falta pouco para pegar seu carro novo",
                style: TextStyles.titleSec,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: InputWidget(
                  label: "Comprador",
                  onChanged: (valueBuyer) {
                    comprador.buyer = valueBuyer;
                  },
                ),
              ),
              InputNumberWidget(
                label: "Passaporte",
                onChanged: (valuePassport) {
                  comprador.passport = int.parse(valuePassport);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: InputWidget(
                    label: "Veiculo",
                    onChanged: (valueVehicle) {
                      // Recomendo deixar os prints ai enquanto o alerta não estiver concluído.
                      print('input=> $valueVehicle');
                      var vehicleInfos = listVehicles.where((vehicle) => vehicle
                          .name
                          .toLowerCase()
                          .contains(valueVehicle.toLowerCase()));
                      var numberVehicle = listVehicles.indexWhere((i) => i.name.toLowerCase() == valueVehicle.toLowerCase());
                      print('numberVehicle=> $numberVehicle');
                      var nameVehicle = listVehicles[numberVehicle].name;
                      print('nomeNaLista=> $nameVehicle');
                      if (vehicleInfos.isEmpty) {
                        // TODO: Criar alerta sobre veículo inexistente.
                        print('$vehicleInfos não está registrado.');
                      } else {
                        comprador.vehicle = valueVehicle;
                      }
                    }),
              ),
              InputNumberWidget(
                label: "Desconto",
                onChanged: (valueDiscount) {
                  if (int.parse(valueDiscount) >= 100) {
                    // TODO: Dar um alerta quando o desconto for maior que 100%.
                  } else {
                    comprador.discount = int.parse(valueDiscount);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 60),
                child: InputWidget(
                  label: "Vendedor",
                  onChanged: (valueSalesman) {
                    comprador.salesman = valueSalesman;
                  },
                ),
              ),
              LargeButon(
                label: "Finalizar Compra",
                onPressed: () {
                  if (comprador.buyer == null ||
                      comprador.discount == null ||
                      comprador.passport == null ||
                      comprador.salesman == null ||
                      comprador.vehicle == null) {
                    // TODO: Adicionar um alerta para avisar que existem espaços em brancos.
                  } else {
                    showProofPurchasePage();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
