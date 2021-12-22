import 'package:flutter/material.dart';

class Pizza extends StatefulWidget {
  const Pizza({Key? key}) : super(key: key);

  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  double _pizzaSize = 30;
  var backgroundColor = const Color(0xFF0079D0);
  bool _value1 = true;
  bool _value2 = false;
  List souse = <String>["Острый", "Кисло-сладкий", "Сырный"];
  String? _insertSouse = "Острый";
  bool _switchTile = false;
  int sum = 300;
  int cost = 0;

  void onChange(String? change) {
    setState(() {
      _insertSouse = change;

      switch (change) {
        case "Острый":
          sum = sum - cost;
          cost = 0;
          break;
        case "Кисло-сладкий":
          sum = sum + 30 - cost;
          cost = 30;
          break;
        case "Сырный":
          sum = sum + 40 - cost;
          cost = 40;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 33),
                    width: 200,
                    height: 123,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("assets/pizza1.png"))),
                  ),
                ),
                const Text(
                  "Калькулятор пиццы",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 33),
                  child: Text(
                    "Выберите параметры:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFECEFF1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //*********************************
                      Expanded(
                        child: _value1
                            ? ElevatedButton(
                                child: const Text(
                                  "Обычное тесто",
                                  style: TextStyle(color: Colors.white,fontSize: 16,
                                  fontWeight: FontWeight.w400),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                    elevation: 0,
                                    primary: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  setState(() {});
                                },
                              )
                            : ElevatedButton(
                                child: const Text(
                                  "Обычное тесто",
                                  style: TextStyle(color: Colors.grey,fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(15),
                                    primary: const Color(0xFFECEFF1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  setState(() {
                                    sum = sum + 230 - 340;
                                    _value1 = !_value1;
                                    _value2 = !_value2;
                                  });
                                },
                              ),
                      ),

                      Expanded(
                        child: _value2
                            ? ElevatedButton(
                                child: const Text(
                                  "Тонкое тесто",
                                  style: TextStyle(color: Colors.white,fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                    elevation: 0,
                                    primary: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  setState(() {});
                                },
                              )
                            : ElevatedButton(
                                child: const Text(
                                  "Тонкое тесто",
                                  style: TextStyle(color: Colors.grey,fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(15),
                                    primary: const Color(0xFFECEFF1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  setState(() {
                                    _value2 = !_value2;
                                    _value1 = !_value1;
                                    sum = sum + 340 - 230;
                                  });
                                },
                              ),
                      ),
                      //  ******************************************
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 19),
                      child: Text(
                        "Размер:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Slider(
                      value: _pizzaSize,
                      onChanged: (value) {
                        setState(() {
                          _pizzaSize == 30
                              ? sum = sum + 100
                              : sum = sum - 100;
                          _pizzaSize = value;
                        });
                      },
                      max: 60,
                      min: 30,
                      label: _pizzaSize.round().toString() + "см",
                      divisions: 1,
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Соус:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                RadioListTile<String>(
                    activeColor: Colors.green,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: const Text(
                      "Острый",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    value: souse[0],
                    groupValue: _insertSouse,
                    onChanged: onChange),
                const Divider(
                  thickness: 2,
                ),
                RadioListTile<String>(
                    activeColor: Colors.green,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: const Text(
                      "Кисло-сладкий",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    value: souse[1],
                    groupValue: _insertSouse,
                    onChanged: onChange),
                const Divider(
                  thickness: 2,
                ),
                RadioListTile<String>(
                    activeColor: Colors.green,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: const Text(
                      "Сырный",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    value: souse[2],
                    groupValue: _insertSouse,
                    onChanged: onChange),
                const Divider(
                  thickness: 2,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 18, bottom: 10),
                  decoration: const BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: SwitchListTile(
                    contentPadding: const EdgeInsets.all(8),
                    title: const Text("Дополнительный сыр"),
                    value: _switchTile,
                    onChanged: (bool value) {
                      setState(() {
                        _switchTile = !_switchTile;
                        _switchTile ? sum += 50 : sum -= 50;
                      });
                    },
                    secondary: Image.asset("assets/cheez.png"),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Стоимость:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Сумма вашего заказа: $sum руб.",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
