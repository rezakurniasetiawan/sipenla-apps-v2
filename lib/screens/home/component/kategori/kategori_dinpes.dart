import 'package:flutter/material.dart';
import 'package:siakad_app/screens/home/component/item_kategori.dart';
import 'package:siakad_app/widget/data-user/data_pegawai_screen.dart';
import 'package:siakad_app/widget/data-user/data_siswa_screen.dart';
import 'package:siakad_app/widget/fasilitas/fasilitas_screen.dart';

import '../../../../widget/mutasi/mutasi_screen.dart';

class KategoriDinpes extends StatefulWidget {
  const KategoriDinpes({Key? key, required this.role, required this.statusStudent}) : super(key: key);

  final String role,statusStudent;

  @override
  State<KategoriDinpes> createState() => _KategoriDinpesState();
}

class _KategoriDinpesState extends State<KategoriDinpes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemKategori(
                title: "Rapor",
                icon: 'assets/icons/rapot.png',
                ontaps: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AbsensiPegawai()));
                },
              ),
              ItemKategori(
                title: "Data Siswa",
                icon: 'assets/icons/data-siswa.png',
                ontaps: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DataSiswaScreen(
                                role: widget.role,
                              )));
                },
              ),
              ItemKategori(
                title: "Data Pegawai",
                icon: 'assets/icons/data-pegawai.png',
                ontaps: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DataPegawaiScreen(
                                role: widget.role,
                              )));
                },
              ),
              ItemKategori(
                title: "Mutasi",
                icon: 'assets/icons/mutasi.png',
                ontaps: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MutasiScreen(
                                role: widget.role,
                              )));
                },
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemKategori(
                title: "Penerimaan Siswa Baru",
                icon: 'assets/icons/siswa-baru.png',
                ontaps: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AbsensiPegawai()));
                },
              ),
              ItemKategori(
                title: "Fasilitas",
                icon: 'assets/icons/fasilitas.png',
                ontaps: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FasilitasScreen(
                                role: widget.role, statusStudent: widget.statusStudent,
                              )));
                },
              ),
              ItemKategori(
                title: "",
                icon: 'assets/icons/blank.png',
                ontaps: () {},
              ),
              ItemKategori(
                title: "",
                icon: 'assets/icons/blank.png',
                ontaps: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
