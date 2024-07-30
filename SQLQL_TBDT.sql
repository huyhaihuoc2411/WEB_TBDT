CREATE DATABASE QL_TBDT
GO

USE QL_TBDT
GO

CREATE TABLE CHUDE
(
	MACD INT,
	TENCD NVARCHAR(50),
	PRIMARY KEY(MACD)
)

CREATE TABLE LINHKIEN
(
	MALK INT, 
	TENLK NVARCHAR(200),
	GIABAN INT,
	MOTA NVARCHAR(500),
	ANHLK CHAR(20),
	MACD INT
	PRIMARY KEY(MALK)
)

ALTER TABLE LINHKIEN
ADD CONSTRAINT FK_LINHKIEN_CHUDE FOREIGN KEY(MACD)
REFERENCES CHUDE(MACD)

CREATE TABLE KHACHHANG
(
	MAKH CHAR(10),
	TENKH NVARCHAR(60),
	NGAYSINH DATE,
	GIOITINH NVARCHAR(15),
	DIACHI NVARCHAR(30),
	SDT INT
	PRIMARY KEY(MAKH)
)

CREATE TABLE HOADON
(
	MAHD CHAR(10),
	NGAYDAT DATE,
	TRANGTHAI NVARCHAR(20),
	MAKH CHAR(10)
	PRIMARY KEY(MAHD)
)

ALTER TABLE HOADON
ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY(MAKH)
REFERENCES KHACHHANG(MAKH)

CREATE TABLE KHUYENMAI
(
	MAKM CHAR(10),
	MUCKM INT,
	MAHD CHAR(10)
	PRIMARY KEY(MAKM)
)

ALTER TABLE KHUYENMAI
ADD CONSTRAINT FK_KHUYENMAI_HOADON FOREIGN KEY(MAHD)
REFERENCES HOADON(MAHD)

CREATE TABLE CHITIETHD
(
	MAHD CHAR(10),
	MALK INT,
	SOLUONG INT,
	THANHTIEN INT
	PRIMARY KEY(MAHD,MALK)
)

ALTER TABLE CHITIETHD
ADD CONSTRAINT FK_CHITIETHD_HOADON FOREIGN KEY(MAHD)
REFERENCES HOADON(MAHD)

ALTER TABLE CHITIETHD
ADD CONSTRAINT FK_CHITIETHD_LINHKIEN FOREIGN KEY(MALK)
REFERENCES LINHKIEN(MALK)

CREATE TABLE CONGTY
(
	IDCTY CHAR(10),
	TENCTY NVARCHAR(50),
	DIACHI NVARCHAR(60),
	SDT INT
	PRIMARY KEY(IDCTY)
)

CREATE TABLE KHO
(
	MAKHO CHAR(10),
	TENKHO NVARCHAR(50)
	PRIMARY KEY(MAKHO)
)

CREATE TABLE PHIEUXUAT
(
	MAPX CHAR(10),
	TENPX NVARCHAR(40),
	MAKHO CHAR(10)
	PRIMARY KEY(MAPX)
)

ALTER TABLE PHIEUXUAT
ADD CONSTRAINT FK_PHIEUXUAT_KHO FOREIGN KEY(MAKHO)
REFERENCES KHO(MAKHO)

CREATE TABLE USERGROUP
(
	ID INT,
	Ten nchar(10)
	primary key(ID)
)

CREATE TABLE NGUOIDUNG
(
	ID INT,
	Username char(100),
	Matkhau char(100),
	Groupid int,
	HoTen nvarchar(200),
	DiaChi nvarchar(50)
	primary key(ID)
)

ALTER TABLE NGUOIDUNG
ADD CONSTRAINT FK_NGUOIDUNG_USERGROUP FOREIGN KEY(Groupid)
REFERENCES USERGROUP(ID)

