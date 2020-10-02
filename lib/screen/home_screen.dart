import 'package:aung_bar_lay/providers/first_char_provider.dart';
import 'package:aung_bar_lay/utils/mm_utils.dart';
import 'package:aung_bar_lay/utils/parse_en_to_mm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:aung_bar_lay/export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String number;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              FirstCharProvider(firstChar: MMUtils.mmChar[0]),
        )
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _bodyWidget(context),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Consumer<FirstCharProvider>(
      builder: (context, charProvider, child) {
        return Center(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_lotteryWidget(context, charProvider)],
          ),
        ));
      },
    );
  }

  Widget _lotteryWidget(BuildContext context, FirstCharProvider charProvider) {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32),
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: Text(
              '${charProvider.firstChar}',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () => showCharBottomSheet(context, valueChanged: (char) {
              charProvider.setFirstChar(char);
            }),
          ),
          SizedBox(height: 16),
          PinCodeTextField(
            backgroundColor: Colors.white,
            onChanged: (String value) {
              print(value);
              number = value;
            },
            length: 5,
            textInputType: TextInputType.number,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.circle,
              fieldHeight: 32,
              fieldWidth: 32,
              borderWidth: 1,
              inactiveFillColor: Theme.of(context).primaryColor,
              activeFillColor: Theme.of(context).primaryColor,
              activeColor: Theme.of(context).primaryColor,
              selectedColor: Theme.of(context).primaryColor,
              selectedFillColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.grey,
              disabledColor: Colors.grey,
            ),
          ),
          SizedBox(height: 32),
          InkWell(
              child:
                  Image.asset('assets/image/gold_pot.png', fit: BoxFit.contain),
              onTap: () => _checkLottery(context, number))
        ],
      ),
    );
  }

  void _checkLottery(BuildContext context, String number) {
    final String lottery =
        Provider.of<FirstCharProvider>(context, listen: false).firstChar;

    if (number != null && number.length == 5) {
      final mmChar = parseEnToMm(number);
      final result = '($lottery - $mmChar)';
      DialogUtils.showOkCancelDialog(context,
          title: 'ကံကောင်းပါစေ',
          content: '$result ကို ထီပေါက်စဥ် တိုက်မည်လား?',
          actionCancel: () {}, actionOk: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoadingScreen(lottery: result)));
      });
    } else {
      DialogUtils.showErrorDialog(context,
          title: 'အဆင်မပြေပါ',
          content: 'ကျေးဇူးပြု၍ ထီဂဏန်း အပြည့်အစုံ ထည့်ပါ။',
          okText: 'နားလည်ပါပြီ',
          actionOk: () {});
    }
  }
}
