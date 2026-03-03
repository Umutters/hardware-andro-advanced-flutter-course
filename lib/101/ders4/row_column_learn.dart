import 'package:flutter/material.dart';

class RowColumnLearn extends StatelessWidget {
  const RowColumnLearn({super.key});

  void _getScreenWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print('Ekran genişliği: $width');
  }

  @override
  Widget build(BuildContext context) {
    _getScreenWidth(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(height: 45, color: Colors.red),
          Container(height: 45, color: Colors.green),
          Container(
            color: Colors.purple,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: Text("blue"),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 45,
                    color: Colors.yellow,
                    child: Text("yellow"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
//expanded widget row columnlar içinde esnek bir şekilde yer kaplamasını sağlar
// flex parametresi ile ne kadar yer kaplayacağını belirleyebiliriz
// ve bu şekilde responsive tasarımlar yapabiliriz
//row ve columnlarda crossAxisAlignment ve mainAxisAlignment parametreleri ile çocuk widgetların hizalanmasını kontrol edebiliriz
// crossAxisAlignment:tam tersi yönde hizalama yapar rowsa vertical, columnsa horizontal hizalama yapar
// mainAxisAlignment: ana eksende hizalama yapar rowsa horizontal, columnsa vertical hizalama yapar
//mainaxisSize: mainAxisSize.min yaparsak row veya columnun çocuklarının toplam genişliğine göre boyutlanmasını sağlar