import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
    runApp(MaterialApp(home: first(),));

}
class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  String code="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true, // optional. Shows phone code before the country name.
                onSelect: (Country country) {
                    t2.text=country.countryCode;
                  print('Select country: ${country.displayName}');
                },
              );
            },
            controller: t2,
          ),
          TextField(
            controller: t3,
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true, // optional. Shows phone code before the country name.
                onSelect: (Country country) {
                  t3.text=country.countryCode;
                  print('Select country: ${country.displayName}');
                },
              );
            },
          ),
          ElevatedButton(onPressed: () async {


            String amount=t1.text;
            String from=t2.text;
            String to=t3.text;



            var url = Uri.parse('https://gautamflutter.000webhostapp.com/currency.php');
            var response = await http.post(url, body: {'amount': '${amount}', 'from': '${from}','to': '${to}',});
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');
            Map m=jsonDecode(response.body);
            print(m);
          }, child: Text("Submit"))
        ],
      ),
    );
  }
}