INSERT INTO CHUDE
VALUES  (1,N'Điện thoại'),
		(2,N'Ipad'),
		(3,N'Laptop'),
		(4,N'PC Gaming'),
		(5,N'Màn hình'),
		(6,N'Bàn phím')

SELECT * FROM CHUDE

INSERT INTO LINHKIEN
VALUES  (1,N'iPhone 15 128GB Chính hãng VN/A',21990000,N'Thiết kế thời thượng và bền bỉ - Mặt lưng kính được pha màu xu hướng cùng khung viền nhôm bền bỉ. Dynamic Island hiển thị linh động mọi thông báo ngay lập tức giúp bạn nắm bắt mọi thông tin. Chụp ảnh đẹp nức lòng - Camera chính 48MP, Độ phân giải lên đến 4x và Tele 2x chụp chân dung hoàn hảo. Pin dùng cả ngày không lắng lo Thời gian xem video lên đến 20 giờ và sạc nhanh qua cổng USB-C tiện lợi. Cải tiến hiệu năng vượt bậc A16 Bionic mạnh mẽ giúp bạn cân mọi tác vụ dù có yêu cầu đồ hoạ cao','iphone01.jpg',1),
		(2,N'iPhone 14 Pro Max 128GB Chính hãng VN/A',27090000,N'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6,7 inch, hỗ trợ always-on display. Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic. Làm chủ công nghệ nhiếp ảnh Camera sau 48MP, cảm biến TOF sống động. Pin liền lithiumion kết hợp cùng công nghệ sạc nhanh cải tiến','iphone02.jpg',1),
		(3,N'iPhone 14 128GB Chính hãng VN/A',18790000,N'Tuyệt đỉnh thiết kế, tỉ mỉ từng đường nét - Nâng cấp toàn diện với kiểu dáng mới, nhiều lựa chọn màu sắc trẻ trung. Nâng tầm trải ngiệm giải trí đỉnh cao - Màn hình 6,1"" cùng tấm nền OLED có công nghệ Super Retina XDR cao cấp. Chụp ảnh chuyên nghiệp hơn Cụm 2 camera 12 MP đi kèm nhiều chế độ và chức năng chụp hiện đại. Hiệu năng hàng đầu thế giới Apple A15 Bionic 6 nhân xử lí nhanh, ổn định','iphone03.jpg',1),
		(4,N'iPhone 15 Pro 128GB Chính hãng VN/A',28690000,N'Thiết kế khung viền từ titan mới - Vật liệu cực nhẹ, bền cùng viền cạnh mỏng cho cảm giác cầm nắm thoải mái. Luôn mạnh mẽ ở bất kì tác vụ nào với Chip A17 Pro cho đồ họa có độ phân giải cao nhưng tiêu thụ điện năng ít hơn. Dynamic Island hiển thị linh động các cảnh báo giúp bạn không bỏ lỡ thông tin nào. Bắt trọn khoảng khắc bạn yêu - Cụm 3 camera sau đến 48MP chụp đêm và chân dung hoàn hảo. Nút tác vụ mới giúp nhanh chóng kích hoạt tính năng yêu thích của bạn','iphone04.jpg',1),
		(5,N'iPhone 12 Pro Max 128GB Chính hãng VN/A',23490000,N'Mạnh mẽ, siêu nhanh với chip A14, RAM 6GB, mạng 5G tốc độ cao. Rực rỡ, sắc nét, độ sáng cao - Màn hình OLED cao cấp, Super Retina XDR hỗ trợ HDR10, Dolby Vision. Chụp ảnh siêu đỉnh - Night Mode , thuật toán Deep Fusion, Smart HDR 3, camera LiDar. Bền bỉ vượt trội - Kháng nước, kháng bụi IP68, mặt lưng Ceramic Shield','iphone05.jpg',1),
		(6,N'Máy tính bảng Samsung Galaxy Tab A7 Lite',3490000,N'Máy tính bảng Samsung Galaxy Tab A7 Lite một phiên bản rút gọn của dòng máy tính bảng "ăn khách" Galaxy Tab A7 thuộc thương hiệu Samsung, đáp ứng nhu cầu giải trí của khách hàng thuộc phân khúc bình dân với màn hình lớn nhưng vẫn gọn nhẹ hợp túi tiền','ipad01.jpg',2),
		(7,N'Máy tính bảng Samsung Galaxy Tab S9+ 5G 256GB',23890000,N'Tại sự kiện Unpacked 2023 Samsung đã cho ra mắt Samsung Galaxy Tab S9+ 5G 256GB với hiệu năng mạnh mẽ, màn hình hiển thị sắc nét và là máy tính bảng đầu tiên của hãng được trang bị kháng nước.','ipad02.jpg',2),
		(8,N'Máy tính bảng iPad Pro M2 11 inch WiFi 128GB',20690000,N'Cơn sốt của iPhone 14 series chưa kịp lắng xuống thì mới đây nhà Apple lại vừa tung ra bộ sản phẩm tablet cho năm 2022 với nhiều điểm thu hút. Con chip Apple M2 từng khuấy đảo thị trường laptop bây giờ đã được xuất hiện trên iPad Pro M2 11 inch WiFi 128GB, nó quả thực là một tin chấn động trong giới công nghệ bởi đây có thể là chiếc máy tính bảng có hiệu năng vô đối trên thị trường (10/2022).','ipad03.jpg',2),
		(9,N'Máy tính bảng iPad Air 5 M1 WiFi Cellular 64GB',17990000,N'So với chiếc iPad Air 5 M1 WiFi 64GB thì chiếc iPad Air 5 M1 WiFi Cellular 64GB đã có một điểm khác biệt đáng kể đó là phương thức kết nối khi bạn vừa có thể sử dụng Wifi và mạng di động một cách bình thường nhưng vẫn cho một trải nghiệm rất tuyệt vời.','ipad04.jpg',2),
		(10,N'Máy tính bảng OPPO Pad 2',13990000,N'OPPO Pad 2 là sản phẩm mới của OPPO trong công cuộc chạy đua công nghệ trên thị trường máy tính bảng. Máy thu hút được khá nhiều sự quan tâm khi trang bị một màn hình lớn, con chip mạnh trong tầm giá cùng một viên pin lớn cho trải nghiệm dài lâu mà ít khi gặp phải gián đoạn.','ipad05.jpg',2),
		(11,N'Laptop Asus Vivobook Go 15',13490000,N'Laptop Asus Vivobook Go 15 E1504FA R5 7520U (NJ776W) mang phong cách thiết kế sang trọng, hiệu năng mạnh mẽ cùng tính đa năng sử dụng, chắc chắn sẽ giúp bạn đáp ứng mọi tác vụ công việc và học tập hàng ngày một cách hiệu quả và chuyên nghiệp nhất.','laptop01.jpg',3),
		(12,N'Laptop Lenovo Ideapad 3',7990000,N'Laptop Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SGVN) sẽ là một sự lựa chọn tối ưu trong dòng laptop học tập - văn phòng bởi thiết kế đẹp mắt đi cùng hiệu năng ổn định giải quyết nhẹ nhàng mọi tác vụ thường ngày cho người dùng.','laptop02.jpg',3),
		(13,N'Laptop HP 15s fq5162TU i5',15190000,N'Laptop HP 15s fq5162TU i5 (7C134PA) chắc chắn sẽ khiến các bạn sinh viên hoặc nhân viên văn phòng hài lòng với lối thiết kế đẹp mắt, thông số kỹ thuật có thể đáp ứng đa nhu cầu và giá cả hợp lý.','laptop03.jpg',3),
		(14,N'Laptop Asus Vivobook X515EA i5',13990000,N'Laptop Asus Vivobook X515EA i5 1135G7 (EJ4155W) mang diện mạo tinh tế, hiện đại, hiệu suất hoạt động ổn định, vận hành mượt đa tác vụ, là mẫu laptop học tập - văn phòng ở phân khúc tầm trung có khả năng đáp ứng tốt nhu cầu học tập, làm việc, giải trí cơ bản hằng ngày của người dùng.','laptop04.jpg',3),
		(15,N'Máy tính bảng OPPO Pad 2',9190000,N'Nếu bạn đang tìm kiếm một chiếc laptop học tập - văn phòng sở hữu cấu hình tốt và có thiết kế đơn giản nhưng sang trọng, laptop Asus Vivobook X415EA i3 (EK2034W) chính là sự lựa chọn hoàn hảo dành cho bạn.','laptop05.jpg',3),
		(16,N'TTC25 Gaming i3 10105F Ram 8GB SSD 256G GT1030 2G',6710000,N'TTC25 Gaming i3 10105F Ram 8GB SSD 256G GT1030 2G là cấu hình phổ thông giá rẻ, chiếc PC dành cho e-sport được trang bị GT1030 2GB GDDR5 với mức giá lý tưởng mà ai cũng có thể sở hữu. Thùng PC được tối ưu để hướng tới nhu cầu phổ thông, phục vụ nhu cầu giải trí đặc biệt là những tựa game đang hot như Dota 2, Cs:go, Lmht, Fifa, Truy Kích, Cf.','pcgaming01.jpg',4),
		(17,N'TTC26 Gaming i3 10105F Ram 8GB SSD 256G GTX1650 4G',8290000,N'TTC26 Gaming i3 10105F Ram 8GB SSD 256G GTX1650 4G là cấu hình phổ thông giá rẻ, chiếc PC dành cho e-sport được trang bị GTX 1650 4GB với mức giá lý tưởng mà ai cũng có thể sở hữu. Thùng PC được tối ưu để hướng tới nhu cầu phổ thông, phục vụ nhu cầu giải trí đặc biệt là những tựa game đang hot như Pubg, Dota 2, Cs:go, Lmht, Fifa, Truy Kích, Cf.','pcgaming02.jpg',4),
		(18,N'TTC29 Gaming i3 10105F Ram 8GB SSD 256G GTX1660S 6G',9570000,N'TTC29 Gaming i3 10105F Ram 8GB SSD 256G GTX1660S 6G là một trong những cấu hình chơi Game được tối ưu về phần cứng giúp cho khách hàng có trải nghiệm tốt nhất trong tầm giá, chiếc PC dành cho e-sport được trang bị GTX1660S 6GB GDDR5 với mức giá lý tưởng mà ai cũng có thể sở hữu. Thùng PC được tối ưu để hướng tới nhu cầu phổ thông, phục vụ nhu cầu giải trí đặc biệt là những tựa game đang hot như Pubg, Dota 2, Cs:go, Lmht, Fifa, Truy Kích, Cf.','pcgaming03.jpg',4),
		(19,N'TTC10 Gaming i5 11400F Ram 16GB SSD 256G GTX1660ti 6G',12860000,N'TTC10 Gaming i5 11400F Ram 16GB SSD 256G GTX1660ti 6G là một trong những cấu hình chơi Game được tối ưu về phần cứng giúp cho khách hàng có trải nghiệm tốt nhất trong tầm giá. Cấu hình này hướng tới game thủ, những streamer yêu cầu một cấu hình có thể chiến mọi tựa game cũng như đáp ứng đầy đủ nhu cầu liên quan tới streaming và dựng video','pcgaming04.jpg',4),
		(20,N'TTC27 Gaming i3 12100F Ram 8GB SSD 256G GTX1650 4G',9110000,N'TTC27 Gaming i3 12100F Ram 8GB SSD 256G GTX1650 4G là cấu hình phổ thông giá rẻ, chiếc PC dành cho e-sport được trang bị GTX 1650 4GB GDDR6 với mức giá lý tưởng mà ai cũng có thể sở hữu. Thùng PC được tối ưu để hướng tới nhu cầu phổ thông, phục vụ nhu cầu giải trí đặc biệt là những tựa game đang hot như Pubg, Dota 2, Cs:go, Lmht, Fifa, Truy Kích, Cf.','pcgaming05.jpg',4),
		(21,N'Màn hình Asus VA27EHF 27 inch',3190000,N'Màn hình Asus VA27EHF 27 inch FHD tạo ra một trải nghiệm hình ảnh cao với màu sắc phong phú, chân thực. Điều này làm cho màn hình trở thành một lựa chọn tuyệt vời cho các hoạt động giải trí, làm việc đồ họa và xem nội dung đa phương tiện.','manhinh01.jpg',5),
		(22,N'Màn hình LG 27MP500-B.ATV 27 inch',3290000,N'Màn hình LG 27MP500-B.ATV 27 inch FHD với thiết kế phẳng và kích thước màn hình rộng, sản phẩm này đáng chú ý với những thông số kỹ thuật ấn tượng và tính năng đa dạng mà nó mang lại. ','manhinh02.jpg',5),
		(23,N'Màn hình Samsung S3 S33GC LS24C330GAEXXV 24 inch',2990000,N'Màn hình Samsung S3 S33GC LS24C330GAEXXV 24 inch FHD đến từ thương hiệu Samsung nổi tiếng vừa được lên kệ tại Thế Giới Di Động, sở hữu những tính năng vượt trội phục vụ phần nhìn cùng thiết kế sang trọng trong không gian. Chiếc màn hình này chắc chắn sẽ cho bạn những trải nghiệm sử dụng đầy chuyên nghiệp và tối ưu.','manhinh03.jpg',5),
		(24,N'Màn hình Asus TUF Gaming VG249Q1A 23.8 inch',3590000,N'Màn hình Asus LCD TUF Gaming 23.8 inch Full HD (VG249Q1A) được thiết kế đầy mạnh mẽ với gam màu đen cá tính, sẵn sàng sát cánh cùng bạn trong mọi cuộc chiến.','manhinh04.jpg',5),
		(25,N'Màn hình MSI Gaming G274F 27 inch',4290000,N'Màn hình MSI Gaming G274F 27 inch FHD không chỉ là sự lựa chọn hoàn hảo cho game thủ, mà còn là cầu nối giữa họ và thế giới sống động của trò chơi. Tần số quét 180Hz tạo ra một tầm nhìn đầy mượt mà và bao quát, đem đến trải nghiệm gaming hết sức tuyệt vời. Sản phẩm này sẽ là người bạn đồng hành đáng tin cậy để các game thủ chiến hết mình trong những trận đấu khốc liệt.','manhinh05.jpg',5),
		(26,N'Bàn Phím Cơ Có Dây Gaming Razer BlackWidow V3',2000000,N'Kiểu dáng hình chữ nhật, các phím được sắp xếp giúp tối ưu thao tác cho người sử dụng, có giá kê tay giúp giảm áp lực cho cổ tay, đảm bảo sự thoải mái ngay cả khi chơi game trong thời gian dài. Có phần khung làm từ nhôm độ bền cao, tin cậy về chất lượng.','banphim01.jpg',6),
		(27,N'Bàn Phím Cơ Có Dây Dareu EK75',630000,N'Bàn Phím Cơ Có Dây Dareu EK75 với layout nhỏ gọn theo phong cách hiện đại cùng đèn LED RGB giúp góc làm việc, học tập của bạn thêm phần màu sắc và đẹp mắt.','banphim02.jpg',6),
		(28,N'Bàn phím Gaming Asus ROG Strix Scope NX TKL DELUXE RD SW',1845000,N'Bàn phím Gaming Asus ROG Strix Scope NX TKL DELUXE RD SW Đen sở hữu kiểu dáng thời thượng, thiết kế hầm hố cùng hệ thống đèn LED RGB nổi bật, dễ dàng di chuyển mang theo bất cứ đâu, đồng thời tăng tính thẩm mỹ cho không gian của bạn.','banphim03.jpg',6),
		(29,N'Bàn Phím Không Dây Bluetooth Rapoo E9550G',790000,N'Bàn Phím Không Dây Bluetooth Rapoo E9550G với màu sắc thanh lịch, thiết kế mỏng nhẹ, phản hồi nhanh nhạy, không chiếm quá nhiều diện tích cho bàn làm việc của bạn.','banphim04.jpg',6),
		(30,N'Bàn Phím Có Dây Gaming Asus TUF K1',790000,N'Bàn phím có dây Gaming Asus TUF K1 với thiết kế có phần kê cổ tay tiện dụng, có thể tháo rời để mang lại sự thoải mái dài lâu.','banphim05.jpg',6)

