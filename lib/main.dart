import 'package:flutter/material.dart';
import 'package:newproject/widgets/bullets_widget.dart';

import 'colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyRegistrationPage(),
    );
  }
}

class MyRegistrationPage extends StatefulWidget {
  @override
  _MyRegistrationPageState createState() => _MyRegistrationPageState();
}

class _MyRegistrationPageState extends State<MyRegistrationPage> {
  Color viewColor = MyColor.bgColor;
  Color roleViewColor = MyColor.bgColor;
  Color emailViewColor = MyColor.bgColor;
  Color lineColor = MyColor.blueLine;
  Color lineColor2 = MyColor.blueLine;
  FocusNode _focus = new FocusNode();
  FocusNode roleFocus = new FocusNode();
  FocusNode emailFocus = new FocusNode();

  String selectedRole = '';
  bool isRoleSelect = false;

  Map<String, bool> values = {
    'Cleaner': false,
    'Customer Services': false,
    'Lifeguard': false,
    'Pool Manager': false,
    'Pool Operator': false,
    'Security': false,
  };

  Widget getFormWidget() {
    return Column(
        children: values.keys.map((String key) {
      return Theme(
        data: ThemeData(unselectedWidgetColor: Colors.white.withOpacity(.5)),
        child: CheckboxListTile(
          title: new Text(
            key,
            style: TextStyle(
                color: Colors.white.withOpacity(.5),
                fontFamily: 'LatoBold',
                fontSize: 12),
          ),
          checkColor: Colors.white.withOpacity(.5),
          value: selectedRole.compareTo(key) == 0,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (bool value) {
            setState(() {
              selectedRole = key;
              // isRoleSelect = false;
            });
          },
        ),
      );
    }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.bgColor,
        elevation: 0.0,
        title: Container(
          padding: EdgeInsets.only(top: 18, left: 25),
          child: Row(
            children: <Widget>[
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: MyColor.skyBlueColor,
                ),
                child: Image.asset('images/toolbar_icon.png'),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 8),
                      child: Text('PoolScout Commercial',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'LatoBold',
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: MyColor.skyBlueColor,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          BulletsWidget(),
                          BulletsWidget(),
                          BulletsWidget(),
                          BulletsWidget(),
                          BulletsWidget(),
                          BulletsWidget(),
                          BulletsWidget(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: MyColor.bgColor,
                  expandedHeight: 80,
                  pinned: true,
                  titleSpacing: 0,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Create Profile'),
                    titlePadding: EdgeInsets.only(left: 25,bottom: 16),
                  ),
                ),
              ];
            },
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 128,
                      width: 128,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 7, bottom: 5),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: MyColor.skyBlueColor,
                                ),
                                child: Image.asset('images/camera.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    color: viewColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('Full Name',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'LatoBold',
                                    fontSize: 12.4)),
                          ),
                          Container(
                            child: TextFormField(
                              focusNode: _focus,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.6,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'LatoBold'),
                              //controller: textControllerName,
                              decoration: InputDecoration(
                                //contentPadding: const EdgeInsets.only(left: 10.0),
                                border: InputBorder.none,
                                hintText: 'e.g Robin Peterson',
                                hintStyle: TextStyle(
                                    color: MyColor.bulletsColor,
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'LatoBold'),
                              ),
                            ),
                            height: 38,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Divider(
                            height: 2,
                            color: lineColor,
                          )
                        ],
                      ),
                    )),
                Container(
                    color: isRoleSelect ? MyColor.back : MyColor.bgColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                setState(() {
                                  isRoleSelect = !isRoleSelect;
                                });
                              },
                              child: Text(
                                'Role',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'LatoBold',
                                    fontSize: 12.4),
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  isRoleSelect = !isRoleSelect;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    selectedRole.isEmpty
                                        ? 'Select Role(s)'
                                        : selectedRole,
                                    style: TextStyle(
                                        color: selectedRole.isEmpty?Colors.white.withOpacity(.5):Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'LatoBold',
                                        fontSize: 14),
                                  ),
                                  Icon(
                                    isRoleSelect
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    color: MyColor.whiteColor.withOpacity(.5),
                                  )
                                ],
                              )),
                          Divider(
                            color: MyColor.whiteColor.withOpacity(.6),
                          ),
                          isRoleSelect ? getFormWidget() : Container(),
                        ],
                      ),
                    )),
                SizedBox(height: 10),
                Container(
                    color: emailViewColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('Email',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'LatoBold',
                                    fontSize: 12.4)),
                          ),
                          Container(
                            child: TextFormField(
                              focusNode: emailFocus,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.6,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'LatoBold'),
                              //controller: textControllerName,
                              decoration: InputDecoration(
                                //contentPadding: const EdgeInsets.only(left: 10.0),
                                border: InputBorder.none,
                                hintText: 'e.g. name@gmail.com',
                                hintStyle: TextStyle(
                                    color: MyColor.bulletsColor,
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'LatoBold'),
                              ),
                            ),
                            height: 38,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Divider(
                            height: 2,
                            color: lineColor2,
                          )
                        ],
                      ),
                    )),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 25, bottom: 25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 102,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: MyColor.blueLine,
                      ),
                      child: Center(
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'LatoBold',
                                fontSize: 15)),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    emailFocus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: " + _focus.hasFocus.toString());
    if (_focus.hasFocus == true) {
      setState(() {
        viewColor = MyColor.blueLight;
        emailViewColor = MyColor.bgColor;
        lineColor = MyColor.whiteColor.withOpacity(0.8);
        lineColor2 = MyColor.blueLine;
      });
    } else if (emailFocus.hasFocus == true) {
      setState(() {
        emailViewColor = MyColor.blueLight;
        viewColor = MyColor.bgColor;
        lineColor2 = MyColor.whiteColor.withOpacity(0.8);
        lineColor = MyColor.blueLine;
      });
    }
  }
}
