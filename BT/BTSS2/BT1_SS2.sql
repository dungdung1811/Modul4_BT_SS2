CREATE DATABASE baitap_1;
use baitap_1;
create table PhieuXuat(
    phieuXuat_id int not null primary key auto_increment,
    ngayxuat datetime
);
create table VATTU(
    mavattu_id int not null primary key  auto_increment,
    tevatu varchar(30) not null
);
create table PHIEUNHAP(
    maphieunhap_id int not null primary key  auto_increment,
    ngaynhap datetime
);

create table NHACC(
    id_ncc int not null primary key  auto_increment,
    ten_ncc varchar(30),
    diachi_ncc varchar(100),
    sodienthoai_ncc varchar(30)

);
create table DONDH(
    madathang_id int not null primary key  auto_increment,
    ngaydathang datetime,
    id_ncc int,
    foreign key (id_ncc) references NHACC(id_ncc)
);
create table CTPX(
    phieuxuat_id int,
    mavattu_id int,
    dongiaxuat float,
    soluongxuat int,
    primary key ( phieuxuat_id,mavattu_id),
    foreign key (  phieuxuat_id) references PhieuXuat(phieuXuat_id ),
    foreign key (  mavattu_id) references VATTU(mavattu_id )
);
create table CTPN(
    dongianhap float,
    soluongnhap int,
    mavattu_id int,
    maphieunhap_id int,
    primary key (mavattu_id,maphieunhap_id),
    foreign key (maphieunhap_id) references PHIEUNHAP(maphieunhap_id),
    foreign key ( mavattu_id) references VATTU( mavattu_id)
);

create table CTDH(
    madathang_id int,
    mavattu_id int,
    primary key (madathang_id,mavattu_id),
    foreign key (madathang_id) references DONDH(madathang_id),
    foreign key (mavattu_id) references VATTU(mavattu_id)

);