SELECT * FROM LINHKIEN

INSERT INTO KHACHHANG
VALUES  ('KH01',N'Nguyễn Thị Mộng','1999-08-18',N'Nữ',N'Hà Nội',0125866849),
		('KH02',N'Nguyễn Thanh Bình','1987-09-04',N'Nam',N'Tuyên Quang',0684568130),
		('KH03',N'Lê Thanh Tâm','1979-07-23',N'Nam',N'TP.HCM',0313642584),
		('KH04',N'Đặng Văn Khoa','1998-12-30',N'Nam',N'Yên Bái',0684532849),
		('KH05',N'Hà Gia Bảo','1994-04-05',N'Nam',N'Bến Tre',0654131147)

SELECT * FROM KHACHHANG

INSERT INTO HOADON
VALUES  ('HD01','2012-12-07',N'Thành công','KH03'),
		('HD02','2015-06-08',N'Thành công','KH05'),
		('HD03','2018-03-19',N'Chưa thành công','KH01'),
		('HD04','2019-04-13',N'Thành công','KH02'),
		('HD05','2020-11-08',N'Thành công','KH03')

SELECT * FROM HOADON

INSERT INTO KHUYENMAI
VALUES  ('KM01','10','HD04'),
		('KM02','5','HD01'),
		('KM03','9','HD05')

