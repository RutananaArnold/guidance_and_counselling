import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/components/AppTittle.dart';
//import 'package:guidance_and_counselling/components/RoundedButton.dart';
import 'package:guidance_and_counselling/components/TabLabel.dart';
import 'package:guidance_and_counselling/screens/ChatScreen.dart';
import 'package:guidance_and_counselling/components/RoundedInputField.dart';
//import 'package:flutterwave/flutterwave.dart';

class Categoryscreen extends StatefulWidget {
  @override
  _CategoryscreenState createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  // final narrationController = TextEditingController();
  // final publicKeyController = TextEditingController();
  // final encryptionKeyController = TextEditingController();
  // final currencyController = TextEditingController();
  // String selectedCurrency = "";

  TextEditingController bookDate = new TextEditingController(),
      bookTime = new TextEditingController();
  int selectedRadio, price;
  String _hour, _minute, _time;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int serviceCheckedId = 0;
  var selectedSalonService;

  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 20))))) {
      return true;
    }
    return false;
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      selectableDayPredicate: _decideWhichDayToEnable,
      helpText: 'CHOOSE APPOINTMENT DATE',
      cancelText: 'NOT NOW',
      confirmText: 'SET',
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        bookDate.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      helpText: 'CHOOSE APPOINTMENT TIME',
      cancelText: 'NOT NOW',
      confirmText: 'SET',
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString().length == 1
            ? '0' + selectedTime.hour.toString()
            : selectedTime.hour.toString();

        _minute = selectedTime.minute.toString().length == 1
            ? '0' + selectedTime.minute.toString()
            : selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        bookTime.text = _time;
      });
  }

  // void _handlePaymentInitialization() async {
  //   final flutterwave = Flutterwave.forUIPayment(
  //       amount: "50000",
  //       currency: this.currencyController.text,
  //       context: this.context,
  //       publicKey: this.publicKeyController.text.trim(),
  //       encryptionKey: this.encryptionKeyController.text.trim(),
  //       email: "arnoldrutanana@gmail.com",
  //       fullName: "Test User",
  //       txRef: DateTime.now().toIso8601String(),
  //       narration: "Example Project",
  //       isDebugMode: false,
  //       phoneNumber: "0770438052",
  //       acceptUgandaPayment: true,
  //       acceptCardPayment: true,
  //       acceptUSSDPayment: true);
  //   final response = await flutterwave.initializeForUiPayments();
  //   if (response != null) {
  //     this.showLoading(response.data.status);
  //   } else {
  //     this.showLoading("No Response!");
  //   }
  // }

  // Future<void> showLoading(String message) {
  //   return showDialog(
  //     context: this.context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: Container(
  //           margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
  //           width: double.infinity,
  //           height: 50,
  //           child: Text(message),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _getCurrency() {
  //   final currencies = [
  //     FlutterwaveCurrency.UGX,
  //     FlutterwaveCurrency.GHS,
  //     FlutterwaveCurrency.NGN,
  //     FlutterwaveCurrency.RWF,
  //     FlutterwaveCurrency.KES,
  //     FlutterwaveCurrency.XAF,
  //     FlutterwaveCurrency.XOF,
  //     FlutterwaveCurrency.ZMW
  //   ];
  //   return Container(
  //     height: 250,
  //     margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
  //     color: Colors.white,
  //     child: ListView(
  //       children: currencies
  //           .map((currency) => ListTile(
  //                 onTap: () => {this._handleCurrencyTap(currency)},
  //                 title: Column(
  //                   children: [
  //                     Text(
  //                       currency,
  //                       textAlign: TextAlign.start,
  //                       style: TextStyle(color: Colors.black),
  //                     ),
  //                     SizedBox(height: 4),
  //                     Divider(height: 1)
  //                   ],
  //                 ),
  //               ))
  //           .toList(),
  //     ),
  //   );
  // }

  // void _openBottomSheet() {
  //   showModalBottomSheet(
  //       context: this.context,
  //       builder: (context) {
  //         return this._getCurrency();
  //       });
  // }

  // _handleCurrencyTap(String currency) {
  //   this.setState(() {
  //     this.selectedCurrency = currency;
  //     this.currencyController.text = currency;
  //   });
  //   Navigator.pop(this.context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 15.0,
          ),
          TabLabel(
            label: 'Choose a category',
            color: Colors.orange,
            align: Alignment.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.bottomRight,
                  onPressed: () {},
                  icon: Icon(
                    Icons.star_border,
                    size: 50.0,
                  ),
                  color: Colors.red[500],
                ),
              ),
              SizedBox(
                width: 200,
                child: Container(
                  child: Text(
                    "STUDENT",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          RoundedInputField(
            hintText: "Enter student number",
            keyboard: TextInputType.number,
            icon: Icons.mail_outline,
            fcolor: Colors.grey[400],
            onChanged: (value) {},
            validate: (value) {},
          ),
          SizedBox(
            height: 15.0,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ChatScreen(),
                    ),
                    (Route<dynamic> route) => true);
              },
              child: Text("VALIDATOR")),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.bottomRight,
                  onPressed: () {},
                  icon: Icon(
                    Icons.star_border,
                    size: 50.0,
                  ),
                  color: Colors.red[500],
                ),
              ),
              SizedBox(
                width: 200,
                child: Container(
                  child: Text(
                    "Non-Student",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            width: 400,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Schdule Appointment",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          inputAreas(),
          SizedBox(height: 10.0),
          ElevatedButton(onPressed: () {}, child: Text("MAKE BOOKING")),
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[400],
            ),
            child: Text(
              "Counselling Services Fee : UGX 50,000",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Method of Payment",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10.0),
          // Container(
          //   margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
          //   child: TextFormField(
          //     controller: this.currencyController,
          //     textInputAction: TextInputAction.next,
          //     style: TextStyle(color: Colors.black),
          //     readOnly: true,
          //     onTap: this._openBottomSheet,
          //     decoration: InputDecoration(
          //       hintText: "Currency",
          //     ),
          //     validator: (value) =>
          //         value.isNotEmpty ? null : "Currency is required",
          //   ),
          // ),
          ElevatedButton(
              onPressed: () {
                //   _handlePaymentInitialization();
              },
              child: Text("Initiate Payment")),
        ]),
      ),
    );
  }

  // UI COMPONENTS
  inputAreas() {
    return Column(
      //  key: this.formKey,
      children: [
        RoundedInputField(
          hintText: "Booking Date",
          x: true,
          icon: Icons.calendar_today_outlined,
          tap: () {
            _selectDate(context);
          },
          field: bookDate,
        ),
        RoundedInputField(
          hintText: "Booking Time",
          x: true,
          icon: Icons.timelapse_outlined,
          tap: () {
            _selectTime(context);
          },
          field: bookTime,
        ),
      ],
    );
  }
}
