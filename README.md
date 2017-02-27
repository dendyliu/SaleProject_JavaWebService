# Tugas 2 IF3110 Pengembangan Aplikasi Berbasis Web

Melakukan *upgrade* Website Marketplace sederhana pada Tugas 1 dengan mengaplikasikan **arsitektur web service REST dan SOAP**.


### Tujuan Pembuatan Tugas

* Produce dan Consume REST API
* Mengimplementasikan service Single Sign-On (SSO) sederhana
* Produce dan Consume Web Services dengan protokol SOAP
* Membuat web application dengan menggunakan JSP yang akan memanggil web services dengan SOAP dan REST.

### Petunjuk Pengerjaan
## Anggota Tim

Kelompok Keket beranggotakan 3 orang. Anggota dari kelompok ini adalah :
1.  Catherine Pricilla (13514004)
2.  Dendy Suprihady (13514070)
3.  Scarletta Julia Yapfrine (13514074)

## Petunjuk Pengerjaan


### Arsitektur Umum Server
![Gambar Arsitektur Umum Server](http://gitlab.informatika.org/IF3110_WebBasedDevelopment_2016/TugasBesar2_JavaAndWebService/raw/3747ba2499396d04f742a589a024876964383159/arsitektur_umum.png)

Tugas 2 ini terdiri dari berberapa komponen yang harus dibuat:
* `Web app`: digunakan untuk menangani HTTP request dari web browser dan menghasilkan HTTP response. Bagian yang diimplementasi dengan JSP ini juga bertugas untuk meng-generate tampilan web layaknya PHP. Bagian ini wajib dibuat dengan **Java + Java Server Pages**. Maka dari itu, konversi seluruh kode PHP pada tugas 1 menjadi kode JSP.
* `Marketplace Web Service`: digunakan sebagai interface yang dipanggil oleh aplikasi melalui protokol SOAP. melakukan query ke database, operasi insert, dan operasi update untuk entitas User, Question, dan Answer. Webservice ini akan dipanggil oleh aplikasi dengan menggunakan SOAP. Webservice ini wajib dibuat dengan **JAX-WS dengan protokol SOAP atau Webservice lain** yang basisnya menggunakan **SOAP dan Java**.
* `Identity service`: dipanggil oleh aplikasi untuk menerima email (sebagai username) dan password pengguna, dan menghasilkan *access token*. Identity Service juga dipanggil oleh *marketplace web service* untuk melakukan validasi terhadap *access token* yang sedang dipegang oleh *web app*. Service ini dibuat menggunakan REST. Identity service ini wajib dibuat dengan menggunakan **Java Servlet**.
* `Database`: pisahkan basis data yang telah Anda buat pada tugas 1 menjadi basis data khusus manajemen *account* (menyimpan username, password, dkk) dan basis data marketplace tanpa manajemen *account*. Basis data *account* digunakan secara khusus oleh Identity Service. **Marketplace Web Service tidak boleh secara langsung mengakses basis data account untuk melakukan validasi token** (harus melalui Identity Service).

Perhatikan bahwa Anda tidak perlu menggunakan banyak mesin untuk membuat aplikasi ini. Contohnya, pada satu mesin anda bisa menggunakan port 8000 untuk JSP, port 8001 untuk identity service, dan port 8002 untuk marketplace web service.

### Deskripsi Tugas

Kami  membuat marketplace sederhana seperti tugas 1.  Kebutuhan fungsional dan non-fungsional tugas yang dibuat adalah sebagai berikut.

1. Halaman registrasi, login, catalog, purchase confirmation, your products, add product, edit product, sales, dan purchases seperti pada tugas 1.
2. Marketplace web service dengan fungsi-fungsi sesuai kebutuhan sistem dalam mengakses data (kecuali login, register, dan logout).
3. Identity service yang menangani manajemen *account* seperti login dan register, serta validasi access token.
4. Fitur like tidak diimplementasikan dengan menggunakan AJAX.
3. Melakukan validasi javascript.
4. Menggunakan asset dan tampilan dari tugas sebelumnya.


### Skenario

#### Login
1. Pengguna mengakses halaman login, contoh: `/login.jsp` dan mengisi form.
2. JSP akan membuka HTTP request ke Identity Service, contoh `POST /login` dengan body data email dan password.
3. Identity service akan melakukan query ke DB untuk mengetahui apakah email dan password tersebut valid.
4. Identity service akan memberikan HTTP response `access token` dan `expiry time` jika email dan password ada di dalam DB, atau error jika tidak ditemukan data. Silakan definisikan `expiry time` yang menurut Anda sesuai.
5. Access token ini digunakan sebagai representasi state dari session pengguna dan harus dikirimkan ketika pengguna ingin melakukan semua aktivitas, kecuali search (catalog), login, register, dan logout. 
6. Access token dibangkitkan secara random. Silakan definisikan sendiri panjang tokennya.
7. Cara penyimpanan access token dibebaskan.
6. Silakan definisikan format request dan response sesuai kebutuhan anda. Anda dapat menggunakan JSON atau XML untuk REST.

#### Register
1. Pengguna mengakses halaman register, contoh: `/register.jsp` dan mengisi form.
2. JSP akan melakukan HTTP request ke Identity Service, contoh `POST /register` dengan body data yang dibutuhkan untuk registrasi.
3. Identity service akan query DB untuk melakukan validasi bahwa email dan username belum pernah terdaftar sebelumnya.
4. Identity service akan menambahkan user ke DB bila validasi berhasil, atau memberi HTTP response error jika username sudah ada atau confirm password salah.
4. Identity service akan memberikan HTTP response `access token` dan `expiry time` dan user akan ter-login ke halaman catalog.
6. Silakan definisikan format request dan response sesuai kebutuhan anda. Anda dapat menggunakan JSON atau XML untuk REST.

#### Logout
1. Pengguna menekan tombol logout.
2. JSP akan melakukan HTTP request ke Identity Service, contoh `POST /logout` dengan body data yang dibutuhkan.
3. Identity service akan menghapus atau melakukan invalidasi terhadap access token yang diberikan.
4. Identity service akan mengembalikan HTTP response berhasil.
5. Halaman di-*redirect* ke halaman login.

#### Add Product, Search Product, Purchase Product dll
1. Pengguna mengakses halaman add product, misal `/add-product.jsp` dan mengisi form.
2. JSP akan memanggil fungsi pada *marketplace web service* dengan SOAP, misalnya `addProduct(access_token, name, description, price, image)`. Contohnya, dapat dilihat pada
[link berikut](http://www.mkyong.com/webservices/jax-ws/jax-ws-hello-world-example/)
Perhatikan pemanggilan pada contoh ini seperti melakukan remote procedure call.
3. Fungsi tersebut akan melakukan HTTP request ke Identity Service, untuk mengenali user dengan `access_token` yang diberikan.
    - Jika `access_token` **kadaluarsa**, maka `addProduct` akan memberikan response expired token.
    - Jika `access_token` **tidak valid**, maka `addProduct` akan memberikan response error ke JSP.
    - Jika `access_token` **valid**, maka `addProduct` akan memasukan produk ke DB, dan memberikan response kesuksesan ke JSP.
4. Jika `access_token` sudah kadaluarsa atau tidak valid (yang diketahui dari response error marketplace web service), sistem akan me-redirect user ke halaman login.
4. Untuk purchase product, like product, unlike product, edit product, delete product, get purchased products, get sold products kira-kira memiliki mekanisme yang sama dengan add product di atas.
5. Silakan definisikan format object request dan response sesuai kebutuhan anda.

#### Prosedur Demo
Sebelum demo, asisten akan melakukan checkout ke hash commit terakhir yang dilakukan sebelum deadline. Hal ini digunakan untuk memastikan kode yang akan didemokan adalah kode yang terakhir disubmit sebelum deadline.

#### Bonus
Anda tidak dituntut untuk mengerjakan ini. Tetapi bila Anda cukup dewa (baca=tertantang) silakan selesaikan permasalahan berikut:
- Mekanisme *auto-renew* access token yang tepat sehingga user tidak ter-logout secara paksa saat melakukan serangkaian aktivitas pada sistem dalam waktu yang cukup lama. Access token dapat di generate kembali ketika lifetime dari token tersebut habis. Cara implementasi dibebaskan.

Fokus terlebih dahulu menyelesaikan semua spesifikasi yang ada sebelum memikirkan bonus.

### Penjelasan
#### Basis Data dari Sistem yang Dibuat
Basis data sistem dipisahkan menjadi dua. Basis data yang pertama adalah basis data manajemen akun yang diberi nama **acc_management** Basis data yang kedua adalah basis data manajemen produk yang diberi nama **product_management**. Basis data *acc_management* berisi tabel *userdata* dan *tokendata*. Tabel *userdata* berisi informasi mengenai pengguna, yang didapat pada saat pengguna melakukan *register*. Tabel *tokendata* berisi token hasil *generate*, id user, dan waktu *token* di-*generate* (*start time*). Basis data *acc_management* digunakan untuk REST. Basis data *product_management* berisi informasi mengenai produk. *Product_management* terdiri dari tabel *likes* dan *catalogue*. Tabel *likes* berisi daftar produk (*product_id*) dan daftar pengguna yang menambahkan *like* pada produk tersebut. Tabel *catalogue* berisi informasi mengenai produk (id produk, nama produk, harga, deskripsi produk, *username* penjual, tanggal ditambahkan, waktu ditambahkan, jumlah *purchase*, serta *imagepath* yang berisi tempat disimpannya gambar produk). Basis data *product_management* digunakan untuk SOAP.   

#### Konsep *Shared Session* dengan Menggunakan REST
Sharing data dengan menggunakan REST diimplementasikan dengan cara cookie atau session. Token yang diperoleh pengguna pada saat melakukan login atau register disimpan pada session atau cookie agar dapat diakses secara global. 

#### Pembangkitan Token dan Expire Time pada Sistem yang Dibuat
Token di-*generate* pada saat pengguna melakukan *login* atau *register*. Token terdiri dari 20 digit karakter yang di-*generate* dari sekumpulan karakter "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz". Pada saat pengguna melakukan login atau register, token ditambahkan ke basis data. Token menjadi *expired* apabila dalam jangka waktu 5 menit pengguna tidak melakukan apa-apa pada *web*. Jika token *expired* maka pengguna akan dikembalikan ke halaman *login* dan token dihapus dari basis data. Saat pengguna melakukan *logout*, token juga dihapus dari basis data. 

#### Kelebihan dan Kelemahan dari Arsitektur Aplikasi Tugas Ini, Dibandingkan dengan Aplikasi Monolitik
Kelebihan dari arsitektur aplikasi tugas ini adalah :
Pengaksesan data pada arsitektur ini lebih aman karena menggunakan token dan session. Informasi pengguna diubah menjadi token dan dimasukkan ke session agar bisa diakses secara global. Selain itu, session bisa diatur waktu *expired*-nya. Oleh karena itu, informasi pengguna sulit untuk diakses sembarangan oleh pihak lain jika dibandingkan dengan aplikasi monolitik yang informasi penggunanya di-*pass* melalui URL. 

Kekurangan dari arsitektur aplikasi tugas ini adalah :
Pengaksesan data dari basis data menjadi lebih lambat dibandingkan dengan aplikasi monolitik karena basis data dipisah menjadi dua.

### Pembagian Tugas


REST :
1. Generate token : 13513074
2. Validasi token : 13513070
3. Servlet Register : 13513074
4. Servlet Login : 13513074
5. Servlet Logout : 13514004

SOAP :
1. Add Product : 13514070
2. Edit Product : 13514070
3. Delete Product : 13514070
4. Search Product : 13514074
5. Like Product : 13514074
6. Unlike Product : 13514074
7. Purchase Product : 13514004
8. Get Purchased Product : 13514004
9. Get Sold Product : 13514004


Web app (JSP) :
1. Halaman Login : 13514074
2. Halaman Register : 13514074
3. Halaman Catalog : 13514074
4. Halaman Your Product : 13514070
5. Halaman Edit Product : 13514070
6. Halaman Add Product : 13514070
7. Halaman Sales : 13514004
8. Halaman Purchase : 13514004
9. Halaman Confirm Purhase : 13514004

## About

Team Keket

Catherine Pricilla | Dendy Suprihady | Scarletta Julia Yapfrine

Asisten IF3110 2016

Adin | Chairuni | David | Natan | Nilta | Tifani | Wawan | William

Dosen : Yudistira Dwi Wardhana | Riza Satria Perdana