SELECT * FROM KHUYENMAI

INSERT INTO CHITIETHD
VALUES  ('HD01',22,10,32900000),
		('HD02',09,5,89950000),
		('HD03',16,1,6710000),
		('HD04',3,7,131530000),
		('HD05',5,3,70470000)

SELECT * FROM CHITIETHD

INSERT INTO CONGTY
VALUES	('CTY01',N'MSI',N'TP.HCM',19001596),
		('CTY02',N'SAMSUNG',N'Hà Nội',19901586),
		('CTY03',N'ASUS',N'Bình Dương',19882658),
		('CTY04',N'ACER',N'Hải Phòng',19202579),
		('CTY05',N'APPLE',N'Đà Nẵng',19009658)

SELECT * FROM CONGTY

INSERT INTO KHO
VALUES  ('K01',N'Kho thành phố Hồ Chí Minh'),
		('K02',N'Kho Hà Nội'),
		('K03',N'Kho Đà Nẵng')

SELECT * FROM KHO

INSERT INTO PHIEUXUAT
VALUES  ('PX01',N'Chuyển nhanh','K01'),
		('PX02',N'Chuyển bình thường','K02'),
		('PX03',N'Chuyển đợi thanh toán','K03')

SELECT * FROM PHIEUXUAT

INSERT INTO USERGROUP
VALUES (1,'Admin'), 
	   (2,'User')

SELECT * FROM USERGROUP

INSERT INTO NGUOIDUNG
VALUES (1,'Admin','123abc',1,N'Lê Văn Huy',N'TPHCM'),
	   (2,'User','abc123',2,N'Nguyễn Văn A',N'Hà Nội')

SELECT * FROM NGUOIDUNG
