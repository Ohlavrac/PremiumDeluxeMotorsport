import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/models/comprando.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/large_button.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/text_proof_purchase.dart';

class ProofPurchasePage extends StatelessWidget {
  Comprando comprandov;
  DateTime now = DateTime.now();

  ProofPurchasePage({ Key? key, required this.comprandov }) : super(key: key);

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
        padding: const EdgeInsets.all(10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Comprovante",
                style: TextStyles.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 120),
              child: Container(
                height: 350,
                width: 385,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  color: AppColors.menuButtom,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TextProofPurchase(label: "Comprador: ${comprandov.buyer}"),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: TextProofPurchase(label: "Passaporte: ${comprandov.passport}"),
                        ),
                        TextProofPurchase(label: "Veículo: ${comprandov.vehicle}"),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: TextProofPurchase(label: "Valor pago: "),
                        ),
                        TextProofPurchase(label: "Desconto aplicado: ${comprandov.discount}"),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: TextProofPurchase(label: "Dia e hora: ${now}"),
                        ),
                        TextProofPurchase(label: "Vendedor: ${comprandov.salesman}"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            LargeButon(label: "Salvar e Sair", onPressed: () {

            })
          ],
        ),
      ),
    );
  }
}