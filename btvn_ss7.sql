create database btvn_ss7;
use btvn_ss7;

-- CƠ BẢN 1
-- Hãy tạo và chèn dữ liệu cho bảng san_pham:
create table san_pham(
	id INT PRIMARY KEY,
	ten_san_pham VARCHAR(255),
	danh_muc VARCHAR(100),
	gia_ban INT,
	so_luong_ton INT
);
-- Chèn dữ liệu mẫu vào bảng
insert into san_pham (id,ten_san_pham,danh_muc,gia_ban,so_luong_ton)
values
(1, 'Laptop Dell XPS 13', 'Laptop', 28000000, 15),
(2, 'iPhone 14 Pro Max', 'Điện thoại', 32000000, 30),
(3, 'Bàn phím cơ Logitech', 'Phụ kiện', 2500000, 50),
(4, 'Laptop MacBook Air M2', 'Laptop', 29500000, 20),
(5, 'Samsung Galaxy S23 Ultra', 'Điện thoại', 26000000, 25),
(6, 'Chuột không dây Fuhlen', 'Phụ kiện', 450000, 100),
(7, 'Tai nghe Sony WH-1000XM5', 'Phụ kiện', 8500000, 40),
(8, 'Laptop HP Envy 15', 'Laptop', 24000000, 18);
-- Tìm các sản phẩm có giá bán nằm trong khoảng từ 20,000,000 đến 30,000,000
select * from san_pham
where gia_ban between 20000000 and 30000000;
-- Tìm tất cả các sản phẩm có tên chứa từ "Laptop"
select * from san_pham 
where ten_san_pham like '%Laptop%';
-- Đếm tổng số sản phẩm thuộc danh mục 'Phụ kiện'. Đặt tên cột kết quả là so_luong_phu_kien
select count(*) as so_luong_phu_kien
from san_pham
where danh_muc = 'Phụ kiện';
-- Liệt kê 3 sản phẩm có giá bán cao nhất
select * from san_pham
order by gia_ban desc
limit 3;

-- CƠ BẢN 2
-- Hãy tạo và chèn dữ liệu cho bảng sach
create table sach(
	id INT PRIMARY KEY,
	tieu_de VARCHAR(255),
	tac_gia VARCHAR(255),
	the_loai VARCHAR(100),
	nam_xuat_ban INT,
	trang_thai VARCHAR(50)
);
-- Chèn dữ liệu mẫu vào bảng:
insert into sach(id, tieu_de,tac_gia,the_loai,nam_xuat_ban,trang_thai)
values
(1, 'Dế Mèn phiêu lưu ký', 'Tô Hoài', 'Văn học', 1941, 'Có sẵn'),
(2, 'Cho tôi xin một vé đi tuổi thơ', 'Nguyễn Nhật Ánh', 'Văn học', 2008, 'Đã mượn'),
(3, 'Số đỏ', 'Vũ Trọng Phụng', 'Tiểu thuyết', 1936, 'Có sẵn'),
(4, 'Nhà giả kim', 'Paulo Coelho', 'Tiểu thuyết', 1988, 'Có sẵn'),
(5, 'Mắt biếc', 'Nguyễn Nhật Ánh', 'Văn học', 1990, 'Đã mượn'),
(6, 'Trên đường băng', 'Tony Buổi Sáng', 'Kỹ năng sống', 2015, 'Có sẵn'),
(7, 'Đắc nhân tâm', 'Dale Carnegie', 'Kỹ năng sống', 1936, 'Có sẵn');
-- Tìm tất cả các cuốn sách của tác giả 'Nguyễn Nhật Ánh'
select * from sach
where tac_gia like '%Nguyễn Nhật Ánh%';
-- Liệt kê tất cả các cuốn sách thuộc thể loại 'Văn học' hoặc 'Tiểu thuyết'
select * from sach
where the_loai in ('Văn học','Tiểu thuyết');
-- Đếm số lượng sách hiện đang ở trạng thái 'Đã mượn'
select count(*) as so_luong_sach
from sach
where trang_thai = 'Đã mượn';
-- Liệt kê 2 cuốn sách cũ nhất trong thư viện (dựa vào năm xuất bản)
select * from sach
order by nam_xuat_ban asc
limit 2;

