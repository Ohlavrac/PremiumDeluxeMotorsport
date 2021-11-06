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
  const PurchasePage({ Key? key }) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {

  @override
  Widget build(BuildContext context) {
    Comprando comprador = Comprando();

    showProofPurchasePage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProofPurchasePage(comprandov: comprador)),
      );
    }
    

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.menu_buttom,
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
                style: TextStyles.title_sec,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: InputWidget(label: "Comprador", onChanged: (value_buyer) {
                    print(value_buyer);
                    comprador.buyer = value_buyer;
                  },
                  
                ),
              ),
              InputNumberWidget(label: "Passaporte", onChanged: (value_passport) {
                  print(value_passport);
                  comprador.passport = int.parse(value_passport);
                },
                
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: InputWidget(label: "Veiculo", onChanged: (value_vehicle) {
                    print(value_vehicle);
                    comprador.vehicle = value_vehicle;
                  },
                  
                ),
              ),
              InputNumberWidget(label: "Desconto", onChanged: (value_discount) {
                  print(value_discount);
                  comprador.discount = int.parse(value_discount);
                },
                
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 60),
                child: InputWidget(label: "Vendedor", onChanged: (value_salesman) {
                    print(value_salesman);
                    comprador.salesman = value_salesman;
                   
                  },
                  
                ),
              ),    

              LargeButon(label: "Finalizar Compra", onPressed: () {
                if (comprador.buyer == null || comprador.discount == null || comprador.passport == null || comprador.salesman == null || comprador.vehicle == null) {
                  //por um alerta
                } else {
                  showProofPurchasePage();
                }          
              },),
            ],
          ),
        ),
      ),
    );
  }
}