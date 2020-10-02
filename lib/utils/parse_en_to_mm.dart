String parseEnToMm(String en) {
  final length = en.length;
  String result = '';
  for (int i = 0; i < length; i++) {

    switch(en[i]) {
      case '0':
        result += '၀';
        break;
      case '1':
        result += '၁';
        break;
      case '2':
        result += '၂';
        break;
      case '3':
        result += '၃';
        break;
      case '4':
        result += '၄';
        break;
      case '5':
        result += '၅';
        break;
      case '6':
        result += '၆';
        break;
      case '7':
        result += '၇';
        break;
      case '8':
        result += '၈';
        break;
      case '9':
        result += '၉';
        break;
    }
  }

  return result;
}