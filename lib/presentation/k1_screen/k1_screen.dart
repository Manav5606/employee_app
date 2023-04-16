import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:manav_s_application6/core/app_export.dart';
import 'package:manav_s_application6/widgets/custom_button.dart';
import 'package:manav_s_application6/widgets/custom_drop_down.dart';
import 'package:manav_s_application6/widgets/custom_text_form_field.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class K1Screen extends StatefulWidget {
  @override
  State<K1Screen> createState() => _K1ScreenState();
}

enum ButtonOption { Option1, Option2, Option3, Option4 }

class _K1ScreenState extends State<K1Screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateRangePickerController datec = DateRangePickerController();
  List<String> dropdownItemList = [
    "Product Designer",
    "Flutter Developer",
    "QA Tester",
    "Product Owner",
  ];
  String? selectedValue;
  TextEditingController todayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nodateController = TextEditingController();

  String? _selectedDate;
  String? _selectedDateFormatted;
  String? d;
  DateTime? _selected;
  DateTime? _selectedd;
  bool _isButtonPressed = false;
  bool _isButtonPressed1 = false;
  bool _isButtonPressed2 = false;
  Color _buttonColor = Colors.blue;
  void _showNextWeekDate() {
    setState(() {
      _selectedd = DateTime.now().add(Duration(days: 7));
    });
  }

  void _selectNextTuesday(BuildContext context) {
    DateTime now = DateTime.now();
    int daysUntilNextTuesday = ((DateTime.tuesday - now.weekday) % 7) + 7;
    DateTime nextTuesday = now.add(Duration(days: daysUntilNextTuesday));
    setState(() {
      _selectedDateFormatted = DateFormat('dd MMM yyyy').format(nextTuesday);
    });
    // Navigator.of(context).pop();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      print(args.value);
      _selectedDate = args.value.toString();
      _selected = args.value;
      _selectedDateFormatted = DateFormat('d MMM y').format(args.value);
      print(_selectedDateFormatted);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = dropdownItemList.first;
  }

  @override
  Widget build(BuildContext context) {
    int _selectedButtonIndex = 0;

    void _onButtonPressed(int index) {
      setState(() {
        _selectedButtonIndex = index;
      });
    }

    ButtonOption _selectedOption = ButtonOption.Option1;
    Color _button1Color = Colors.blue;
    Color _button2Color = Colors.blue;
    Color _button3Color = Colors.blue;
    Color _button4Color = Colors.blue;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  padding: getPadding(
                    left: 16,
                    top: 17,
                    right: 16,
                    bottom: 17,
                  ),
                  decoration: AppDecoration.txtFillBlue500,
                  child: Text(
                    "Add Employee Details",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtRobotoRomanMedium18,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: nameController,
                  hintText: "Joseph Manadan",
                  margin: getMargin(
                    left: 16,
                    top: 24,
                    right: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  prefix: Container(
                    margin: getMargin(
                      left: 8,
                      top: 8,
                      right: 12,
                      bottom: 8,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgUser,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      40,
                    ),
                  ),
                ),
                CustomDropDown(
                  // key: UniqueKey(),
                  focusNode: FocusNode(),
                  icon: Container(
                    margin: getMargin(
                      left: 30,
                      right: 8,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant
                          .imgArrowdropdownfill1wght400grad0opsz243,
                    ),
                  ),
                  hintText: "Flutter Developer",
                  margin: getMargin(
                    left: 16,
                    top: 23,
                    right: 16,
                  ),

                  items: dropdownItemList,
                  selectedValue: selectedValue,
                  prefix: Container(
                    margin: getMargin(
                      left: 8,
                      top: 8,
                      right: 12,
                      bottom: 8,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgBag,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      40,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 23,
                    right: 16,
                    bottom: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        width: getHorizontalSize(
                          172,
                        ),
                        // focusNode: FocusNode(),
                        controller: dateController,
                        hintText: "Today",
                        readOnly: true,
                        fontStyle: TextFormFieldFontStyle.RobotoRomanRegular14,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Select the date';
                          }
                          return null;
                        },
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _selectedOption =
                                                      ButtonOption.Option1;
                                                  _selectedDateFormatted =
                                                      DateFormat('d MMM yyyy')
                                                          .format(
                                                              DateTime.now());
                                                  d = _selectedDate;
                                                });
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                                    return Colors.blue;
                                                  },
                                                ),
                                              ),
                                              child: Text("Today"),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                DateTime now = DateTime.now();
                                                DateTime nextMonday = now.add(
                                                    Duration(
                                                        days:
                                                            (8 - now.weekday) %
                                                                7));
                                                setState(() {
                                                  _onButtonPressed(1);
                                                  _isButtonPressed =
                                                      !_isButtonPressed;
                                                  _selectedDateFormatted =
                                                      DateFormat('dd MMM yyyy')
                                                          .format(nextMonday);
                                                  _selectedd =
                                                      _selectedDateFormatted
                                                          as DateTime;
                                                  print("object" +
                                                      _selectedDate.toString());
                                                });
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                                    return Colors.blue;
                                                  },
                                                ),
                                              ),
                                              child: Text("Next Monday"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _selectNextTuesday(context);
                                                print("object " +
                                                    _selectedDate.toString());
                                              },
                                              child: Text("Next Tuesdy"),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _showNextWeekDate();
                                                setState(() {
                                                  // _selectedDateFormatted =
                                                  //     DateTime.now()
                                                  //         .add(Duration(days: 7))
                                                  //         .toString();
                                                  _selectedDateFormatted =
                                                      DateFormat('dd MMM yyyy')
                                                          .format(DateTime.now()
                                                              .add(Duration(
                                                                  days: 7)));
                                                  print("object" +
                                                      _selectedDate.toString());
                                                });
                                              },
                                              child: Text("After 1 week"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        // color: Colors.red,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5, // set a fixed height value
                                        width: MediaQuery.of(context)
                                            .size
                                            .width, // set a fixed width value

                                        child: SfDateRangePicker(
                                            controller: datec,
                                            view: DateRangePickerView.month,
                                            selectionMode:
                                                DateRangePickerSelectionMode
                                                    .single,
                                            maxDate: DateTime.now()
                                                .add(Duration(days: 60)),
                                            initialDisplayDate: _selected,
                                            onSelectionChanged:
                                                _onSelectionChanged),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          StreamBuilder<String>(
                                            stream: Stream.periodic(
                                                Duration(seconds: 1),
                                                (_) => _selectedDateFormatted!),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Row(
                                                  children: [
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgEventfill0wght300grad0opsz2411,
                                                    ),
                                                    Text('Select Date'),
                                                  ],
                                                );
                                              }
                                              return Row(
                                                children: [
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgEventfill0wght300grad0opsz2411,
                                                  ),
                                                  Text(snapshot.data!),
                                                ],
                                              );
                                            },
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancel"),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    dateController.text =
                                                        _selectedDateFormatted!;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Save"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        prefix: Container(
                          margin: getMargin(
                            left: 8,
                            top: 8,
                            right: 9,
                            bottom: 8,
                          ),
                          child: CustomImageView(
                            svgPath:
                                ImageConstant.imgEventfill0wght300grad0opsz2411,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(
                            40,
                          ),
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowright,
                        height: getSize(
                          20,
                        ),
                        width: getSize(
                          20,
                        ),
                        margin: getMargin(
                          left: 16,
                          top: 10,
                          bottom: 10,
                        ),
                      ),
                      CustomTextFormField(
                        width: getHorizontalSize(
                          172,
                        ),
                        // focusNode: FocusNode(),
                        controller: nodateController,
                        hintText: "No date",
                        readOnly: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Select the date';
                          }
                          return null;
                        },
                        margin: getMargin(
                          left: 16,
                        ),
                        fontStyle: TextFormFieldFontStyle.RobotoRomanRegular14,
                        // textInputAction: TextInputAction.done,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.65,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _isButtonPressed =
                                                      !_isButtonPressed;
                                                  _selectedDateFormatted =
                                                      "No date";
                                                });
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                                    return Colors.blue;
                                                  },
                                                ),
                                              ),
                                              child: Text("No date"),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _isButtonPressed =
                                                      !_isButtonPressed;

                                                  _selectedDateFormatted =
                                                      DateFormat('d MMM yyyy')
                                                          .format(
                                                              DateTime.now());
                                                  d = _selectedDate;
                                                });
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                                    return Colors.blue;
                                                  },
                                                ),
                                              ),
                                              child: Center(
                                                child: Text("Today"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        // color: Colors.red,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5, // set a fixed height value
                                        width: MediaQuery.of(context)
                                            .size
                                            .width, // set a fixed width value

                                        child: SfDateRangePicker(
                                            controller: datec,
                                            view: DateRangePickerView.month,
                                            selectionMode:
                                                DateRangePickerSelectionMode
                                                    .single,
                                            maxDate: DateTime.now()
                                                .add(Duration(days: 60)),
                                            // initialDisplayDate: _selected,
                                            onSelectionChanged:
                                                _onSelectionChanged),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          StreamBuilder<String>(
                                            stream: Stream.periodic(
                                                Duration(seconds: 1),
                                                (_) => _selectedDateFormatted!),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Row(
                                                  children: [
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgEventfill0wght300grad0opsz2411,
                                                    ),
                                                    Text('Select Date'),
                                                  ],
                                                );
                                              }
                                              return Row(
                                                children: [
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgEventfill0wght300grad0opsz2411,
                                                  ),
                                                  Text(snapshot.data!),
                                                ],
                                              );
                                            },
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancel"),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (nameController != null) {
                                                    setState(() {
                                                      nodateController.text =
                                                          _selectedDateFormatted!;
                                                    });
                                                    Navigator.pop(context);
                                                  } else {
                                                    print("object");
                                                  }
                                                },
                                                child: Text("Save"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        prefix: Container(
                          margin: getMargin(
                            left: 8,
                            top: 8,
                            right: 9,
                            bottom: 8,
                          ),
                          child: CustomImageView(
                            svgPath:
                                ImageConstant.imgEventfill0wght300grad0opsz2411,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(
                            40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 16,
            top: 12,
            right: 16,
            bottom: 12,
          ),
          decoration: AppDecoration.outlineGray100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                height: getVerticalSize(
                  40,
                ),
                width: getHorizontalSize(
                  73,
                ),
                text: "Cancel",
              ),
              CustomButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (nodateController.text == "No date") {
                      await FirebaseFirestore.instance
                          .collection("current")
                          .add({
                        "name": nameController.text,
                        "role": selectedValue,
                        "tody": dateController.text,
                        "nodate": nodateController.text,
                      });
                      Navigator.pushNamed(context, AppRoutes.k2Screen);
                    } else {
                      await FirebaseFirestore.instance
                          .collection("previous")
                          .add({
                        "name": nameController.text,
                        "role": selectedValue,
                        "tody": dateController.text,
                        "nodate": nodateController.text,
                      });
                      Navigator.pushNamed(context, AppRoutes.k2Screen);
                    }
                  } else {
                    Fluttertoast.showToast(msg: "Please Enter all the details");
                  }
                },
                height: getVerticalSize(
                  40,
                ),
                width: getHorizontalSize(
                  73,
                ),
                text: "Save",
                margin: getMargin(
                  left: 16,
                ),
                variant: ButtonVariant.FillBlue500,
                fontStyle: ButtonFontStyle.RobotoRomanMedium14WhiteA700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