-- CƠ BẢN 3
-- Hãy tạo và chèn dữ liệu cho bảng phim
create table phim(
	id INT PRIMARY KEY,
    tieu_de VARCHAR(255),
    dao_dien VARCHAR(255),
    nam_phat_hanh INT,
    the_loai VARCHAR(100),
    diem_danh_gia DECIMAL(3, 1)
);
-- Chèn dữ liệu mẫu vào bảng:
insert into phim (id,tieu_de,dao_dien,nam_phat_hanh,the_loai,diem_danh_gia)
values
(1, 'Inception', 'Christopher Nolan', 2010, 'Khoa học viễn tưởng', 8.8),
(2, 'The Dark Knight', 'Christopher Nolan', 2008, 'Hành động', 9.0),
(3, 'Parasite', 'Bong Joon Ho', 2019, 'Tâm lý', 8.5),
(4, 'Mắt Biếc', 'Victor Vũ', 2019, 'Lãng mạn', 7.8),
(5, 'Interstellar', 'Christopher Nolan', 2014, 'Khoa học viễn tưởng', 8.6),
(6, 'Avengers: Endgame', 'Anthony Russo', 2019, 'Hành động', 8.4),
(7, 'Joker', 'Todd Phillips', 2019, 'Tâm lý', 8.4);
-- Tìm tất cả các bộ phim của đạo diễn 'Christopher Nolan'
select * from phim
where dao_dien like '%Christopher Nolan%';
-- Liệt kê các bộ phim được phát hành trong thập kỷ 2010 (từ năm 2010 đến 2019)
select * from phim
where nam_phat_hanh between 2010 and 2019;
-- Tính điểm đánh giá trung bình của tất cả các bộ phim trong danh sách. Đặt tên cột là diem_trung_binh
select avg(diem_danh_gia) as diem_trung_binh
from phim;
-- Liệt kê 3 bộ phim có điểm đánh giá cao nhất, sắp xếp theo thứ tự điểm từ cao đến thấp
select * from phim
order by diem_danh_gia desc
limit 3;

-- CƠ BẢN 4
-- Hãy tạo và chèn dữ liệu cho bảng mon_an
create table mon_an(
	id INT PRIMARY KEY,
    ten_mon VARCHAR(255),
    danh_muc VARCHAR(100), -- 'Món chính', 'Khai vị', 'Tráng miệng', 'Đồ uống',
    gia_tien INT,
    trang_thai_phuc_vu VARCHAR(50) -- 'Đang phục vụ', 'Tạm ngưng'
);
-- Chèn dữ liệu mẫu vào bảng:
insert into mon_an(id,ten_mon,danh_muc,gia_tien,trang_thai_phuc_vu)
values
(1, 'Phở Bò Tái', 'Món chính', 50000, 'Đang phục vụ'),
(2, 'Cơm Gà Xối Mỡ', 'Món chính', 45000, 'Đang phục vụ'),
(3, 'Gỏi Cuốn Tôm Thịt', 'Khai vị', 30000, 'Đang phục vụ'),
(4, 'Bún Bò Huế', 'Món chính', 55000, 'Tạm ngưng'),
(5, 'Nước Cam Ép', 'Đồ uống', 25000, 'Đang phục vụ'),
(6, 'Chè Hạt Sen', 'Tráng miệng', 20000, 'Đang phục vụ'),
(7, 'Cà Phê Sữa Đá', 'Đồ uống', 22000, 'Đang phục vụ'),
(8, 'Bò Lúc Lắc', 'Món chính', 70000, 'Đang phục vụ');
-- Liệt kê các món ăn thuộc danh mục 'Món chính' hoặc 'Khai vị'
select * from mon_an
where danh_muc in('Món chính','Khai vị');
-- Tìm món ăn có giá rẻ nhất trong số các món đang được phục vụ ('Đang phục vụ')
select min(gia_tien) as gia_re_nhat
from mon_an
where trang_thai_phuc_vu='Đang phục vụ';
-- Tìm tất cả các món ăn có chữ 'Bò' trong tên món
select * from mon_an
where ten_mon like '%Bò%';
-- Liệt kê 3 món ăn có giá tiền từ thấp đến cao nhất
select * from mon_an
order by gia_tien asc
limit 3;

