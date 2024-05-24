
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

main() {
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: widgetList(),
      
    );
  }
}

class widgetList extends StatelessWidget {
   widgetList({super.key});
final controller = Get.put<widgetcontroller>(widgetcontroller());
  @override
  Widget build(BuildContext context) {
    
    return Obx(()=>Scaffold(
      backgroundColor: controller.radiogroup.value==0 ? Colors.red : Colors.blue,
      appBar: AppBar(title: Text("list of widgets"),),
      body: 
         SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Container(
                  height: 200,
                  width: double.infinity,
                  child:Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Radio<int>(value: 0, groupValue: controller.radiogroup.value, onChanged: ( value1){
                        controller.updateradio(value1);
                      }),
                       Radio<int>(value: 1, groupValue: controller.radiogroup.value, onChanged: ( value1){
                        controller.updateradio(value1);
                      })
                    ],
                  )
                
                 ,),
                 SizedBox(height: 40,),
              Container(
                  height: 200,
                  width: double.infinity,
                  child:Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Checkbox(
                        value: controller.checkboxgroup.value, onChanged: (value){
                        controller.updatecheck(value);
                      }),
                      Checkbox(value: controller.checkboxgroup2.value, onChanged: (value){
                        controller.updatecheck2(value);
                      }),
                      Checkbox(value: controller.checkboxgroup3.value, onChanged: (value){
                        controller.updatecheck3(value);
                      })
                    ],
                  )
                
                 ,),
          SizedBox(height: 40,),
                 Container(
                  height: 200,
                  width: double.infinity,
                  child:Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Switch(value: controller.switchgroup.value, onChanged: (value){
                        controller.updateswitch(value);
                      })
                    ],
                  )
                
                 ,),
                 SizedBox(height: 40,),
                    Container(
                  height: 200,
                  width: double.infinity,
                  child:Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Slider(value: controller.slidergroup.value, onChanged: (value){
                        controller.updateslider(value);
                      })
                    ],
                  )
                
                 ,),
                  SizedBox(height: 40,),
                    Container(
                  height: 200,
                  width: double.infinity,
                  child:Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      DropdownButton(
                        value: controller.dropdown.value,
                        items: [DropdownMenuItem(child: Text("vipu"),value: "vipu",),
                      DropdownMenuItem(child: Text("mehul",),value: "ram",),
                      DropdownMenuItem(child: Text("tushar"),value: "tushar",)], onChanged: (value){
          controller.updatedropdown(value);
                      })
                      ,
                      Text(controller.dropdown.value,style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),)
                    ],
                  )
                
                 ,),
                 SizedBox(height: 50,),
          
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}





class widgetcontroller extends GetxController {
  RxInt radiogroup = 0.obs;
  RxBool checkboxgroup = false.obs;
   RxBool checkboxgroup2 = false.obs;
  RxBool checkboxgroup3 = false.obs;
RxBool switchgroup = false.obs;
RxDouble slidergroup = 0.0.obs;
var dropdown = "vipu".obs;

updateradio(int? value){
  radiogroup.value = value ?? 0;
}
updatecheck(bool? value){
  checkboxgroup.value = value ?? false;
}
 updatecheck2(bool? value) {
    checkboxgroup2.value = value ?? false;
  }

  updatecheck3(bool? value) {
    checkboxgroup3.value = value ?? false;
  }
updateswitch(bool ? value){
  switchgroup.value = value ?? false;
}
updateslider(double value){
  slidergroup.value = value;
}
updatedropdown(value){
  dropdown.value = value;
}


}