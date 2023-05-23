import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/reservationScreen/widget/sign_in_dialogue.dart';
import 'package:privilegecare/Ui/signUpScreen/controller/signup_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

class SignUpDialogue extends StatelessWidget {
  const SignUpDialogue({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: GetBuilder(
        init:  SignUpController(),
        builder: (SignUpController controller) => SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,

            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: SizedBox(
                        height: Get.height*0.13,
                        width: Get.width*0.5,
                        child: Image.asset("assets/images/logo.png",fit: BoxFit.fitHeight,),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Enter Your Full Name",
                      style: TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  SizedBox(
                    width: Get.width,

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: Get.height*0.09,
                            width: Get.width*0.95,
                            child: CustomInputField(
                              textAligning: TextAlign.center,
                              hasIntialValue: true,
                              labelText: "First",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,

                              controller:controller.firstNameController,
                              onchange: controller.onFirstNameUpdate,
                              validator: controller.validateFirstName,
                              icon: (controller.firstNameValidated)
                                  ? (controller.firstNameState)
                                  ? const Icon(Icons.check_rounded,
                                  color: kBlueColor)
                                  : const Icon(
                                Icons.close_outlined,
                                color: kErrorColor,
                              )
                                  : null,
                              hasGreenBorder: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: Get.height*0.09,
                            width: Get.width*0.95,
                            child: CustomInputField(
                              textAligning: TextAlign.center,
                              hasIntialValue: true,
                              labelText: "Middle",
                              textInputAction: TextInputAction.next,

                              controller:controller.secondNameController,
                              onchange: controller.onSecondNameUpdate,
                              validator: controller.validateSecondName,
                              icon: (controller.secondNameValidated)
                                  ? (controller.secondNameState)
                                  ? const Icon(Icons.check_rounded,
                                  color: kBlueColor)
                                  : const Icon(
                                Icons.close_outlined,
                                color: kErrorColor,
                              )
                                  : null,
                              hasGreenBorder: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: Get.height*0.09,
                            width: Get.width*0.95,
                            child: CustomInputField(
                              textAligning: TextAlign.center,
                              hasIntialValue: true,
                              labelText: "Last",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,

                              controller:controller.lastNameController,
                              onchange: controller.onLastNameUpdate,
                              validator: controller.validateLastName,
                              icon: (controller.lastNameValidated)
                                  ? (controller.lastNameState)
                                  ? const Icon(Icons.check_rounded,
                                  color: kBlueColor)
                                  : const Icon(
                                Icons.close_outlined,
                                color: kErrorColor,
                              )
                                  : null,
                              hasGreenBorder: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Enter Your Email",
                      style: TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: Get.height*0.09,
                      width: Get.width*0.95,
                      child: CustomInputField(
                        hasIntialValue: true,
                        labelText: "example@example.com",

                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,

                        controller:controller.emailController,
                        onchange: controller.onEmailUpdate,
                        validator: controller.validateEmail,
                        icon: (controller.emailValidated)
                            ? (controller.emailState)
                            ? const Icon(Icons.check_rounded,
                            color: kBlueColor)
                            : const Icon(
                          Icons.close_outlined,
                          color: kErrorColor,
                        )
                            : null,
                        hasGreenBorder: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Enter Your Phone Number",
                      style: TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: Get.height*0.09,
                      width: Get.width*0.95,
                      child: CustomInputField(
                        hasIntialValue: true,
                        labelText: "123-4567-8",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,

                        controller:controller.phoneController,
                        onchange: controller.onPhoneNumberUpdate,
                        validator: controller.validatePhoneNumber,
                        icon: (controller.phoneValidated)
                            ? (controller.phoneState)
                            ? const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Text("   974+    ", style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: fontFamilyName,
                              color: kGrayColor,
                            ),),
                            Icon(Icons.check_rounded,
                                color: kBlueColor),
                            SizedBox(width: 5,),
                          ],
                        )
                            : const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Text("   974+    ", style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: fontFamilyName,
                              color: kGrayColor,
                            ),),
                            Icon(
                              Icons.close_outlined,
                              color: kErrorColor,
                            ),SizedBox(width: 5,),
                          ],
                        )
                            : const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Text("   974+    ", style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: fontFamilyName,
                              color: kGrayColor,
                            ),),
                          ],
                        ),
                        hasGreenBorder: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Enter Your Password",
                      style: TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: Get.height*0.09,
                      width: Get.width*0.95,
                      child: CustomInputField(
                          hasIntialValue: true,
                          labelText:  "**********************",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          hasGreenBorder: false,
                          controller: controller.passwordController,
                          validator: controller.validatePassword,
                          isAutoValidate: true,
                          obsecure: !controller.visiblePsd,
                          icon: IconButton(
                            // Based on passwordVisible state choose the icon
                            icon: Icon(
                              controller.visiblePsd
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kGrayColor,
                            ),
                            onPressed: () {
                              controller.toggleVisiblePsd();
                            },
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Confirm Your Password",
                      style: TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: Get.height*0.09,
                      width: Get.width*0.95,
                      child: CustomInputField(
                          hasIntialValue: true,
                          labelText:  "**********************",

                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          hasGreenBorder: false,

                          controller: controller.reTypePasswordController,
                          validator: controller.validateReTypePassword,
                          isAutoValidate: true,
                          obsecure: !controller.visiblePsd,
                          icon: IconButton(
                            // Based on passwordVisible state choose the icon
                            icon: Icon(
                              controller.visiblePsd
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kGrayColor,
                            ),
                            onPressed: () {
                              controller.toggleVisiblePsd();
                            },
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      if(
                      controller.signingUp){
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.loading,
                        );
                      }else{
                        controller.sendPressedFromDialogue(context);
                      }
                    },
                    child: Center(
                      child: Container(
                        height: 60,
                        width: Get.width*0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:controller.signingUp?kGrayColor:kBlueColor
                        ),
                        child: const Center(
                          child:  Text("Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:   [
                        InkWell(
                          onTap: (){
                            Get.back();
                            showDialog(context: context,
                              builder: (context) =>
                              const LoginDialogue(),
                            );
                          },
                          child: const Text("Sign In",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),),
                        ),
                        const Text("?Already have an account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily:fontFamilyName,
                              color: kGrayColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),),
                        const SizedBox(width: 5,),


                      ],
                    ),
                  ),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}