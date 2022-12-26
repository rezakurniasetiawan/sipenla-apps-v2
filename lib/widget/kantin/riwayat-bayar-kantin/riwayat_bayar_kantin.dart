import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'detail_riwayat_bayar_kantin.dart';

class RiwayatBayarKantin extends StatefulWidget {
  const RiwayatBayarKantin({Key? key}) : super(key: key);

  @override
  State<RiwayatBayarKantin> createState() => _RiwayatBayarKantinState();
}

class _RiwayatBayarKantinState extends State<RiwayatBayarKantin> {
  TextEditingController tanggal = TextEditingController();
  final String datenow = DateFormat('yyyyMMdd').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    tanggal.text = datenow;
    // fungsigetHistoryUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat',
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
              onTap: () {},
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
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: riwayatIsiSaldoList.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         RiwayatDendaUser riwayatDendaUser =
            //             riwayatIsiSaldoList[index];

            //       }),
            // )
            ItemRiwayatBayarKantin(
                code: '51651651',
                date: 's212121',
                ontaps: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailRiwayatBayarKantin()));
                },
                valuedenda: '00000'
                // FormatCurrency.convertToIdr(
                //     riwayatDendaUser.fineTransaction, 0),
                )
          ],
        ),
      ),
    );
  }
}

class ItemRiwayatBayarKantin extends StatelessWidget {
  const ItemRiwayatBayarKantin({
    Key? key,
    required this.ontaps,
    required this.code,
    required this.date,
    required this.valuedenda,
  }) : super(key: key);

  final VoidCallback ontaps;
  final String code, date, valuedenda;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/icons/denda2.png'),
              ),
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
                            "Bayar Kantin",
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
                            date,
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
                          "- $valuedenda",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xffFF6E66),
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
                  onTap: ontaps,
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