-- KHÁ 5
-- Giám đốc kinh doanh muốn bạn trích xuất một số thông tin chi tiết về hành vi của khách hàng và hiệu suất của các danh mục sản phẩm từ bảng dữ liệu don_hang
create table don_hang(
	id_don_hang INT PRIMARY KEY,
    id_khach_hang INT,
    danh_muc VARCHAR(100),
    tong_tien INT,
    ngay_dat DATE,
    trang_thai VARCHAR(50) -- 'Hoan thanh', 'Da huy'
);
-- Chèn dữ liệu mẫu vào bảng:
insert into don_hang (id_don_hang,id_khach_hang,danh_muc,tong_tien,ngay_dat,trang_thai)
values
(1, 101, 'Dien tu', 15000000, '2023-01-15', 'Hoan thanh'),
(2, 102, 'Thoi trang', 2500000, '2023-01-20', 'Hoan thanh'),
(3, 101, 'Dien tu', 8000000, '2023-02-10', 'Hoan thanh'),
(4, 103, 'Gia dung', 5000000, '2023-02-12', 'Da huy'),
(5, 102, 'Thoi trang', 3000000, '2023-03-05', 'Hoan thanh'),
(6, 101, 'Gia dung', 4500000, '2023-03-08', 'Hoan thanh'),
(7, 104, 'Dien tu', 22000000, '2023-04-18', 'Hoan thanh'),
(8, 103, 'Thoi trang', 1800000, '2023-04-22', 'Hoan thanh'),
(9, 102, 'Dien tu', 12000000, '2022-12-10', 'Hoan thanh');
-- Thống kê tổng số tiền chi tiêu cho mỗi khách hàng. Hiển thị id_khach_hang và tổng số tiền của họ, đặt tên cột tổng tiền là tong_chi_tieu. Sắp xếp kết quả theo tổng chi tiêu giảm dần
select 
	id_khach_hang,
    sum(tong_tien) as tong_chi_tieu
from don_hang
group by id_khach_hang
order by tong_chi_tieu desc;
-- Đếm số lượng đơn hàng theo từng danh mục sản phẩm. Hiển thị danh_muc và số lượng đơn hàng tương ứng, đặt tên cột số lượng là so_luong_don
select danh_muc,
count(*) as so_luong_don
from don_hang
group by danh_muc;
-- Tìm những khách hàng đã đặt nhiều hơn 1 đơn hàng. Chỉ hiển thị id_khach_hang của những khách hàng này
select id_khach_hang from don_hang
group by id_khach_hang
having count(*) > 1; 
-- Liệt kê các danh mục có tổng doanh thu (chỉ tính các đơn 'Hoan thanh') lớn hơn 10,000,000. Hiển thị danh_muc và tong_doanh_thu
select danh_muc,
sum(tong_tien) as tong_doanh_thu
from don_hang
where trang_thai = 'Hoan thanh'
group by danh_muc
having sum(tong_tien) > 10000000;

-- KHÁ 6
-- Phân tích bảng nhat_ky_nguoi_dung để hiểu rõ hơn về mức độ tương tác của độc giả với các bài viết trên trang
create table nhat_ky_nguoi_dung (
	id_nhat_ky INT PRIMARY KEY,
    id_nguoi_dung INT,
    id_bai_viet INT,
    chuyen_muc VARCHAR(100),
    thoi_gian_doc_giay INT,
    ngay_ghi_nhat_ky DATE
);
-- Chèn dữ liệu mẫu vào bảng:
insert into nhat_ky_nguoi_dung
values 
(1, 1, 101, 'Lap trinh', 300, '2023-10-01'),
(2, 2, 102, 'Thiet ke', 180, '2023-10-01'),
(3, 1, 103, 'Lap trinh', 450, '2023-10-02'),
(4, 3, 104, 'Bao mat', 600, '2023-10-03'),
(5, 2, 101, 'Lap trinh', 240, '2023-10-03'),
(6, 1, 104, 'Bao mat', 500, '2023-10-04'),
(7, 4, 102, 'Thiet ke', 120, '2023-10-04'),
(8, 3, 101, 'Lap trinh', 320, '2023-10-05'),
(9, 2, 105, 'Thiet ke', 200, '2023-10-05');
-- Tính tổng thời gian đọc của mỗi người dùng. Hiển thị id_nguoi_dung và tổng thời gian (tính bằng giây), đặt tên cột tổng thời gian là tong_thoi_gian_doc. Sắp xếp kết quả theo tổng thời gian giảm dần
select 
	id_nguoi_dung,
	sum(thoi_gian_doc_giay) as tong_thoi_gian_doc
from nhat_ky_nguoi_dung
group by id_nguoi_dung
order by tong_thoi_gian_doc desc;
-- Đếm số lượt đọc cho mỗi chuyên mục. Hiển thị chuyen_muc và so_luot_doc
select 
	chuyen_muc,
	count(id_nguoi_dung) as so_luot_doc
from nhat_ky_nguoi_dung
group by chuyen_muc;
-- Tìm những bài viết (id_bai_viet) được đọc bởi nhiều hơn 1 người dùng. Chỉ hiển thị id_bai_viet
select id_bai_viet 
from nhat_ky_nguoi_dung
group by id_bai_viet
having count(distinct id_nguoi_dung)>1;
-- Liệt kê những người dùng có thời gian đọc trung bình cho mỗi bài viết lớn hơn 350 giây. Chỉ hiển thị id_nguoi_dung và thoi_gian_trung_binh
select 
	id_nguoi_dung,
	avg(thoi_gian_doc_giay) as thoi_gian_trung_binh
