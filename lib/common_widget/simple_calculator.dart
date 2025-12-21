import 'package:flutter/material.dart';
import 'package:project_moneyTracker_kel2/common/color_extension.dart';
import '../common/theme_manager.dart'; 
class SimpleCalculator extends StatefulWidget {
  final Function(String) onDone;

  const SimpleCalculator({super.key, required this.onDone});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String display = "0";
  String _operator = "";
  double _firstNum = 0;
  bool _shouldResetDisplay = false;

  void btnOnClick(String btnVal) {
    setState(() {
      if (btnVal == "AC") {
        display = "0";
        _firstNum = 0;
        _operator = "";
        _shouldResetDisplay = false;
      } else if (btnVal == "⌫") {
        if (display.isNotEmpty && display != "0") {
          display = display.substring(0, display.length - 1);
          if (display.isEmpty) display = "0";
        }
      } else if (btnVal == "+" ||
          btnVal == "-" ||
          btnVal == "x" ||
          btnVal == "/") {
        if (_operator.isNotEmpty && !_shouldResetDisplay) {
          _calculateResult();
        }
        _firstNum = double.tryParse(display.replaceAll(',', '')) ?? 0;
        _operator = btnVal;
        _shouldResetDisplay = true;
      } else if (btnVal == "=") {
        _calculateResult();
        _operator = "";
      } else {
        if (_shouldResetDisplay) {
          display = btnVal;
          _shouldResetDisplay = false;
        } else {
          if (display == "0" && btnVal != ".") {
            display = btnVal;
          } else {
            if (btnVal == "." && display.contains(".")) return;
            display += btnVal;
          }
        }
      }
    });
  }

  void _calculateResult() {
    double secondNum = double.tryParse(display.replaceAll(',', '')) ?? 0;
    double result = 0;

    switch (_operator) {
      case "+":
        result = _firstNum + secondNum;
        break;
      case "-":
        result = _firstNum - secondNum;
        break;
      case "x":
        result = _firstNum * secondNum;
        break;
      case "/":
        if (secondNum == 0) {
          result = 0;
        } else {
          result = _firstNum / secondNum;
        }
        break;
      default:
        result = secondNum;
        break;
    }

    String resultString = result.toString();
    if (resultString.endsWith(".0")) {
      resultString = resultString.substring(0, resultString.length - 2);
    }
    display = resultString;
    _firstNum = result;
  }

  @override
  Widget build(BuildContext context) {
        return ValueListenableBuilder<bool>(
      valueListenable: themeNotifier,
      builder: (context, isDarkMode, child) {
        
                var sheetBgColor = isDarkMode ? TColor.gray : Colors.white;

                        var textColor = isDarkMode ? Colors.white : Colors.black;

                var btnColor = isDarkMode ? TColor.gray60 : Colors.grey.shade50;

                var actionColor = isDarkMode ? TColor.gray70 : Colors.grey.shade300;

                var operatorColor = TColor.secondary;

                var handleColor = isDarkMode ? Colors.white24 : Colors.grey.shade300;

        return DraggableScrollableSheet(
          initialChildSize: 0.55,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: sheetBgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                                    SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Column(
                        children: [
                                                    Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: handleColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 20),

                                                    Container(
                            alignment: Alignment.centerRight,
                            height: 20,
                            child: Text(
                              _operator,
                              style: TextStyle(
                                  color: operatorColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                                                    Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerRight,
                              child: Text(
                                display,
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      textColor,                                 ),
                              ),
                            ),
                          ),
                          Divider(
                              color:
                                  isDarkMode ? Colors.white12 : Colors.black12,
                              thickness: 1),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),

                                    SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.3,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                                                    if (buttons[index] == "OK") {
                            return InkWell(
                              onTap: () {
                                widget.onDone(display);
                                Navigator.pop(context);
                              },
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: TColor.primary,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "OK",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Colors.white),                                 ),
                              ),
                            );
                          }

                                                    if (buttons[index] == "⌫") {
                            return InkWell(
                              onTap: () => btnOnClick("⌫"),
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: actionColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.backspace_outlined,
                                                                        color: textColor,
                                    size: 20),
                              ),
                            );
                          }

                          bool isOp = isOperator(buttons[index]);
                          bool isAc = buttons[index] == "AC";

                                                    Color currentBtnColor;
                          if (isAc) {
                            currentBtnColor = actionColor;
                          } else if (isOp) {
                            currentBtnColor = operatorColor;
                          } else {
                            currentBtnColor = btnColor;
                          }

                                                    Color currentTextColor;
                          if (isOp) {
                                                        currentTextColor = Colors.white;
                          } else {
                                                        currentTextColor = textColor;
                          }

                          return InkWell(
                            onTap: () => btnOnClick(buttons[index]),
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: currentBtnColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: !isDarkMode && !isOp && !isAc
                                    ? [
                                        const BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 2,
                                          offset: Offset(0, 2),
                                        )
                                      ]
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                buttons[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: currentTextColor,
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: buttons.length,
                      ),
                    ),
                  ),

                                    const SliverToBoxAdapter(child: SizedBox(height: 30)),
                ],
              ),
            );
          },
        );
      },
    );
  }

  bool isOperator(String x) {
    return x == "/" || x == "x" || x == "-" || x == "+" || x == "=";
  }

  final List<String> buttons = [
    "AC",
    "⌫",
    "/",
    "x",
    "7",
    "8",
    "9",
    "-",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "=",
    "0",
    ".",
    "OK",
  ];
}
