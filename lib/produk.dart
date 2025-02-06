import 'produk_base.dart';

class Produk extends ProdukBase {
  Produk(String nama, int stok, double harga) : super(nama, stok, harga);

  @override
  void display() {
    print('Nama: $nama | Stok: $stok | Harga: Rp$harga');
  }
}

class BukuTulis extends Produk {
  BukuTulis(String nama, int stok, double harga) : super(nama, stok, harga);

  @override
  void display() {
    print('[Buku Tulis] Nama: $nama | Stok: $stok | Harga: Rp$harga');
  }
}

class AlatTulis extends Produk {
  AlatTulis(String nama, int stok, double harga) : super(nama, stok, harga);

  @override
  void display() {
    print('[Alat Tulis] Nama: $nama | Stok: $stok | Harga: Rp$harga');
  }
}