from nhat_ky_nguoi_dung
group by id_nguoi_dung
having avg(thoi_gian_doc_giay)>350;

-- GIỎI 7
-- Bạn sẽ làm việc với một bảng duy nhất là giao_dich
create table giao_dich(
	id_giao_dich INT PRIMARY KEY,
    id_khach_hang INT,
    id_san_pham INT,
    ten_san_pham VARCHAR(255),
    danh_muc VARCHAR(100),
    so_luong INT,
    don_gia INT,
    ngay_giao_dich DATE,
    khu_vuc VARCHAR(100) -- Ví dụ: 'Ha Noi', 'Da Nang', 'TP.HCM'
);
-- Chèn dữ liệu mẫu vào bảng:
insert into giao_dich (id_giao_dich,id_khach_hang,id_san_pham,ten_san_pham,danh_muc,so_luong,don_gia,ngay_giao_dich,khu_vuc)
values
(1, 101, 1, 'Laptop A', 'Dien tu', 1, 20000000, '2023-01-15', 'Ha Noi'),
(2, 102, 2, 'Dien thoai B', 'Dien tu', 2, 15000000, '2023-02-20', 'TP.HCM'),
(3, 101, 3, 'Ao so mi C', 'Thoi trang', 5, 500000, '2023-03-10', 'Ha Noi'),
(4, 103, 1, 'Laptop A', 'Dien tu', 1, 20000000, '2023-03-12', 'Da Nang'),
(5, 102, 4, 'Quan jean D', 'Thoi trang', 3, 700000, '2023-04-05', 'TP.HCM'),
(6, 101, 2, 'Dien thoai B', 'Dien tu', 1, 15000000, '2023-05-08', 'Ha Noi'),
(7, 104, 5, 'Noi com dien E', 'Gia dung', 2, 2000000, '2023-05-18', 'TP.HCM'),
(8, 103, 3, 'Ao so mi C', 'Thoi trang', 10, 500000, '2023-06-22', 'Da Nang'),
(9, 102, 1, 'Laptop A', 'Dien tu', 1, 21000000, '2023-07-10', 'TP.HCM'),
(10, 105, 6, 'May xay sinh to F', 'Gia dung', 1, 1500000, '2022-12-01', 'Ha Noi'),
(11, 101, 4, 'Quan jean D', 'Thoi trang', 2, 700000, '2023-08-15', 'Ha Noi');
-- Tìm các khách hàng VIP của năm 2023: Một khách hàng được coi là VIP nếu họ có tổng chi tiêu trong năm 2023 lớn hơn 30,000,000. Hiển thị id_khach_hang và tong_chi_tieu_2023
select 
	id_khach_hang,
    sum(don_gia*so_luong) as tong_chi_tieu_2023
from giao_dich
where year(ngay_giao_dich)=2023
group by id_khach_hang
having tong_chi_tieu_2023 >30000000;
-- Phân tích hiệu suất sản phẩm 'Laptop A': Tính tổng doanh thu và tổng số lượng đã bán của sản phẩm 'Laptop A' tại mỗi khu vực. Chỉ hiển thị kết quả cho những khu vực có tổng số lượng bán ra lớn hơn hoặc bằng 1
select 
	khu_vuc,
    sum(so_luong) as tong_so_luong,
    sum(so_luong*don_gia) as tong_doanh_thu
from giao_dich
where ten_san_pham='Laptop A'
group by khu_vuc
having tong_so_luong >=1;
-- Xác định các danh mục sản phẩm tiềm năng ở 'TP.HCM': Liệt kê các danh mục sản phẩm tại khu vực 'TP.HCM' có giá trị trung bình mỗi giao dịch lớn hơn 5,000,000. Giá trị giao dịch được tính bằng so_luong * don_gia. Hiển thị danh_muc và gia_tri_trung_binh
select
	danh_muc,
    avg(so_luong*don_gia) as gia_tri_trung_binh
from giao_dich
where khu_vuc='TP.HCM'
group by danh_muc
having avg(so_luong*don_gia)>5000000;
-- Tìm những khách hàng mua đa dạng sản phẩm trong năm 2023: Liệt kê những khách hàng đã mua ít nhất 2 danh mục sản phẩm khác nhau trong năm 2023. Chỉ hiển thị id_khach_hang
select id_khach_hang
from giao_dich
where year(ngay_giao_dich)=2023
group by id_khach_hang
having count(distinct danh_muc)>=2;

