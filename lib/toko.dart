import 'dart:io';

import 'produk_base.dart';

class Toko {
  List<ProdukBase> daftarProduk = [];

  void tambahProduk(ProdukBase produk) {
    daftarProduk.add(produk);
  }

  void tampilkanProduk() {
    print('\nDaftar Produk Toko Peralatan Tulis:');
    if (daftarProduk.isEmpty) {
      print('Belum ada produk tersedia.');
    } else {
      for (var i = 0; i < daftarProduk.length; i++) {
        stdout.write('${i + 1}. ');
        daftarProduk[i].display();
      }
    }
  }

  void beliProduk() {
    tampilkanProduk();

    stdout.write('\nMasukkan nomor produk yang ingin dibeli: ');
    int? pilihan = int.tryParse(stdin.readLineSync()!);
    if (pilihan == null || pilihan <= 0 || pilihan > daftarProduk.length) {
      print('Pilihan tidak valid.');
      return;
    }

    stdout.write('Masukkan jumlah yang ingin dibeli: ');
    int? jumlah = int.tryParse(stdin.readLineSync()!);
    if (jumlah == null || jumlah <= 0) {
      print('Jumlah tidak valid.');
      return;
    }

    var produkDipilih = daftarProduk[pilihan - 1];

    if (produkDipilih.stok < jumlah) {
      print('Stok tidak mencukupi.');
      return;
    }

    double totalHarga = jumlah * produkDipilih.harga;
    produkDipilih.stok -= jumlah;

    print(
        'Anda membeli $jumlah ${produkDipilih.nama}. Total harga: Rp$totalHarga');
  }
}
