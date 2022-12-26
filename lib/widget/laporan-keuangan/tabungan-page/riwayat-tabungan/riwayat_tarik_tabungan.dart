import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:siakad_app/widget/laporan-keuangan/tabungan-page/riwayat-tabungan/detail_riwayat_tabungan.dart';

import '../../../../constan.dart';
import '../../../../models/api_response_model.dart';
import '../../../../models/laporan_keuangan_models.dart';
import '../../../../screens/started_screen.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/laporan_keuangan_service.dart';
import '../../isi-saldo-page/isi-saldo/isi_saldo.dart';

class RiwayatTarikTabungan extends StatefulWidget {
  const RiwayatTarikTabungan({Key? key}) : super(key: key);

  @override
  State<RiwayatTarikTabungan> createState() => _RiwayatTarikTabunganState();
}

class _RiwayatTarikTabunganState extends State<RiwayatTarikTabungan> {
  TextEditingController tanggal = TextEditingController();
  final String datenow = DateFormat('yyyyMMdd').format(DateTime.now());

  bool _loading = true;
  List<dynamic> aprroveTarikSaldoSiswaList = [];
  Future<void> fungsiriwayatTarikTabungan() async {
    ApiResponse response = await riwayatTarikTabungan(tanggal: tanggal.text);
    if (response.error == null) {
      setState(() {
        aprroveTarikSaldoSiswaList = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const GetStartedScreen()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    tanggal.text = datenow;
    fungsiriwayatTarikTabungan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Tarik Tabungan',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff4B556B),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xff4B556B),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tanggal",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: Color(0xff4B556B),
              ),
            ),
            InkWell(
              onTap: () async {
                DateTime? pickedDate2 = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (pickedDate2 != null) {
                  String formattedDate2 =
                      DateFormat('yyyyMMdd').format(pickedDate2);
                  print(formattedDate2);

                  setState(() {
                    tanggal.text = formattedDate2;
                  });
                } else {
                  print("Date is not selected");
                }
              },
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xffF0F1F2),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tanggal.text == '' ? 'yyyy-mm-dd' : tanggal.text,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                        child: ImageIcon(
                          AssetImage('assets/icons/calendar_month.png'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                fungsiriwayatTarikTabungan();
              },
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      colors: [
                        Color(0xff2E447C),
                        Color(0xff3774C3),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Cari",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Riwayat Tabungan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: Color(0xff4B556B),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: aprroveTarikSaldoSiswaList.length,
                  itemBuilder: (BuildContext context, int index) {
                    RiwayatTarikTabunganModel riwayatTarikTabunganModel =
                        aprroveTarikSaldoSiswaList[index];
                    String tanggal = DateFormat('dd-MM-yyyy')
                        .format(riwayatTarikTabunganModel.createdAt);
                    return ItemRiwayatTabungan(
                      code: riwayatTarikTabunganModel.savingCode,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailRiwayatTabungan(
                              riwayatTarikTabunganModel:
                                  riwayatTarikTabunganModel, tanggal:tanggal,
                            ),
                          ),
                        );
                      },
                      saldo: FormatCurrency.convertToIdr(
                          riwayatTarikTabunganModel.amount, 0),
                      tanggal: tanggal,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemRiwayatTabungan extends StatelessWidget {
  const ItemRiwayatTabungan({
    Key? key,
    required this.code,
    required this.tanggal,
    required this.saldo,
    required this.press,
  }) : super(key: key);

  final String code, tanggal, saldo;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Image.asset('assets/icons/tabungan2.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tarik Tabungan",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff4B556B),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            code,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff4B556B),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            tanggal,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff4B556B),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          saldo,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff4B556B),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                        const Text(
                          'Berhasil',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff83BC10),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: press,
                  child: Container(
                    width: 96,
                    height: 27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                        colors: [
                          Color(0xff2E447C),
                          Color(0xff3774C3),
                        ],
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      "Detail",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          letterSpacing: 1),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Container(
            height: 1,
            color: const Color(0xff4B556B),
          ),
        ),
      ],
    );
  }
}