DateTime _selectedDate = DateTime.now();
Future<void> _selectDate(BuildContext context) async {
  final newDateTime = await showRoundedDatePicker(
      context: context,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleDayButton: TextStyle(fontSize: 36, color: Colors.white),
        textStyleYearButton: TextStyle(
          fontSize: 52,
          color: Colors.white,
        ),
        textStyleDayHeader: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        textStyleCurrentDayOnCalendar: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
        textStyleDayOnCalendar: TextStyle(fontSize: 28, color: Colors.white),
        textStyleDayOnCalendarSelected: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
        textStyleDayOnCalendarDisabled:
            TextStyle(fontSize: 28, color: Colors.white.withOpacity(0.1)),
        textStyleMonthYearHeader: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
        paddingDatePicker: EdgeInsets.all(0),
        paddingMonthHeader: EdgeInsets.all(32),
        paddingActionBar: EdgeInsets.all(16),
        paddingDateYearHeader: EdgeInsets.all(32),
        sizeArrow: 50,
        colorArrowNext: Colors.white,
        colorArrowPrevious: Colors.white,
        marginLeftArrowPrevious: 16,
        marginTopArrowPrevious: 16,
        marginTopArrowNext: 16,
        marginRightArrowNext: 32,
        textStyleButtonAction: TextStyle(fontSize: 28, color: Colors.white),
        textStyleButtonPositive: TextStyle(
            fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        textStyleButtonNegative:
            TextStyle(fontSize: 28, color: Colors.white.withOpacity(0.5)),
        decorationDateSelected:
            BoxDecoration(color: Colors.orange[600], shape: BoxShape.circle),
        backgroundPicker: Colors.deepPurple[400],
        backgroundActionBar: Colors.deepPurple[300],
        backgroundHeaderMonth: Colors.deepPurple[300],
      ),
      styleYearPicker: MaterialRoundedYearPickerStyle(
        textStyleYear: TextStyle(fontSize: 40, color: Colors.white),
        textStyleYearSelected: TextStyle(
            fontSize: 56, color: Colors.white, fontWeight: FontWeight.bold),
        heightYearRow: 100,
        backgroundPicker: Colors.deepPurple[400],
      ));
}
// if (picked != null && picked != _selectedDate) {
//   setState(() {
//     _selectedDate = picked;
//   });
// }

Widget _new(BuildContext context) {
  return AlertDialog(
    title: Text('Select a date'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.blue,
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Button 1'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Button 2'),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: Text('Select Date'),
        ),
        SizedBox(height: 20),
        Text('Selected date: ${_selectedDate.toString()}'),
      ],
    ),
  );
}
