import 'dart:io';
import 'lib/produk.dart';
import 'lib/toko.dart';

void main() {
  var toko = Toko();

  toko.tambahProduk(BukuTulis('Buku Tulis', 20, 10000));
  toko.tambahProduk(AlatTulis('Pensil 2B', 50, 5000));
  toko.tambahProduk(AlatTulis('Pulpen Hitam', 30, 7000));

  while (true) {
    print('\n=== Sistem Penjualan Toko Peralatan Tulis ===');
    print('1. Lihat Produk');
    print('2. Beli Produk');
    print('3. Keluar');
    stdout.write('Pilih menu: ');

    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        toko.tampilkanProduk();
        break;
      case '2':
        toko.beliProduk();
        break;
      case '3':
        print('Terima kasih telah berbelanja!');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
