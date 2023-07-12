import 'package:bmical/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'iconChild.dart';
import 'calculatorBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = activeCardcolor;
  Color femaleCardColor = activeCardcolor;

  int height = 180;
  int weight = 60;
  int age = 18;
  late double newValue;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == activeCardcolor) {
        maleCardColor = inactiveCardColor;
        femaleCardColor = activeCardcolor;
      } else {
        maleCardColor = activeCardcolor;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == activeCardcolor) {
        femaleCardColor = inactiveCardColor;
        maleCardColor = activeCardcolor;
      } else {
        femaleCardColor = activeCardcolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        print('male card was pressed');
                        updateColor(Gender.male);
                      },
                    );
                  },
                  child: ReusableContainer(
                    maleCardColor,
                    iconChild(FontAwesomeIcons.mars, 'Male'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        print('female card was pressed');
                        updateColor(Gender.female);
                      },
                    );
                  },
                  child: ReusableContainer(
                    femaleCardColor,
                    iconChild(FontAwesomeIcons.venus, 'Female'),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: ReusableContainer(
                  activeCardcolor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: labelTextStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: numberTextStye,
                          ),
                          Text(
                            'cm',
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0xFFEB1555),
                            inactiveTrackColor: Color(0xFF080914),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderThumbShape(
                                enabledThumbRadius: 30.0)),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ))),
          Row(
            children: [
              Expanded(
                child: ReusableContainer(
                  activeCardcolor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'age',
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: numberTextStye,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RawMaterialButton(
                            elevation: 6.0,
                            shape: CircleBorder(),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            fillColor: Color(0xFF4C4F5E),
                            constraints: BoxConstraints.tightFor(
                                width: 56.0, height: 56.0),
                            child: Icon(FontAwesomeIcons.plus),
                          ),
                          RawMaterialButton(
                            elevation: 6.0,
                            shape: CircleBorder(),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            fillColor: Color(0xFF4C4F5E),
                            constraints: BoxConstraints.tightFor(
                                width: 56.0, height: 56.0),
                            child: Icon(FontAwesomeIcons.minus),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableContainer(
                  activeCardcolor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: numberTextStye,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RawMaterialButton(
                            elevation: 6.0,
                            shape: CircleBorder(),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            fillColor: Color(0xFF4C4F5E),
                            constraints: BoxConstraints.tightFor(
                                width: 56.0, height: 56.0),
                            child: Icon(FontAwesomeIcons.plus),
                          ),
                          RawMaterialButton(
                            elevation: 6.0,
                            shape: CircleBorder(),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            fillColor: Color(0xFF4C4F5E),
                            constraints: BoxConstraints.tightFor(
                                width: 56.0, height: 56.0),
                            child: Icon(FontAwesomeIcons.minus),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height, weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ResultPage(calc.calculateBMI(), calc.getRes())));
            },
            child: Container(
              color: bottomCardcolor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomHeight,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: numberTextStye,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  ReusableContainer(this.colour, this.cardChild);
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      height: 200,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
