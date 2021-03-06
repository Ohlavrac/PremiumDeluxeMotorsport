import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/modules/purchase_page/purchase_page.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';
import 'package:premiun_deluxe_motorsport/shared/widgets/small_button_main_menu.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.menuButtom,
        title: Image.asset('images/logo.png'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallButtonMainMenu(label: "Comprar", icon: const Icon(Icons.car_rental, color: AppColors.secondary, size: 74,), onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PurchasePage(),
                          )
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: SmallButtonMainMenu(label: "Historico", icon: const Icon(Icons.history, color: AppColors.secondary, size: 74,), onPressed: () {

                        },),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 180,
                    height: 304,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.menuButtom,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),

                      onPressed: () {
                        Navigator.pushNamed(context, "/vehicles_list");
                      },

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.list, color: AppColors.secondary, size: 102),
                          const SizedBox(height: 130,),
                          Text(
                            "Lista de Carros",
                            style: TextStyles.titleSemiBold
                          ),
                        ],              
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                    width: 390,
                    height: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.menuButtom,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),


                      onPressed: () {

                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Calculadora de Desconto",
                            style: TextStyles.titleSemiBold
                          ),
                          const Icon(Icons.calculate, size: 74),
                        ],
                      ),
                    ),
                  )
            ],
          ),
        ),
      )
    );
  }
}
