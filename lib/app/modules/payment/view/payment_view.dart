import 'package:alonecall/app/modules/payment/controller/payment_controller.dart';
import 'package:alonecall/app/theme/theme.dart';
import 'package:alonecall/app/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<PaymentController>(
    builder:(_con) => SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            StringConstants.addBank,
            style: Styles.boldWhite20,
          ),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SizedBox(
          height: Dimens.screenHeight ,
          width: Dimens.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Dimens.twelve,),
              Container(
                margin: EdgeInsets.symmetric(horizontal:Dimens.twenty,vertical: Dimens.five),
                padding: EdgeInsets.symmetric(horizontal:Dimens.twenty,),
                height: Dimens.fifty,
                width: Dimens.screenWidth,
                decoration: BoxDecoration(
                    color: ColorsValue.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: TextField(
                    onChanged: (value)=>_con.addBankModel.accountNumber = value,
                    style: Styles.black18,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: ' Account number',
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal:Dimens.twenty,vertical: Dimens.five),
                padding: EdgeInsets.symmetric(horizontal:Dimens.twenty,),
                height: Dimens.fifty,
                width: Dimens.screenWidth,
                decoration: BoxDecoration(
                    color: ColorsValue.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: TextField(
                    controller: _con.amountEdit,
                    style: Styles.black18,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: ' Confirm account number',
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal:Dimens.twenty,vertical: Dimens.five),
                padding: EdgeInsets.symmetric(horizontal:Dimens.twenty,),
                height: Dimens.fifty,
                width: Dimens.screenWidth,
                decoration: BoxDecoration(
                    color: ColorsValue.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: TextField(
                    onChanged: (value)=>_con.addBankModel.ifsc = value,
                    style: Styles.black18,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        hintText: ' IFSC',
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal:Dimens.twenty,vertical: Dimens.five),
                padding: EdgeInsets.symmetric(horizontal:Dimens.twenty,),
                height: Dimens.fifty,
                width: Dimens.screenWidth,
                decoration: BoxDecoration(
                    color: ColorsValue.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: TextField(
                    onChanged: (value)=>_con.addBankModel.name = value,
                    style: Styles.black18,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        hintText: ' Account holder name',
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal:Dimens.twenty,vertical: Dimens.five),
                padding: EdgeInsets.symmetric(horizontal:Dimens.twenty,),
                height: Dimens.fifty,
                width: Dimens.screenWidth,
                decoration: BoxDecoration(
                    color: ColorsValue.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: TextField(
                    onChanged: (value)=>_con.addBankModel.number = value,
                    style: Styles.black18,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: ' Phone number (optional)',
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal:Dimens.twenty,vertical: Dimens.five),
                padding: EdgeInsets.symmetric(horizontal:Dimens.twenty,),
                height: Dimens.fifty,
                width: Dimens.screenWidth,
                decoration: BoxDecoration(
                    color: ColorsValue.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: TextField(
                    onChanged: (value)=>_con.addBankModel.nickName = value,
                    style: Styles.black18,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        hintText: ' Nickname (optional)',
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimens.fifty,),
              const Spacer(),
              InkWell(
                onTap: (){
                  _con.onClickAdd();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal:Dimens.twenty,vertical: Dimens.five),
                  height: Dimens.fifty,
                  width: Dimens.screenWidth,
                  decoration: BoxDecoration(
                      color: ColorsValue.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text('ADD',style: Styles.black18,)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
