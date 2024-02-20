class StaticValueHelper{
  static Map<int, String> apiError =  {
    1000: "Kesalahan pada server!",
    1002: "Request yang dikirim salah!",
    1003: "Anda tidak memiliki akses ke fitur ini!",
    1004: "Username atau password salah!",
    1005: "Data yang diinput sudah ada!",
    1006: "Data yang dikirimkan salah!",
    1007: "Data yang anda pilih tidak tersedia!",
    2001: "Sesi login anda sudah habis!",
    2002: "Username sudah digunakan!",
    2003: "Akun sudah dinonaktifkan!",
    2004: "Data yang dikonfigurasi belum lengkap!",
    2005: "SIMT Error",
    2006: "Payment sudah terassign!"
  };

  static Map<int, String> productCategoryList = {
    1: "Pakan Ternak 1 sak 50 kg",
    2: "Pakan Ternak 1 sak 30 kg",
    3: "Pakan Ternak 1 sak 25 kg",
    4: "Pakan Ternak 1 kg",
    5: "Obat Ternak",
    6: "Alat Ternak",
    7: "Lainnya",
  };

  static Map<int, String> productCategoryTab = {
    1: "Pakan 50 kg",
    2: "Pakan 30 kg",
    3: "Pakan 25 kg",
    4: "Pakan 1 kg",
    5: "Obat",
    6: "Alat",
    7: "Lainnya",
  };
}