use homework_ss6;
set sql_safe_updates = 0;

delete from users;
delete from hotels;
delete from bookings;

create table bookings(
	booking_id		int primary key,
    revenue			decimal(19,4) not null,
    `status`		varchar(255) not null,
    
    constraint chk_tx_status
    check (`status` in ('completed', 'uncompleted'))
);

create table hotels(
	hotel_id		int primary key,
    rating			float not null,
    
    constraint chk_tx_rate
    check (rating >= 0 and rating <= 4.0)
);

create table users(
	user_id			int primary key,
    booking_id		int,
    hotel_id		int,
    user_name		varchar(255) not null,
    
    constraint fk_tx_booking
    foreign key (booking_id) references bookings(booking_id),
    
    constraint fk_tx_hotel
    foreign key (hotel_id) references hotels(hotel_id)
);

-- booking
insert into bookings (booking_id, `status`, revenue) 
values
	(1, 'completed', 120.50),
	(2, 'completed', 188.00),
	(3, 'completed', 250.75),
	(4, 'completed', 300.00),
	(5, 'completed', 51.00),
	(6, 'completed', 180.20),
	(7, 'uncompleted', 0.00),
	(8, 'completed', 95.00),
	(9, 'completed', 400.99),
	(10, 'uncompleted', 0.00),
	(11, 'completed', 220.10),
	(12, 'completed', 98.00),
	(13, 'completed', 330.30),
	(14, 'completed', 150.00),
	(15, 'completed', 67.36),
	(16, 'completed', 275.45),
	(17, 'uncompleted', 0.00),
	(18, 'completed', 199.99),
	(19, 'completed', 350.60),
	(20, 'uncompleted', 0.00);


-- hotels
insert into hotels (hotel_id, rating) 
values
	(1, 3.5),
	(2, 4.0),
	(3, 2.8),
	(4, 3.9),
	(5, 1.5),
	(6, 2.0),
	(7, 3.2),
	(8, 4.0),
	(9, 0.5),
	(10, 2.7),
	(11, 3.0),
	(12, 1.5),
	(13, 2.3),
	(14, 3.7),
	(15, 4.0),
	(16, 0.9),
	(17, 2.6),
	(18, 3.4),
	(19, 1.2),
	(20, 2.9);

-- users
insert into users (user_id, booking_id, hotel_id, user_name) 
values
	(1, 1, 5, 'Nguyen Van A'),
	(2, 2, 3, 'Tran Thi B'),
	(3, 3, 1, 'Le Van C'),
	(4, 4, 7, 'Pham Thi D'),
	(5, 5, 2, 'Hoang Van E'),
	(6, 6, 4, 'Do Thi F'),
	(7, 7, 6, 'Bui Van G'),
	(8, 8, 8, 'Dang Thi H'),
	(9, 9, 9, 'Ngo Van I'),
	(10, 10, 10, 'Vu Thi K'),
	(11, 11, 11, 'Phan Van L'),
	(12, 12, 12, 'Trinh Thi M'),
	(13, 13, 13, 'Mai Van N'),
	(14, 14, 14, 'Ly Thi O'),
	(15, 15, 15, 'Dinh Van P'),
	(16, 16, 16, 'Cao Thi Q'),
	(17, 17, 17, 'Ha Van R'),
	(18, 18, 18, 'Luu Thi S'),
	(19, 19, 19, 'Nguyen Van T'),
	(20, 20, 20, 'Tran Thi U');
    
select * from users u 
inner join bookings b on u.booking_id = b.booking_id
inner join hotels h on u.hotel_id = h.hotel_id;

select 
	u.user_name		as 'Tên Khách Hàng',
    h.rating		as 'Đánh Giá Khách Sạn',		
    b.revenue		as 'Tổng Tiền Chi Tiêu'
from users u
inner join bookings b on u.booking_id = b.booking_id
inner join hotels h on u.hotel_id = h.hotel_id 
where b.`status` = 'completed' and b.revenue > 50
order by h.rating desc, b.revenue desc;