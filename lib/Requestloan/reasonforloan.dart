import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Providers/Authproviders/Authprovider.dart';
import 'package:softloanapp/Succes&faliurescreen/loanapplysuccess.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';

class Reasonforlaon extends StatefulWidget {
  @override
  _ReasonforlaonState createState() => _ReasonforlaonState();
}

class _ReasonforlaonState extends State<Reasonforlaon> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController loanamountcontroller = TextEditingController();

  bool _isButtonEnabled = false;
  Color bordercolors = Colors.black;

  final List<String> items = [
    'Medical bills',
    'Schools',
    'Rent bill',
    'Travels',
    'Personal need'
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  Softloanauth auth = Get.put(Softloanauth());

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Application form',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          onChanged: _updateButtonState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fill the field below, all are required'),
              SizedBox(
                height: 0.01.sh,
              ),
              Text('Loan Amount'),
              TextFeildWithNoIcon(
                keyboardtype: TextInputType.number,
                textvalidator: (value) {
                  if (value!.isEmpty) {
                    return 'field is required';
                  } else {
                    return null;
                  }
                },
                textEditingController: loanamountcontroller,
                Tittle: 'amount needed',
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Text('Reason for applying for this loan'),
              FormField<String>(validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a reason';
                }
                return null;
              }, builder: (FormFieldState<String> state) {
                return Container(
                  height: 0.063.sh,
                  decoration: BoxDecoration(
                    border: Border.all(color: bordercolors),
                    borderRadius: BorderRadius.circular(0.01.sh),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  width: 1.sw,
                  child: DropdownButton2<String>(
                    underline: Container(),
                    hint: Text(
                      'Select the reason',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        bordercolors = colors.Appcolors;
                        selectedValue = value;
                        state.didChange(value);
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 60,
                      width: 350,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: textEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 60,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: colors.Appcolors),
                              borderRadius: BorderRadius.all(
                                Radius.circular(0.01.sh),
                              ),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
                    },
                  ),
                );
              }),
              SizedBox(
                height: 0.04.sh,
              ),
              CustomButtonWisget(
                ontap: _isButtonEnabled ? _next : null,
                tittle: 'Next',
                isActive: _isButtonEnabled,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _formKey.currentState!.validate();
    });
  }

  void _next() {
    auth.Loanapply(
        amount: loanamountcontroller.text.trim(),
        reasonforloan: selectedValue as String);
  }
}
