USE [ikinciElKitapSatis]
GO
/****** Object:  Table [dbo].[HAKKIMIZDA]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HAKKIMIZDA](
	[HAKKIMIZDAID] [smallint] IDENTITY(1,1) NOT NULL,
	[HAKKIMIZDAACIKLAMA] [varchar](1000) NULL,
	[SPONSORRESIM] [varchar](50) NULL,
	[SPONSORISIM] [varchar](20) NULL,
 CONSTRAINT [PK_HAKKIMIZDA] PRIMARY KEY CLUSTERED 
(
	[HAKKIMIZDAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ILETISIM]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ILETISIM](
	[ILETISIMID] [smallint] IDENTITY(1,1) NOT NULL,
	[ILETISIMADRES] [varchar](200) NULL,
	[ILETISIMTEL] [varchar](15) NULL,
	[ILETISIMMAIL] [varchar](50) NULL,
 CONSTRAINT [PK_ILETISIM] PRIMARY KEY CLUSTERED 
(
	[ILETISIMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KATEGORILER]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KATEGORILER](
	[KATEGORIID] [int] IDENTITY(1,1) NOT NULL,
	[KATEGORIAD] [varchar](20) NULL,
 CONSTRAINT [PK_KATEGORILER] PRIMARY KEY CLUSTERED 
(
	[KATEGORIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KITAPLAR]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KITAPLAR](
	[BARKOD] [int] IDENTITY(1,1) NOT NULL,
	[KITAPADI] [varchar](50) NULL,
	[KITAPRESMI] [varchar](100) NULL,
	[KITAPACIKLAMA] [varchar](200) NULL,
	[YAYINTARIHI] [datetime] NULL,
	[FIYAT] [decimal](4, 2) NULL,
	[STOKMIKTARI] [int] NULL,
	[KATEGORIID] [int] NULL,
	[YAZARID] [int] NULL,
	[YAYINEVIID] [int] NULL,
 CONSTRAINT [PK_KITAPLAR] PRIMARY KEY CLUSTERED 
(
	[BARKOD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KULLANICILAR]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KULLANICILAR](
	[KULLANICIID] [int] IDENTITY(1,1) NOT NULL,
	[KULLANICIADI] [varchar](20) NOT NULL,
	[SIFRE] [varchar](30) NOT NULL,
	[ADMINYETKISI] [char](1) NOT NULL,
 CONSTRAINT [PK_KULLANICILAR] PRIMARY KEY CLUSTERED 
(
	[KULLANICIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MESAJLAR]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MESAJLAR](
	[MESAJID] [int] IDENTITY(1,1) NOT NULL,
	[ADSOYAD] [varchar](30) NULL,
	[MAIL] [varchar](50) NULL,
	[MESAJ] [varchar](300) NULL,
	[TARIH] [datetime] NULL,
 CONSTRAINT [PK_MESAJLAR] PRIMARY KEY CLUSTERED 
(
	[MESAJID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SATISLAR]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SATISLAR](
	[SATISID] [int] IDENTITY(1,1) NOT NULL,
	[KULLANICIID] [int] NULL,
	[TARIH] [datetime] NULL,
	[TOPLAMTUTAR] [decimal](6, 2) NULL,
	[SIPARISID] [int] NULL,
 CONSTRAINT [PK_SATISLAR] PRIMARY KEY CLUSTERED 
(
	[SATISID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIPARISLER]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIPARISLER](
	[SIPARISID] [int] IDENTITY(1,1) NOT NULL,
	[KULLANICIID] [int] NULL,
	[TARIH] [datetime] NULL,
	[BIRIMTUTAR] [decimal](4, 2) NULL,
	[TOPLAMTUTAR] [decimal](6, 2) NULL,
	[ADET] [int] NULL,
	[ADRES] [varchar](200) NULL,
	[TELEFON] [varchar](11) NULL,
	[EPOSTA] [varchar](35) NULL,
	[BARKOD] [int] NULL,
 CONSTRAINT [PK_SIPARISLER] PRIMARY KEY CLUSTERED 
(
	[SIPARISID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YAYINEVLERI]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YAYINEVLERI](
	[YAYINEVIID] [int] IDENTITY(1,1) NOT NULL,
	[YAYINEVIADI] [varchar](30) NULL,
	[ADRES] [varchar](50) NULL,
	[TELEFON] [varchar](11) NULL,
	[EPOSTA] [varchar](50) NULL,
 CONSTRAINT [PK_YAYINEVLERI] PRIMARY KEY CLUSTERED 
(
	[YAYINEVIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YAZARLAR]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YAZARLAR](
	[YAZARID] [int] IDENTITY(1,1) NOT NULL,
	[YAZARADI] [varchar](30) NULL,
	[ULUS] [varchar](20) NULL,
 CONSTRAINT [PK_YAZARLAR] PRIMARY KEY CLUSTERED 
(
	[YAZARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YORUMLAR]    Script Date: 11.08.2023 17:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YORUMLAR](
	[YORUMID] [int] IDENTITY(1,1) NOT NULL,
	[BARKOD] [int] NULL,
	[YORUM] [varchar](150) NULL,
	[TARIH] [datetime] NULL,
	[KULLANICIID] [int] NULL,
 CONSTRAINT [PK_YORUMLAR] PRIMARY KEY CLUSTERED 
(
	[YORUMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HAKKIMIZDA] ON 

INSERT [dbo].[HAKKIMIZDA] ([HAKKIMIZDAID], [HAKKIMIZDAACIKLAMA], [SPONSORRESIM], [SPONSORISIM]) VALUES (1, N'Binlerce Kitap Seçeneği : D&R kitap satış sitesi, geniş koleksiyonuyla her türden kitap tutkununa hitap ediyor.', N'client-1.png', N'Myob')
INSERT [dbo].[HAKKIMIZDA] ([HAKKIMIZDAID], [HAKKIMIZDAACIKLAMA], [SPONSORRESIM], [SPONSORISIM]) VALUES (2, N'Hızlı ve Güvenilir Teslimat : Alışveriş keyfinizi kesintiye uğratmadan kitaplarınızı kapınıza kadar getiriyoruz.', N'client-2.png', N'Belimo')
INSERT [dbo].[HAKKIMIZDA] ([HAKKIMIZDAID], [HAKKIMIZDAACIKLAMA], [SPONSORRESIM], [SPONSORISIM]) VALUES (3, N'Uygun Fiyatlar ve İndirimler : Kitapseverleri düşünüyor, bütçenize uygun fiyatlar sunuyoruz.', N'client-3.png', N'LifeGroups')
INSERT [dbo].[HAKKIMIZDA] ([HAKKIMIZDAID], [HAKKIMIZDAACIKLAMA], [SPONSORRESIM], [SPONSORISIM]) VALUES (4, N'Yeni ve Popüler Kitaplar : Her zaman en yeni ve popüler kitapları takip ediyoruz.', N'client-4.png', N'Lilly')
INSERT [dbo].[HAKKIMIZDA] ([HAKKIMIZDAID], [HAKKIMIZDAACIKLAMA], [SPONSORRESIM], [SPONSORISIM]) VALUES (5, N'Kullanıcı Dostu Arayüz : D&R kitap satış sitesi, kolay kullanım ve güvenlik önlemleriyle öne çıkıyor.', N'client-5.png', N'Citrus')
INSERT [dbo].[HAKKIMIZDA] ([HAKKIMIZDAID], [HAKKIMIZDAACIKLAMA], [SPONSORRESIM], [SPONSORISIM]) VALUES (6, N'Edebiyat Dünyasına Dair İlgi Çekici İçerikler : Sadece kitap satışı değil, aynı zamanda kültür dünyasına dair zengin içerikler sunuyoruz.', N'client-6.png', N'Trustly')
SET IDENTITY_INSERT [dbo].[HAKKIMIZDA] OFF
GO
SET IDENTITY_INSERT [dbo].[ILETISIM] ON 

INSERT [dbo].[ILETISIM] ([ILETISIMID], [ILETISIMADRES], [ILETISIMTEL], [ILETISIMMAIL]) VALUES (1, N'Kardelen Mah. Manolya Sok. No:24-Daire:26 / Şişli-istanbul', N'90 212 597 1818', N'dr@gmail.com')
SET IDENTITY_INSERT [dbo].[ILETISIM] OFF
GO
SET IDENTITY_INSERT [dbo].[KATEGORILER] ON 

INSERT [dbo].[KATEGORILER] ([KATEGORIID], [KATEGORIAD]) VALUES (1, N'Aksiyon')
INSERT [dbo].[KATEGORILER] ([KATEGORIID], [KATEGORIAD]) VALUES (2, N'Eğitim')
INSERT [dbo].[KATEGORILER] ([KATEGORIID], [KATEGORIAD]) VALUES (3, N'Hikaye')
INSERT [dbo].[KATEGORILER] ([KATEGORIID], [KATEGORIAD]) VALUES (4, N'Roman')
INSERT [dbo].[KATEGORILER] ([KATEGORIID], [KATEGORIAD]) VALUES (6, N'Felsefik')
SET IDENTITY_INSERT [dbo].[KATEGORILER] OFF
GO
SET IDENTITY_INSERT [dbo].[KITAPLAR] ON 

INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080502, N'Sapiens', N'https://i.hizliresim.com/fsuna9b.jpg', N'İnsanlık tarihine ve evrimine derinlemesine bir bakış sunan bilimsel bir çalışma.', CAST(N'2023-08-01T02:04:46.590' AS DateTime), CAST(55.00 AS Decimal(4, 2)), 15, 2, 2, 2)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080503, N'Harry Potter ve Felsefe Taşı', N'https://i.hizliresim.com/smh0gge.jpg', N'Genç bir büyücü olan Harry Potter''ın maceralarının başlangıcını anlatan sihirli bir roman.', CAST(N'2023-08-01T02:05:19.627' AS DateTime), CAST(50.00 AS Decimal(4, 2)), 25, 3, 3, 3)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080504, N'Bin Muhteşem Güneş', N'https://i.hizliresim.com/63ykx92.jpg', N'Afganistan''da yaşanan trajik olaylar ve dostlukları anlatan etkileyici bir edebi eser.', CAST(N'2023-08-01T02:05:51.623' AS DateTime), CAST(35.00 AS Decimal(4, 2)), 35, 4, 4, 4)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080505, N'Uğultulu Tepeler', N'https://i.hizliresim.com/aca70cc.jpg', N'İntikam, aşk ve aile bağlarının karmaşasını işleyen klasik roman.', CAST(N'2023-08-01T02:09:55.490' AS DateTime), CAST(25.00 AS Decimal(4, 2)), 10, 4, 5, 5)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080506, N'Küçük Prens', N'https://i.hizliresim.com/9ygv08n.jpg', N'Çocuklara ve yetişkinlere yönelik derin anlamlar barındıran masalsı bir kitap.', CAST(N'2023-08-01T02:59:04.193' AS DateTime), CAST(20.00 AS Decimal(4, 2)), 50, 1, 6, 6)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080507, N'Bülbülü Öldürmek', N'https://i.hizliresim.com/h1vwdaa.jpg', N'Irkçılık ve adaletsizliğin ele alındığı sarsıcı bir Amerikan edebiyat klasiği.', CAST(N'2023-08-01T02:59:32.787' AS DateTime), CAST(25.00 AS Decimal(4, 2)), 25, 1, 7, 7)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080508, N'Dönüşüm', N'https://i.hizliresim.com/57n9o1p.jpg', N'Bir sabah kendini dev bir böceğe dönüşmüş olarak bulan bir adamın hikayesi.', CAST(N'2023-08-01T03:01:15.497' AS DateTime), CAST(27.00 AS Decimal(4, 2)), 10, 2, 8, 8)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080509, N'Sessizliğin Müzesi', N'https://i.hizliresim.com/td1iltw.jpg', N'Nazi Almanyası''nda geçen, savaşın insan psikolojisi üzerindeki etkilerini anlatan bir roman.', CAST(N'2023-08-01T03:02:22.147' AS DateTime), CAST(55.00 AS Decimal(4, 2)), 5, 3, 9, 9)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080510, N'Dune', N'https://i.hizliresim.com/amuq1ll.jpg', N'Bilim kurgu ve epik fantezi türlerini birleştiren uzak gezegenlerde geçen bir başyapıt.', CAST(N'2023-08-01T03:03:29.150' AS DateTime), CAST(35.00 AS Decimal(4, 2)), 10, 4, 10, 10)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080511, N'Otomatik Portakal', N'https://i.hizliresim.com/o0a4b0r.jpg', N'Toplumsal şiddet ve özgürlük kavramlarına eleştirel bir bakış atan distopik bir roman.', CAST(N'2023-08-01T03:04:07.480' AS DateTime), CAST(20.00 AS Decimal(4, 2)), 20, 4, 11, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080512, N'Simyacı', N'https://i.hizliresim.com/oadyx8l.jpg', N' Bir alkimistin yolculuğunu ve kişisel dönüşümünü konu alan ilham verici bir eser.', CAST(N'2023-08-01T03:04:52.430' AS DateTime), CAST(30.00 AS Decimal(4, 2)), 35, 4, 12, 2)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080513, N'Yerdeniz Büyücüsü', N'https://i.hizliresim.com/9pv5rnw.jpg', N'Fantastik bir dünyada geçen, büyü ve macerayla dolu bir fantastik roman.', CAST(N'2023-08-01T11:39:36.600' AS DateTime), CAST(23.00 AS Decimal(4, 2)), 50, 4, 13, 2)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080514, N'Kırmızı Pazartesi', N'https://i.hizliresim.com/oa4axub.png', N'Hayatın anlamını arayan bir adamın, tuhaf olaylar silsilesi içindeki serüveni.', CAST(N'2023-08-01T11:39:41.380' AS DateTime), CAST(20.00 AS Decimal(4, 2)), 20, 2, 14, 2)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080515, N'Sherlock Holmes: Bütün Hikayeleri', N'https://i.hizliresim.com/mng158y.jpg', N'Dedektif Sherlock Holmes ve yardımcısı Dr. Watsonın maceralarının tamamını içeren kitap.', CAST(N'2023-08-01T11:39:44.960' AS DateTime), CAST(35.00 AS Decimal(4, 2)), 10, 1, 15, 3)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080516, N'Beyaz Diş', N'https://i.hizliresim.com/jxehypr.jpg', N'Vahşi doğada hayatta kalma mücadelesi veren bir kurdu konu alan çocuk kitabı.', CAST(N'2023-08-01T11:39:48.053' AS DateTime), CAST(14.00 AS Decimal(4, 2)), 5, 1, 16, 3)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080517, N'Yüzyıllık Yalnızlık', N'https://i.hizliresim.com/2wy0f1k.jpg', N'Bir ailenin beş kuşak boyunca yaşadığı olağanüstü ve fantastik hikayesi.', CAST(N'2023-08-01T11:39:53.267' AS DateTime), CAST(26.00 AS Decimal(4, 2)), 5, 1, 17, 3)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080518, N'Büyülü Dağ', N'https://i.hizliresim.com/a2ifkw8.jpg', N'Zamanın anlamını sorgulayan mistik bir yolculuğun anlatıldığı klasik eser.', CAST(N'2023-08-01T11:39:55.363' AS DateTime), CAST(31.00 AS Decimal(4, 2)), 20, 1, 18, 4)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080519, N'Uyanış', N'https://i.hizliresim.com/d538hp4.jpg', N'İnsanın ruhsal gelişimi ve kendini bulma sürecini anlatan ruhani bir kitap.', CAST(N'2023-08-01T11:39:58.463' AS DateTime), CAST(18.00 AS Decimal(4, 2)), 40, 2, 19, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080520, N'Yaban Diyarlarda Yabancı', N'https://i.hizliresim.com/c258zzu.png', N'Alaska"daki vahşi doğada hayatta kalma mücadelesi veren bir adamın gerçek hikayesi.', CAST(N'2023-08-01T11:40:00.173' AS DateTime), CAST(21.00 AS Decimal(4, 2)), 70, 4, 20, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080521, N'Fahrenheit 451', N'https://i.hizliresim.com/k7lgpz8.jpg', N'Gelecekte kitap okumanın yasaklandığı bir distopik dünyayı ele alan bilim kurgu klasiği.', CAST(N'2023-08-01T11:50:21.923' AS DateTime), CAST(17.00 AS Decimal(4, 2)), 40, 3, 21, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080522, N'Melezler', N'https://i.hizliresim.com/3bx3rdo.jpg', N'Türkiye"nin farklı coğrafyalarındaki farklı kültürleri harmanlayan bir edebi eser.', CAST(N'2023-08-01T11:50:29.960' AS DateTime), CAST(20.00 AS Decimal(4, 2)), 60, 1, 22, 5)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080523, N'Beyaz Gemi', N'https://i.hizliresim.com/2gro1jq.jpg', N'Bir deniz yolculuğunda geçen, insana dair derin düşüncelere sahip çocuk kitabı.', CAST(N'2023-08-01T11:50:33.203' AS DateTime), CAST(15.00 AS Decimal(4, 2)), 30, 4, 23, 6)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080524, N'Uçurtma Avcısı', N'https://i.hizliresim.com/rs8pj4e.jpg', N'Afganistan"da geçen, arkadaşlık, ihanet ve kurtuluş hikayesini anlatan etkileyici bir roman.', CAST(N'2023-08-01T11:50:35.327' AS DateTime), CAST(21.00 AS Decimal(4, 2)), 25, 1, 24, 6)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080526, N'Anna Karenina', N'https://i.hizliresim.com/ma4v22l.jpg', N'19. yüzyıl Rusya"sının sosyal çalkantılarını ve Anna Karenina"nın trajedisini anlatan roman.', CAST(N'2023-08-01T11:50:39.573' AS DateTime), CAST(28.00 AS Decimal(4, 2)), 55, 3, 26, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080527, N'Hobbit', N'https://i.hizliresim.com/ryr082x.jpg', N'Orta Dünya"da geçen, klasik fantastik macera romanı.', CAST(N'2023-08-01T11:50:41.033' AS DateTime), CAST(26.00 AS Decimal(4, 2)), 15, 4, 27, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080528, N'Mein Kampf (Kavgam)', N'https://i.hizliresim.com/tszdlxm.jpg', N'Adolf Hitler"in otobiyografik ve siyasi manifesto niteliğindeki eseri.', CAST(N'2023-08-01T11:50:44.817' AS DateTime), CAST(24.00 AS Decimal(4, 2)), 15, 1, 28, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080529, N'Satranç', N'https://i.hizliresim.com/g3fes7d.jpg', N'Zihin oyunlarına, satranç metaforu üzerinden yapılan alegorik bir anlatım.', CAST(N'2023-08-01T11:50:47.060' AS DateTime), CAST(13.00 AS Decimal(4, 2)), 10, 2, 29, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080530, N'Yaşamak', N'https://i.hizliresim.com/2sw0az4.png', N'Ünlü yazarın hayatına dair anıları, düşünceleri ve yaşamı sorgulayan bir deneme.', CAST(N'2023-08-01T11:50:48.440' AS DateTime), CAST(19.00 AS Decimal(4, 2)), 20, 2, 30, 8)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080531, N'Hayvan Çiftliği', N'https://i.hizliresim.com/te6ytol.jpg', N'Hayvanlar arasındaki bir devrimi ve sonrasında yaşananları eleştirel bir şekilde anlatan roman.', CAST(N'2023-08-01T11:50:49.743' AS DateTime), CAST(16.00 AS Decimal(4, 2)), 35, 1, 31, 8)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080532, N'Romeo ve Juliet', N'https://i.hizliresim.com/rfa3sso.png', N'Aşk ve düşmanlık arasında geçen, Shakespeare"in ünlü trajedisini anlatan oyun.', CAST(N'2023-08-01T11:50:52.027' AS DateTime), CAST(17.00 AS Decimal(4, 2)), 45, 1, 32, 9)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080533, N'Uykulu Kuytu Söylencesi', N'https://i.hizliresim.com/gf9b51v.jpg', N'Türk mitolojisinin eşsiz kahramanlarından olan Oğuz Kağan"ın destansı hikayesi.', CAST(N'2023-08-01T11:50:53.190' AS DateTime), CAST(14.00 AS Decimal(4, 2)), 80, 1, 33, 10)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080534, N'İnsan Neyle Yaşar?', N'https://i.hizliresim.com/8djqpwx.jpg', N'Bilgelik ve düşünce deneylerine yer veren Dostoyevski kısa hikayeleri.', CAST(N'2023-08-01T11:50:54.533' AS DateTime), CAST(15.00 AS Decimal(4, 2)), 90, 4, 34, 8)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080535, N'Ölü Canlar', N'https://i.hizliresim.com/qcboa5b.jpg', N'Rus toplumunu hicveden, güçlü bir çiftçi imajı çizen Gogol klasik eseri.', CAST(N'2023-08-01T11:50:56.887' AS DateTime), CAST(21.00 AS Decimal(4, 2)), 50, 2, 35, 8)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080536, N'Kürk Mantolu Madonna', N'https://i.hizliresim.com/mbjw15t.png', N'Aşk acısı ve kaybın hüznünü anlatan ünlü Türk edebiyatı romanı.', CAST(N'2023-08-01T11:50:59.430' AS DateTime), CAST(18.00 AS Decimal(4, 2)), 50, 2, 36, 9)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080537, N'Yabancı', N'https://i.hizliresim.com/to3alza.jpg', N'Toplumun normlarına uymayan bir adamın yalnızlığını ve yabancılaşmasını konu alan roman.', CAST(N'2023-08-01T11:51:00.903' AS DateTime), CAST(20.00 AS Decimal(4, 2)), 50, 4, 37, 9)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080538, N'Yiyecekler Kitabı', N'https://i.hizliresim.com/ozgbkna.jpg', N'Lezzetli yemek tariflerini içeren ünlü şef Yotam Ottolenghi"nin kitabı.', CAST(N'2023-08-01T11:51:03.723' AS DateTime), CAST(25.00 AS Decimal(4, 2)), 40, 3, 38, 7)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080539, N'Suç ve Ceza', N'https://i.hizliresim.com/k9d239w.jpg', N'Sokolov"un romanı doğru okuyup okumadığını sorgulayan, Dostoyevski"nin klasik romanı.', CAST(N'2023-08-01T11:51:05.403' AS DateTime), CAST(27.00 AS Decimal(4, 2)), 30, 3, 39, 6)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080540, N'Serenad', N'https://i.hizliresim.com/khnay54.jpg', N'Bir aşk üçgenini, tutkuyu ve müziği anlatan Orhan Pamuk eseri.', CAST(N'2023-08-01T11:51:07.450' AS DateTime), CAST(22.00 AS Decimal(4, 2)), 10, 3, 40, 6)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080542, N'Büyücü', N'https://i.hizliresim.com/ktqfv8e.jpg', N'Hogwarts Cadılık ve Büyücülük Okulu"nda geçen Harry Potter serisinin üçüncü kitabı.', CAST(N'2023-08-01T11:51:12.647' AS DateTime), CAST(19.00 AS Decimal(4, 2)), 5, 1, 42, 4)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080543, N'80 Günde Devri Alem', N'https://i.hizliresim.com/6y3bfmf.jpg', N'Gelecekte kitap okumanın yasaklandığı bir distopik dünyayı ele alan bilim kurgu klasiği.', CAST(N'2023-08-01T11:51:14.077' AS DateTime), CAST(17.00 AS Decimal(4, 2)), 15, 3, 43, 4)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080544, N'Bir Ömür Nasıl Yaşanır ?', N'https://i.hizliresim.com/fmkqzz9.png', N'Türkiye"nin farklı coğrafyalarındaki farklı kültürleri harmanlayan bir edebi eser.', CAST(N'2023-08-01T11:51:15.303' AS DateTime), CAST(20.00 AS Decimal(4, 2)), 25, 4, 44, 5)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080545, N'Kara Kule: Silahşör', N'https://i.hizliresim.com/gszv00t.jpg', N'Bir deniz yolculuğunda geçen, insana dair derin düşüncelere sahip çocuk kitabı.', CAST(N'2023-08-01T11:51:17.810' AS DateTime), CAST(15.00 AS Decimal(4, 2)), 24, 2, 45, 5)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080546, N'Bilinmeyen Bir Kadının Mektubu', N'https://i.hizliresim.com/lf764k4.jpg', N'Afganistan"da geçen, arkadaşlık, ihanet ve kurtuluş hikayesini anlatan etkileyici bir roman.', CAST(N'2023-08-01T11:51:19.357' AS DateTime), CAST(21.00 AS Decimal(4, 2)), 27, 1, 46, 5)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080547, N'Tutunamayanlar', N'https://i.hizliresim.com/dw3o72o.jpg', N'Hayatla ölüm arasındaki ruhsal çatışmayı ele alan Dostoyevski klasiği.', CAST(N'2023-08-01T11:51:21.880' AS DateTime), CAST(23.00 AS Decimal(4, 2)), 12, 1, 47, 4)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080548, N'İntihar Üzerine Notlar', N'https://i.hizliresim.com/qjsrkvg.jpg', N'19. yüzyıl Rusya"sının sosyal çalkantılarını ve Anna Karenina"nın trajedisini anlatan roman.', CAST(N'2023-08-01T11:51:23.633' AS DateTime), CAST(28.00 AS Decimal(4, 2)), 14, 4, 48, 4)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080549, N'Bir Dinozorun Anıları', N'https://i.hizliresim.com/igex7ci.jpg', N'Orta Dünya"da geçen, klasik fantastik macera romanı.', CAST(N'2023-08-01T11:51:25.680' AS DateTime), CAST(26.00 AS Decimal(4, 2)), 38, 4, 49, 4)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080550, N'Sefiller', N'https://i.hizliresim.com/ewtcbdu.jpg', N'Jean Valjean"ın dramatik hikayesini anlatan Fransız edebiyatının klasik romanlarından biri.', CAST(N'2023-08-01T11:51:27.433' AS DateTime), CAST(24.00 AS Decimal(4, 2)), 26, 2, 50, 2)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080551, N'Yüzüklerin Efendisi: Yüzük Kardeşliği', N'https://i.hizliresim.com/r91rhsj.jpg', N'Orta Dünya"da geçen, epik fantastik üçlemenin ilk kitabı.', CAST(N'2023-08-01T11:51:29.570' AS DateTime), CAST(30.00 AS Decimal(4, 2)), 24, 3, 51, 2)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080552, N'Kendine Ait Bir Oda', N'https://i.hizliresim.com/ibgtdtf.jpg', N'Kadın yazarın yaratıcılığı için gerekli koşulları ele alan feminizm klasiklerinden bir deneme.', CAST(N'2023-08-01T11:51:31.713' AS DateTime), CAST(18.00 AS Decimal(4, 2)), 29, 2, 52, 2)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080553, N'Körlük', N'https://i.hizliresim.com/e35n8nq.jpg', N'Bir şehirde salgın bir hastalıkla herkesin kör olduğu karanlık bir dönemi anlatan etkileyici bir roman.', CAST(N'2023-08-01T11:51:33.537' AS DateTime), CAST(22.00 AS Decimal(4, 2)), 32, 2, 53, 3)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080554, N'Beyaz Zambaklar Ülkesinde', N'https://i.hizliresim.com/i4rltui.jpg', N'Eğitimin ve öğretmenin önemini anlatan çocuk edebiyatı klasiklerinden bir eser.', CAST(N'2023-08-01T11:51:34.787' AS DateTime), CAST(16.00 AS Decimal(4, 2)), 62, 2, 54, 3)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080555, N'Dünya Edebiyatında Büyük Aşk Şiirleri', N'https://i.hizliresim.com/9eui04o.jpg', N'Dünya edebiyatının farklı dönemlerinden büyük aşk şairlerinin şiirleri.', CAST(N'2023-08-01T11:51:37.720' AS DateTime), CAST(19.00 AS Decimal(4, 2)), 22, 3, 55, 3)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080556, N'Bir Ada Hikayesi', N'https://i.hizliresim.com/483idvr.jpg', N'Vahşi doğada hayatta kalma mücadelesi veren bir kurdu konu alan çocuk kitabı.', CAST(N'2023-08-01T11:54:55.457' AS DateTime), CAST(14.00 AS Decimal(4, 2)), 45, 3, 56, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080557, N'Sessiz Ev', N'https://i.hizliresim.com/8lwjakc.png', N'Korku ve gerilim türündeki, esrarengiz bir evde yaşanan ürkütücü olayları konu alan roman.', CAST(N'2023-08-01T11:54:57.477' AS DateTime), CAST(24.00 AS Decimal(4, 2)), 43, 2, 57, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080558, N'Ejderhaların Dansı', N'https://i.hizliresim.com/m8f4fuw.jpg', N'Irkçılık ve adaletsizliğin ele alındığı sarsıcı bir Amerikan edebiyat klasiği.', CAST(N'2023-08-01T11:54:59.973' AS DateTime), CAST(21.00 AS Decimal(4, 2)), 34, 1, 58, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080559, N'Kara Kutu', N'https://i.hizliresim.com/ngvw7va.jpg', N'Bir uçak kazasında hayatını kaybeden kişilerin gözünden hayatı anlatan özgün bir roman.', CAST(N'2023-08-01T11:55:01.853' AS DateTime), CAST(15.00 AS Decimal(4, 2)), 43, 4, 59, 1)
INSERT [dbo].[KITAPLAR] ([BARKOD], [KITAPADI], [KITAPRESMI], [KITAPACIKLAMA], [YAYINTARIHI], [FIYAT], [STOKMIKTARI], [KATEGORIID], [YAZARID], [YAYINEVIID]) VALUES (1905080560, N'Sineklerin Tanrısı', N'https://i.hizliresim.com/8g3ys4a.png', N'Bir grup çocuğun terkedilmiş bir adada geçirdiği trajik hikayeyi anlatan roman.', CAST(N'2023-08-01T11:55:03.350' AS DateTime), CAST(19.00 AS Decimal(4, 2)), 28, 4, 60, 2)
SET IDENTITY_INSERT [dbo].[KITAPLAR] OFF
GO
SET IDENTITY_INSERT [dbo].[KULLANICILAR] ON 

INSERT [dbo].[KULLANICILAR] ([KULLANICIID], [KULLANICIADI], [SIFRE], [ADMINYETKISI]) VALUES (1, N'sedat', N'123', N'A')
INSERT [dbo].[KULLANICILAR] ([KULLANICIID], [KULLANICIADI], [SIFRE], [ADMINYETKISI]) VALUES (2, N'mustafa', N'123', N'M')
INSERT [dbo].[KULLANICILAR] ([KULLANICIID], [KULLANICIADI], [SIFRE], [ADMINYETKISI]) VALUES (3, N'mehmet', N'123', N'K')
SET IDENTITY_INSERT [dbo].[KULLANICILAR] OFF
GO
SET IDENTITY_INSERT [dbo].[MESAJLAR] ON 

INSERT [dbo].[MESAJLAR] ([MESAJID], [ADSOYAD], [MAIL], [MESAJ], [TARIH]) VALUES (1, N'Sedat Ayyıldız', N'sedat@gmail.com', N'İŞ TEKLİFİ', CAST(N'2023-08-02T14:44:02.537' AS DateTime))
INSERT [dbo].[MESAJLAR] ([MESAJID], [ADSOYAD], [MAIL], [MESAJ], [TARIH]) VALUES (2, N'Mehmet Aslan', N'muhammet@gmail.com', N'Nutuk kitabı yakın zamanda satışa çıkacak mı ?', CAST(N'2023-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[MESAJLAR] ([MESAJID], [ADSOYAD], [MAIL], [MESAJ], [TARIH]) VALUES (3, N'Mehmet Cavcav', N'ilhan.cavcav62@gmail.com', N'Fazla kitap var mi ?', CAST(N'2023-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[MESAJLAR] ([MESAJID], [ADSOYAD], [MAIL], [MESAJ], [TARIH]) VALUES (5, N'Mustafa Abi', N'mustafa@hotmail.com', N'Eleman eksiği var mı ?', CAST(N'2023-08-08T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[MESAJLAR] OFF
GO
SET IDENTITY_INSERT [dbo].[SATISLAR] ON 

INSERT [dbo].[SATISLAR] ([SATISID], [KULLANICIID], [TARIH], [TOPLAMTUTAR], [SIPARISID]) VALUES (2, 1, CAST(N'2023-02-08T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(6, 2)), 6)
INSERT [dbo].[SATISLAR] ([SATISID], [KULLANICIID], [TARIH], [TOPLAMTUTAR], [SIPARISID]) VALUES (16, 1, CAST(N'2023-08-09T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(6, 2)), 6)
INSERT [dbo].[SATISLAR] ([SATISID], [KULLANICIID], [TARIH], [TOPLAMTUTAR], [SIPARISID]) VALUES (17, 2, CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(175.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[SATISLAR] ([SATISID], [KULLANICIID], [TARIH], [TOPLAMTUTAR], [SIPARISID]) VALUES (18, 2, CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(52.00 AS Decimal(6, 2)), 28)
INSERT [dbo].[SATISLAR] ([SATISID], [KULLANICIID], [TARIH], [TOPLAMTUTAR], [SIPARISID]) VALUES (19, 2, CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(52.00 AS Decimal(6, 2)), 28)
INSERT [dbo].[SATISLAR] ([SATISID], [KULLANICIID], [TARIH], [TOPLAMTUTAR], [SIPARISID]) VALUES (20, 2, CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(52.00 AS Decimal(6, 2)), 28)
SET IDENTITY_INSERT [dbo].[SATISLAR] OFF
GO
SET IDENTITY_INSERT [dbo].[SIPARISLER] ON 

INSERT [dbo].[SIPARISLER] ([SIPARISID], [KULLANICIID], [TARIH], [BIRIMTUTAR], [TOPLAMTUTAR], [ADET], [ADRES], [TELEFON], [EPOSTA], [BARKOD]) VALUES (6, 1, CAST(N'2023-06-02T00:00:00.000' AS DateTime), CAST(10.00 AS Decimal(4, 2)), CAST(100.00 AS Decimal(6, 2)), 10, N'İstanbul / Türkiye', N'05355353553', N'sedat@gmail.com', 1905080502)
INSERT [dbo].[SIPARISLER] ([SIPARISID], [KULLANICIID], [TARIH], [BIRIMTUTAR], [TOPLAMTUTAR], [ADET], [ADRES], [TELEFON], [EPOSTA], [BARKOD]) VALUES (25, 1, CAST(N'2023-06-02T00:00:00.000' AS DateTime), CAST(55.00 AS Decimal(4, 2)), CAST(275.00 AS Decimal(6, 2)), 5, N'Tokat / Türkiye', N'05555555555', N'sedat@gmail.com', 1905080502)
INSERT [dbo].[SIPARISLER] ([SIPARISID], [KULLANICIID], [TARIH], [BIRIMTUTAR], [TOPLAMTUTAR], [ADET], [ADRES], [TELEFON], [EPOSTA], [BARKOD]) VALUES (26, 2, CAST(N'2023-06-03T00:00:00.000' AS DateTime), CAST(25.00 AS Decimal(4, 2)), CAST(125.00 AS Decimal(6, 2)), 5, N'Ordu / Türkiye', N'02222222222', N'mustafa@gmail.com', 1905080505)
INSERT [dbo].[SIPARISLER] ([SIPARISID], [KULLANICIID], [TARIH], [BIRIMTUTAR], [TOPLAMTUTAR], [ADET], [ADRES], [TELEFON], [EPOSTA], [BARKOD]) VALUES (27, 2, CAST(N'2023-06-04T00:00:00.000' AS DateTime), CAST(35.00 AS Decimal(4, 2)), CAST(175.00 AS Decimal(6, 2)), 5, N'Maraş / Türkiye', N'02122522552', N'mustafa@gmail.com', 1905080515)
INSERT [dbo].[SIPARISLER] ([SIPARISID], [KULLANICIID], [TARIH], [BIRIMTUTAR], [TOPLAMTUTAR], [ADET], [ADRES], [TELEFON], [EPOSTA], [BARKOD]) VALUES (28, 2, CAST(N'2023-06-05T00:00:00.000' AS DateTime), CAST(26.00 AS Decimal(4, 2)), CAST(52.00 AS Decimal(6, 2)), 2, N'Giresun / Türkiye', N'03123566552', N'mustafa@gmail.com', 1905080527)
SET IDENTITY_INSERT [dbo].[SIPARISLER] OFF
GO
SET IDENTITY_INSERT [dbo].[YAYINEVLERI] ON 

INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (1, N'İŞLER', N'İstanbul / Türkiye', N'02125971818', N'isler@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (2, N'LİMİT', N'Ordu / Türkiye', N'02125971919', N'limit@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (3, N'TURKUAZ', N'Tiflis / Bakü', N'02125972020', N'turkuaz@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (4, N'MAVİ', N'Venedik / Viyana', N'02125972121', N'mavi@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (5, N'GÜNEŞ', N'Antalya / Türkiye', N'02125972222', N'gunes@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (6, N'FİNAL', N'İstanbul / Türkiye', N'02125972323', N'final@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (7, N'GOP', N'Tokat / Türkiye', N'02125972424', N'gop@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (8, N'BİLGİ', N'Erzurum / Türkiye', N'02125972525', N'bilgi@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (9, N'PANEL', N'İstanbul / Türkiye', N'02125972626', N'panel@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (10, N'KİMYA', N'İstanbul / Türkiye', N'02125972727', N'kimya@gmail.com')
INSERT [dbo].[YAYINEVLERI] ([YAYINEVIID], [YAYINEVIADI], [ADRES], [TELEFON], [EPOSTA]) VALUES (12, N'SOLMAZLAR', N'Sinop / Türkiye', N'05355353553', N'sedat25@gmail.com')
SET IDENTITY_INSERT [dbo].[YAYINEVLERI] OFF
GO
SET IDENTITY_INSERT [dbo].[YAZARLAR] ON 

INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (1, N'George Orwell', N'İngiltere')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (2, N'Yuval Noah Harari', N'Amerika')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (3, N'J.K. Rowling', N'Rusya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (4, N'Khaled Hosseini', N'Afganistan')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (5, N'Emily Brontë', N'Hindistan')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (6, N'Antoine de Saint-Exupéry', N'Bakü')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (7, N'Harper Lee', N'Çin')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (8, N'Franz Kafka', N'Kore')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (9, N'Orhan Pamuk', N'İngiltere')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (10, N'Frank Herbert', N'Hollanda')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (11, N'Anthony Burgess', N'Vietnam')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (12, N'Paulo Coelho', N'Norveç')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (13, N'Ursula K. Le Guin', N'İsviçre')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (14, N'Gabriel García Márquez', N'Kanada')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (15, N'Arthur Conan Doyle', N'Polonya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (16, N'Jack London', N'Ukrayna')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (17, N'Gabriel García Márquez', N'Ermenistan')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (18, N'Thomas Mann', N'Almanya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (19, N'Anthony de Mello', N'İngiltere')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (20, N'Jon Krakauer', N'Amerika')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (21, N'Ray Bradbury', N'Çin')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (22, N'Murat Uyurkulak', N'Norveç')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (23, N'Cengiz Aytmatov', N'İngiltere')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (24, N'Khaled Hosseini', N'Çin')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (25, N'Fyodor Dostoyevski', N'Amerika')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (26, N'Leo Tolstoy', N'Norveç')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (27, N'J.R.R. Tolkien', N'İngiltere')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (28, N'Adolf Hitler', N'Çin')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (29, N'Stefan Zweig', N'Amerika')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (30, N'Orhan Kemal', N'Norveç')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (31, N'George Orwell', N'Almanya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (32, N'William Shakespeare', N'Kanada')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (33, N'Turan Dursun', N'Norveç')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (34, N'Fyodor Dostoyevski', N'Kanada')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (35, N'Nikolai Gogol', N'Almanya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (36, N'Sabahattin Ali', N'Kanada')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (37, N'Albert Camus', N'Vietnam')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (38, N'Yotam Ottolenghi', N'Almanya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (39, N'Fyodor Dostoyevski', N'Kanada')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (40, N'Orhan Pamuk', N'Vietnam')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (41, N'Halide Edib Adıvar', N'Almanya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (42, N'J.K. Rowling', N'Bakü')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (43, N'MR. Sedat', N'Rusya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (44, N'İlber Ortaylı', N'Bakü')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (45, N'Cengiz Aytmatov', N'Kore')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (46, N'Khaled Hosseini', N'Kore')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (47, N'Fyodor Dostoyevski', N'Rusya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (48, N'Leo Tolstoy', N'Kore')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (49, N'J.R.R. Tolkien', N'Rusya')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (50, N'Victor Hugo', N'Hollanda')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (51, N'J.R.R. Tolkien', N'Hollanda')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (52, N'Virginia Woolf', N'Kore')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (53, N'Jose Saramago', N'Hollanda')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (54, N'Grigory Petrov', N'Kore')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (55, N'Çeşitli Yazarlar', N'Türkiye')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (56, N'Jack London', N'Türkiye')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (57, N'Orhan Pamuk', N'Türkiye')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (58, N'Harper Lee', N'Türkiye')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (59, N'Emre Kongar', N'Türkiye')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (60, NULL, N'1')
INSERT [dbo].[YAZARLAR] ([YAZARID], [YAZARADI], [ULUS]) VALUES (62, N'Mr. Beast', N'Amerika')
SET IDENTITY_INSERT [dbo].[YAZARLAR] OFF
GO
SET IDENTITY_INSERT [dbo].[YORUMLAR] ON 

INSERT [dbo].[YORUMLAR] ([YORUMID], [BARKOD], [YORUM], [TARIH], [KULLANICIID]) VALUES (3, 1905080505, N'Kaliteli kitap.', CAST(N'2023-08-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[YORUMLAR] ([YORUMID], [BARKOD], [YORUM], [TARIH], [KULLANICIID]) VALUES (4, 1905080503, N'Güzel !', CAST(N'2022-04-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[YORUMLAR] ([YORUMID], [BARKOD], [YORUM], [TARIH], [KULLANICIID]) VALUES (5, 1905080504, N'Mükemmel :)', CAST(N'2023-08-03T03:21:00.000' AS DateTime), 1)
INSERT [dbo].[YORUMLAR] ([YORUMID], [BARKOD], [YORUM], [TARIH], [KULLANICIID]) VALUES (40, 1905080502, N'Kesinlikle tavsiye ederim.', CAST(N'2023-08-08T03:29:00.000' AS DateTime), 2)
INSERT [dbo].[YORUMLAR] ([YORUMID], [BARKOD], [YORUM], [TARIH], [KULLANICIID]) VALUES (42, 1905080503, N'fena', CAST(N'2023-08-10T06:17:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[YORUMLAR] OFF
GO
ALTER TABLE [dbo].[KITAPLAR] ADD  CONSTRAINT [DF_KITAPLAR_YAYINTARIHI]  DEFAULT (getdate()) FOR [YAYINTARIHI]
GO
ALTER TABLE [dbo].[MESAJLAR] ADD  CONSTRAINT [DF_MESAJLAR_TARIH]  DEFAULT (getdate()) FOR [TARIH]
GO
ALTER TABLE [dbo].[YORUMLAR] ADD  CONSTRAINT [DF_YORUMLAR_TARIH]  DEFAULT (getdate()) FOR [TARIH]
GO
ALTER TABLE [dbo].[KITAPLAR]  WITH CHECK ADD  CONSTRAINT [FK_KITAPLAR_KATEGORILER] FOREIGN KEY([KATEGORIID])
REFERENCES [dbo].[KATEGORILER] ([KATEGORIID])
GO
ALTER TABLE [dbo].[KITAPLAR] CHECK CONSTRAINT [FK_KITAPLAR_KATEGORILER]
GO
ALTER TABLE [dbo].[KITAPLAR]  WITH CHECK ADD  CONSTRAINT [FK_KITAPLAR_YAYINEVLERI] FOREIGN KEY([YAYINEVIID])
REFERENCES [dbo].[YAYINEVLERI] ([YAYINEVIID])
GO
ALTER TABLE [dbo].[KITAPLAR] CHECK CONSTRAINT [FK_KITAPLAR_YAYINEVLERI]
GO
ALTER TABLE [dbo].[KITAPLAR]  WITH CHECK ADD  CONSTRAINT [FK_KITAPLAR_YAZARLAR] FOREIGN KEY([YAZARID])
REFERENCES [dbo].[YAZARLAR] ([YAZARID])
GO
ALTER TABLE [dbo].[KITAPLAR] CHECK CONSTRAINT [FK_KITAPLAR_YAZARLAR]
GO
ALTER TABLE [dbo].[SATISLAR]  WITH CHECK ADD  CONSTRAINT [FK_SATISLAR_SIPARISLER] FOREIGN KEY([SIPARISID])
REFERENCES [dbo].[SIPARISLER] ([SIPARISID])
GO
ALTER TABLE [dbo].[SATISLAR] CHECK CONSTRAINT [FK_SATISLAR_SIPARISLER]
GO
ALTER TABLE [dbo].[SIPARISLER]  WITH CHECK ADD  CONSTRAINT [FK_SIPARISLER_KITAPLAR] FOREIGN KEY([BARKOD])
REFERENCES [dbo].[KITAPLAR] ([BARKOD])
GO
ALTER TABLE [dbo].[SIPARISLER] CHECK CONSTRAINT [FK_SIPARISLER_KITAPLAR]
GO
ALTER TABLE [dbo].[SIPARISLER]  WITH CHECK ADD  CONSTRAINT [FK_SIPARISLER_KULLANICILAR] FOREIGN KEY([KULLANICIID])
REFERENCES [dbo].[KULLANICILAR] ([KULLANICIID])
GO
ALTER TABLE [dbo].[SIPARISLER] CHECK CONSTRAINT [FK_SIPARISLER_KULLANICILAR]
GO
ALTER TABLE [dbo].[YORUMLAR]  WITH CHECK ADD  CONSTRAINT [FK_YORUMLAR_KITAPLAR] FOREIGN KEY([BARKOD])
REFERENCES [dbo].[KITAPLAR] ([BARKOD])
GO
ALTER TABLE [dbo].[YORUMLAR] CHECK CONSTRAINT [FK_YORUMLAR_KITAPLAR]
GO
ALTER TABLE [dbo].[YORUMLAR]  WITH CHECK ADD  CONSTRAINT [FK_YORUMLAR_KULLANICILAR] FOREIGN KEY([KULLANICIID])
REFERENCES [dbo].[KULLANICILAR] ([KULLANICIID])
GO
ALTER TABLE [dbo].[YORUMLAR] CHECK CONSTRAINT [FK_YORUMLAR_KULLANICILAR]
GO
