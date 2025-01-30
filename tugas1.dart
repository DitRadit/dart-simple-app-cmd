import 'dart:io';

class Produk {
  String nama;
  int stok;
  double harga;

  Produk(this.nama, this.stok, this.harga);

  void display() {
    print('Nama: $nama | Stok: $stok | Harga: Rp$harga');
  }
}

class Toko {
  List<Produk> daftarProduk = [];

  void tambahProduk(String nama, int stok, double harga) {
    daftarProduk.add(Produk(nama, stok, harga));
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

void main() {
  var toko = Toko();

  toko.tambahProduk('Buku Tulis', 20, 10000);
  toko.tambahProduk('Pensil 2B', 50, 5000);
  toko.tambahProduk('Pulpen Hitam', 30, 7000);

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
