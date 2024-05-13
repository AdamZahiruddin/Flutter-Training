import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_widget_app/widget/alertBox.dart';

class AmountPage extends StatefulWidget {
  const AmountPage({super.key});

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
TextEditingController amountController = TextEditingController();
  void textFormat(String? value) async{
    await Future.delayed(Duration(milliseconds: 1));
    if(value == null || value == ""){
      setState(() {
        amountController.text = "RM 0.00";
      });
      return;
    }
    String newValue = value.replaceAll(RegExp(r'[^0-9]'), "");
     if (newValue.length >= 2) {
       newValue =
           '${newValue.substring(0, newValue.length - 2)}.${newValue.substring(newValue.length - 2)}';
     } else {
       newValue = '0.${newValue.padLeft(2, '0')}';
     }

     if (newValue.startsWith('.')) {
      newValue = '0${newValue.padLeft(2, '0')}';
     }
     newValue = newValue.replaceFirst(RegExp('^0+(?!\\.)'), '');
     newValue = 'RM $newValue';

      setState(() {
         amountController.text = newValue;
      });

    //complete the following function, the format must be "RM x.xx", for example "RM 123.34"
    //the new value should push to the current value (can refer tng ewallet)
    // u can use keyboardType: TextInputType.number, to restrict the user input
    return;
  }

  

//the function that will validate your input, dont change it
  bool formatValidation(String value){
    if(!value.startsWith('RM ')){
      return false;
    }else if(value.length - value.lastIndexOf('.') !=3){
      final num =value.lastIndexOf('.');
      return false;
    }
     String testValue = value.replaceFirst("RM", "");
     testValue = testValue.replaceFirst(".", "");
     testValue = testValue.replaceAll(" ", "");
     if(int.tryParse(testValue) == null){
      return false;
     }

    return true;



  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
     
      body: SingleChildScrollView(
        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Text("Please Filled in the amount"),
              SizedBox(height: 50,),
              Container(
              width: 300,
              child:  TextField(
                keyboardType: TextInputType.number,
                controller: amountController,
                onChanged: textFormat,
                
              ),
              ),
             
              SizedBox(height: 20,),
              FilledButton(onPressed: (){
                final result = formatValidation(amountController.text);
                if(result){
                  displayAlert(context, "Congratulation", "You pass the test");
                }else{
                   displayAlert(context, "Sorry", "You fail the test");
                }
              }, child: Text("Validate Result"))
            ],
          ),
        ),
      ),
    );
  }
}