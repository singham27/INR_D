import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Controllers/BuySellController.dart';
import '../Views/OrderPreview.dart';


class BuySell extends StatelessWidget {
  BuySell({Key? key}) : super(key: key);

  final controller = Get.put(BuySellController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageStyle.bgBuySell))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarStyle(
          overlayStyle: SystemUiOverlayStyle.light,
          title: 'Buy and Sell',
          titleColor: Colors.white,
          leading: BackButton(),
        ),
        body: GetBuilder(
          init: BuySellController(),
          initState: (state) {
            controller.reset();
          },
          builder: (auth) {
            return Obx(()=>Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 56,
                  padding: EdgeInsets.only(
                      left: 40,
                      right: 40
                  ),
                  child: Row(
                    children: [
                      Expanded(child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorStyle.primaryColor,
                              border: controller.isBuy.value ? Border(
                                top: BorderSide(
                                    color: Colors.white,
                                    width: 1
                                ),
                                left: BorderSide(
                                    color: Colors.white,
                                    width: 1
                                ),
                                right: BorderSide(
                                    color: Colors.white,
                                    width: 1
                                ),
                                bottom: BorderSide(
                                    color: Colors.white,
                                    width: 1
                                ),
                              ) : Border(),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )
                          ),
                          child: Text('Buy',
                              style: TextStylesProductSans.textStyles_20
                                  .apply(color: Colors.white, fontWeightDelta: 0)),
                        ),
                        onTap: () {
                          controller.isBuy.value = true;
                        },
                      )),
                      SizedBox(width: 10,),
                      Expanded(child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorStyle.primaryColor,
                              border: !controller.isBuy.value ? Border(
                                top: BorderSide(
                                    color: Colors.white,
                                    width: 1
                                ),
                                left: BorderSide(
                                    color: Colors.white,
                                    width: 1
                                ),
                                right: BorderSide(
                                    color: Colors.white,
                                    width: 1
                                ),
                                bottom: BorderSide(
                                    color: Colors.white,
                                    width: 1
                                ),
                              ) : Border(),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )
                          ),
                          child: Text('Sell',
                              style: TextStylesProductSans.textStyles_20
                                  .apply(color: Colors.white, fontWeightDelta: 0)),
                        ),
                        onTap: () {
                          controller.isBuy.value = false;
                        },
                      )),
                      SizedBox(width: 10,),
                      Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text('Rate:',
                            style: TextStylesProductSans.textStyles_20
                                .apply(color: Colors.white, fontWeightDelta: 0)),
                      )),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            left: 30,
                            right: 30
                        ),
                        decoration: BoxDecoration(
                            color: ColorStyle.hex('#003E7A'),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 16,),
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                  bottom: 16
                              ),
                              decoration: BoxDecoration(
                                  color: ColorStyle.hex('#003A70').withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          ImageStyle.logoTransparent,
                                          height: 36,
                                        ),
                                        Text(
                                            "INR(D)",
                                            style: TextStylesProductSans.textStyles_15
                                                .apply(color: Colors.white, fontWeightDelta: 0)),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "0.00",
                                          style: TextStylesProductSans.textStyles_16
                                              .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
                                      Text(
                                          "Bal: "+'0',
                                          style: TextStylesProductSans.textStyles_16
                                              .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 16,),
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 30,
                                  bottom: 16
                              ),
                              decoration: BoxDecoration(
                                  color: ColorStyle.hex('#003A70').withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 156,
                                    padding: EdgeInsets.only(
                                      left: 12,
                                      right: 12,
                                      top: 6,
                                      bottom: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                            "Select Currency",
                                            style: TextStylesProductSans.textStyles_14
                                                .apply(color: Colors.white, fontWeightDelta: 0)),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "0.00",
                                          style: TextStylesProductSans.textStyles_16
                                              .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
                                      Text(
                                          "Bal: "+'0',
                                          style: TextStylesProductSans.textStyles_16
                                              .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16,),
                          ],
                        )
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: ColorStyle.primaryColor,
                              borderRadius: BorderRadius.circular(60)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageStyle.exchange,
                                height: 26,
                                width: 26,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                TextButtonCustom(
                  text: 'PREVIEW BUY',
                  colorBG: ColorStyle.primaryColor,
                  width: MediaQuery.of(context).size.width-60,
                  textStyle: TextStylesProductSans.textStyles_16.apply(
                    color: Colors.white
                  ),
                  onTap: () {
                    Get.to(OrderPreview());
                  },
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}