-- GIỎI 8
-- Bạn sẽ làm việc với một bảng duy nhất là ghi_danh
create table ghi_danh(
	id_ghi_danh INT PRIMARY KEY,
    id_hoc_vien INT,
    id_khoa_hoc INT,
    ten_khoa_hoc VARCHAR(255),
    ten_giang_vien VARCHAR(255),
    gia_tien INT,
    ngay_ghi_danh DATE,
    trang_thai_hoan_thanh VARCHAR(50) -- 'Da hoan thanh', 'Chua hoan thanh'
);
-- Chèn dữ liệu mẫu vào bảng:
insert into ghi_danh(id_ghi_danh,id_hoc_vien,id_khoa_hoc,ten_khoa_hoc,ten_giang_vien,gia_tien,ngay_ghi_danh,trang_thai_hoan_thanh)
values
(1, 101, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 500000, '2023-01-20', 'Da hoan thanh'),
(2, 102, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 500000, '2023-02-15', 'Chua hoan thanh'),
(3, 103, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-02-25', 'Da hoan thanh'),
(4, 101, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-03-05', 'Da hoan thanh'),
(5, 104, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-03-10', 'Chua hoan thanh'),
(6, 102, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-04-12', 'Chua hoan thanh'),
(7, 105, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 600000, '2023-05-15', 'Da hoan thanh'),
(8, 103, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-05-20', 'Da hoan thanh'),
(9, 101, 4, 'Machine Learning ung dung', 'Nguyen Van A', 1500000, '2023-06-01', 'Chua hoan thanh'),
(10, 106, 2, 'Python co ban', 'Tran Thi B', 700000, '2022-11-30', 'Da hoan thanh'),
(11, 102, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-07-01', 'Chua hoan thanh');
-- Đánh giá hiệu suất giảng viên trong Quý 1 năm 2023: Tìm những giảng viên có tổng doanh thu từ các khóa học trong Quý 1/2023 (tháng 1, 2, 3) lớn hơn 1,000,000. Hiển thị ten_giang_vien và tong_doanh_thu_q1
select 
	ten_giang_vien,
    sum(gia_tien) as tong_doanh_thu_q1
from ghi_danh
where ngay_ghi_danh between '2023-01-01' and '2023-03-31'
group by ten_giang_vien
having sum(gia_tien) > 1000000;
-- Tìm các khóa học phổ biến nhưng có tỷ lệ hoàn thành thấp: Liệt kê các khóa học có ít nhất 2 học viên ghi danh và có tỷ lệ hoàn thành dưới 50%. Tỷ lệ hoàn thành được tính bằng (số lượt hoàn thành / tổng số lượt ghi danh) * 100. Hiển thị ten_khoa_hoc, so_luong_ghi_danh, và ty_le_hoan_thanh.
select 
	ten_khoa_hoc,
    count(*) as so_luong_ghi_danh,
    (sum(case when trang_thai_hoan_thanh = 'Da hoan thanh' then 1 else 0 end) 
        / count(*)) * 100 as ty_le_hoan_thanh
from ghi_danh
group by ten_khoa_hoc
having count(*) >= 2
   and (sum(case when trang_thai_hoan_thanh = 'Da hoan thanh' then 1 else 0 end) 
        / count(*)) * 100 < 50;
-- Xác định học viên tích cực nhất: Liệt kê những học viên đã ghi danh vào ít nhất 2 khóa học khác nhau và có tổng chi tiêu lớn hơn 1,000,000. Hiển thị id_hoc_vien, so_khoa_hoc_da_dang_ky và tong_chi_tieu
select
    id_hoc_vien,
    count(distinct id_khoa_hoc) as so_khoa_hoc_da_dang_ky,
    sum(gia_tien) as tong_chi_tieu
from ghi_danh
group by id_hoc_vien
having count(distinct id_khoa_hoc) >= 2 and sum(gia_tien) > 1000000;
-- Phân tích doanh thu theo tháng trong năm 2023: Tính tổng doanh thu cho mỗi tháng trong năm 2023. Chỉ hiển thị những tháng có doanh thu lớn hơn 1,000,000. Hiển thị thang_ghi_danh và tong_doanh_thu. Sắp xếp kết quả theo tháng tăng dần
select 
	month(ngay_ghi_danh) as thang_ghi_danh,
    sum(gia_tien) as tong_doanh_thu
from ghi_danh
where year(ngay_ghi_danh)=2023
group by month(ngay_ghi_danh)
having sum(gia_tien)>1000000
order by thang_ghi_danh asc;


