import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class Data {
  String kode = "";
  String nama = "";
  String vol = "";
  String turnOver = "";
  String harga = "";
  String naikTurun = "";
  String pctNaikTurun = "";

  Data(
      {required this.kode,
      required this.nama,
      required this.vol,
      required this.turnOver,
      required this.harga,
      required this.naikTurun,
      required this.pctNaikTurun});
}

class MyAppState extends State<MyApp> {
  String pilihanTurnOver = "Active Turn Over";
  String pilihanTurnOverOut = "";
  String pilihanVolume = "1W";
  String pilihanVolumeOut = "";
  String selectedOption = "";

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> TurnOver = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "Active Turn Over",
      child: Text("Active Turn Over"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "Active Volume",
      child: Text("Active Volume"),
    );
    TurnOver.add(itm1);
    TurnOver.add(itm2);

    List<DropdownMenuItem<String>> volume = [];
    var itmg1 = const DropdownMenuItem<String>(
      value: "1D",
      child: Text("1D"),
    );
    var itmg2 = const DropdownMenuItem<String>(
      value: "1W",
      child: Text("1W"),
    );
    volume.add(itmg1);
    volume.add(itmg2);

    List<Data> data = [
      Data(
          kode: 'BBRI',
          nama: 'Bank Rakyat Indonesia',
          vol: '125M',
          turnOver: '605B',
          harga: '4820',
          naikTurun: '+80',
          pctNaikTurun: '+2.00%'),
      Data(
          kode: 'TLKM',
          nama: 'Telkom Indonesia',
          vol: '77M',
          turnOver: '310',
          harga: '4810',
          naikTurun: '+100',
          pctNaikTurun: '+2.00%'),
    ];

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter Alghaniyu dan Hestina'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      Container(
                        // decoration: BoxDecoration(border: Border.all()),
                        padding: EdgeInsets.all(30),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownButton(
                                value: pilihanTurnOver,
                                items: TurnOver,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    if (newValue != null) {
                                      pilihanTurnOver = newValue;
                                    }
                                  });
                                },
                              ),
                              Padding(padding: EdgeInsets.all(30)),
                              DropdownButton(
                                value: pilihanVolume,
                                items: volume,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    if (newValue != null) {
                                      pilihanVolume = newValue;
                                    }
                                  });
                                },
                              ),
                            ]),
                      )
                    ])),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            height: 100,
                            width: 100,
                            child: Text(
                              data[index].kode,
                            ),
                          ),
                          title: Text(
                            data[index].nama,
                            style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data[index].vol,
                            style: TextStyle(color: Colors.blue.shade700),
                          ),
                          trailing: Text(
                            data[index].naikTurun,
                            style: TextStyle(color: Colors.blue),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 9'),
            content: const Text(
                'Hestina Dwi Hartiwi (hestinadwii@upi.edu) ; Alghaniyu Naufal Hamid (algha_naufal@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
