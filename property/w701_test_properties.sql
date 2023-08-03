-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 09, 2021 at 02:14 PM
-- Server version: 10.1.41-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chulagen_avenetta`
--

-- --------------------------------------------------------

--
-- Table structure for table `w701_test_properties`
--

CREATE TABLE `w701_test_properties` (
  `id` int(11) NOT NULL,
  `real_estate_name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `LOCATION` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `property_type` enum('house','condominium','land','') COLLATE utf8_bin DEFAULT NULL,
  `TRANSACTION` enum('FOR SELL ONLY','RENT UP TO 6 MONTHS','FOR RENT AND FOR SELL') COLLATE utf8_bin DEFAULT NULL,
  `SALE_TERMS` enum('LEASEHOLD','FREEHOLD','','') COLLATE utf8_bin DEFAULT NULL,
  `SALE_PRICE` double DEFAULT NULL,
  `RENT_PRICE` double DEFAULT NULL,
  `COMMON_CHARGES` double DEFAULT NULL,
  `DECORATION_STYLE` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `BEDROOMS` int(11) DEFAULT NULL,
  `BATHROOMS` int(11) DEFAULT NULL,
  `DIRECTION_OF_ROOM` enum('North','East','West','South') COLLATE utf8_bin DEFAULT NULL,
  `UNIT_SIZE` double DEFAULT NULL COMMENT 'หน่วย ตารางเมตร',
  `LAND_AREA` double DEFAULT NULL COMMENT 'หน่วย ตารางวา',
  `INROOM_FACILITIES` text COLLATE utf8_bin,
  `PUBLIC_FACILITIES` text COLLATE utf8_bin,
  `image_01` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `image_02` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `image_03` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `image_04` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `image_05` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='resource for w701 course';

--
-- Dumping data for table `w701_test_properties`
--

INSERT INTO `w701_test_properties` (`id`, `real_estate_name`, `lat`, `lon`, `LOCATION`, `property_type`, `TRANSACTION`, `SALE_TERMS`, `SALE_PRICE`, `RENT_PRICE`, `COMMON_CHARGES`, `DECORATION_STYLE`, `BEDROOMS`, `BATHROOMS`, `DIRECTION_OF_ROOM`, `UNIT_SIZE`, `LAND_AREA`, `INROOM_FACILITIES`, `PUBLIC_FACILITIES`, `image_01`, `image_02`, `image_03`, `image_04`, `image_05`) VALUES
(1, 'ที่ดินเปล่า ถมแล้ว', 14.207476, 100.460057, 'บางพลี อยุธยา', 'land', 'FOR RENT AND FOR SELL', 'FREEHOLD', 5000000, 30000, 0, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'ติดถนน,มีคลองชลประทาน', 'land1/l1_1.jpg', 'land1/l1_2.jpg', 'land1/l1_3.jpg', 'land1/l1_4.jpg', 'land1/l1_5.jpg'),
(2, 'ที่นาขั้นบันได', 19.621176, 98.191613, 'บ้านไม้ฮุง แม่ฮ่องสอน', 'land', 'FOR SELL ONLY', 'FREEHOLD', 1000000, NULL, 0, NULL, NULL, NULL, NULL, NULL, 400, NULL, 'ติดแม่น้ำ', 'land2/l2_1.jpg', 'land2/l2_2.jpg', 'land2/l2_3.jpg', 'land2/l2_4.jpg', 'land2/l2_5.jpg'),
(3, 'ที่นาสวย ใกล้เมือง', 13.992424, 100.665889, 'รังสิต ปทุมธานี', 'land', 'FOR RENT AND FOR SELL', 'FREEHOLD', 15000000, 50000, 0, NULL, NULL, NULL, NULL, NULL, 1000, NULL, 'ถนน,ไฟฟ้า,ประปา,ดรีมเวิล์ด', 'land3/l3_1.jpg', 'land3/l3_2.jpg', 'land3/l3_3.jpg', 'land3/l3_4.jpg', 'land3/l3_5.jpg'),
(4, 'ทุ่งหญ้าเชิงเขา ใกล้เขื่อน', 14.784594, 99.087207, 'ใกล้เขื่อนศรีนครินทร์ กาญจนบุรี', 'land', 'FOR SELL ONLY', 'FREEHOLD', 10000000, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3000, NULL, 'ถนน,ใกล้เขื่อน', 'land4/l4_1.jpg', 'land4/l4_2.jpg', 'land4/l4_3.jpg', 'land4/l4_4.jpg', 'land4/l4_5.jpg'),
(5, 'ที่ดินพร้อมคอกม้า (ไม่รวมม้า)', 14.665299, 101.867524, 'ปักธงชัย นครราชสีมา', 'land', 'FOR RENT AND FOR SELL', 'FREEHOLD', 9900000, 40000, 0, NULL, NULL, NULL, NULL, NULL, 1400, NULL, 'ถนน,ไฟฟ้า,ประปา,ใกล้อ่างเก็บน้ำ', 'land5/l5_1.jpg', 'land5/l5_2.jpg', 'land5/l5_3.jpg', 'land5/l5_4.jpg', 'land5/l5_5.jpg'),
(6, 'ที่เปล่า เชิงเขาร็อกกี้', 44.281754, -109.502647, 'USA', 'land', 'FOR SELL ONLY', 'LEASEHOLD', 29000000, NULL, 0, NULL, NULL, NULL, NULL, NULL, 500, NULL, 'ไฟฟ้า,ประปา,ถนน,อุทยานแห่งชาติ', 'land6/l6_1.jpg', 'land6/l6_2.jpg', 'land6/l6_3.jpg', 'land6/l6_4.jpg', 'land6/l6_5.jpg'),
(7, 'บ้าน 3 ชั้น สไตล์โมเดิร์น', 13.899192, 100.546304, 'ปากเกร็ด นนทบุรี', 'house', 'FOR RENT AND FOR SELL', 'FREEHOLD', 10000000, 80000, 3000, 'MODERN', 4, 4, 'South', 100, 300, ' BALCONIES,CABLE,FULLY FURNISHED,MAID ROOM,BATHTUB,OPEN KITCHEN,CLOSE KITCHEN,AIR CONDITION,WASHER  ', 'SECURITY, POOL, HOSPITAL, DEPARTMENT STORE', 'house1/h1_1.jpg', 'house1/h1_2.jpg', 'house1/h1_3.jpg', 'house1/h1_4.jpg', 'house1/h1_5.jpg'),
(8, 'บ้านน้อยกลางป่าใหญ่', 12.88324, 99.641541, 'ต.สองพี่น้อง เพชรบุรี', 'house', 'FOR RENT AND FOR SELL', 'LEASEHOLD', 8900000, 65000, 0, 'NATURE', 3, 2, 'North', 175, 400, 'FULLY FURNISHED,BATHTUB,เครื่องปั่นไฟ ', 'FOREST,RIVER,ใกล้เขื่อนแก่งกระจาน', 'house2/h2_1.jpg', 'house2/h2_2.jpg', 'house2/h2_3.jpg', 'house2/h2_4.jpg', 'house2/h2_5.jpg'),
(9, 'บ้าน 2 ชั้น สไตล์วินเทจ', 13.87648, 100.820414, 'หนองจอก กรุงเทพฯ', 'house', 'RENT UP TO 6 MONTHS', 'LEASEHOLD', NULL, 100000, 8500, 'VINTAGE', 5, 4, 'East', 250, 500, ' BALCONIES,CABLE,FULLY FURNISHED,MAID ROOM,SHOWER,OPEN KITCHEN,CLOSE KITCHEN,AIR CONDITION,WASHER,INTERNET  ', ' 24 HOURS SECURITY, POOL, PLAYGROUND, FITNESS CENTER, PET ALLOWED, BIG GARDEN  ', 'house3/h3_1.jpg', 'house3/h3_2.jpg', 'house3/h3_3.jpg', 'house3/h3_4.jpg', 'house3/h3_5.jpg'),
(10, 'บ้านเดี่ยว ติดทางด่วน', 13.798831, 100.420658, 'พุทธมณฑลสาย 1 กรุงเทพฯ', 'house', 'RENT UP TO 6 MONTHS', 'LEASEHOLD', NULL, 30000, 0, '', 2, 3, 'North', 100, 200, ' FULLY FURNISHED,SHOWER,KITCHEN,AIR CONDITION,WASHER,INTERNET  ', 'ติดทางด่วน,สำนักงานอัยการ,ร้านอาหาร', 'house4/h4_1.jpg', 'house4/h4_2.jpg', 'house4/h4_3.jpg', 'house4/h4_4.jpg', 'house4/h4_5.jpg'),
(11, 'ทาวน์โฮมใหญ่ 3 ชั้น ทำออฟฟิศได้', 13.754566, 100.421752, 'พุทธมณฑลสาย 1 กรุงเทพฯ', 'house', 'FOR SELL ONLY', 'FREEHOLD', 15000000, NULL, 0, 'MODERN', 4, 4, 'South', 350, 200, ' BALCONIES,FULLY FURNISHED,MAID ROOM,SHOWER,KITCHEN,AIR CONDITION,WASHER ', 'โรงเรียน,สนามกอล์ฟ,ร้านทำผม,ถนนใหญ่', 'house5/h5_1.jpg', 'house5/h5_2.jpg', 'house5/h5_3.jpg', 'house5/h5_4.jpg', 'house5/h5_5.jpg'),
(12, 'ขายด่วน บ้าน 2 ชั้น หมู่บ้านแมวเหมียว', 13.677197, 100.4678, 'บางมด กรุงเทพฯ', 'house', 'FOR SELL ONLY', 'FREEHOLD', 12000000, NULL, 5000, 'MINIMAL', 3, 3, 'West', 75, 175, ' OVEN,BATHTUB,KITCHEN ', 'ใกล้ถ.พระราม 2,วัด,ปั๊มน้ำมัน,SECURITY, POOL, PLAYGROUND, FITNESS ', 'house6/h6_1.jpg', 'house6/h6_2.jpg', 'house6/h6_3.jpg', 'house6/h6_4.jpg', 'house6/h6_5.jpg'),
(13, 'บ้านตากอากาศหรู ริมทะเลสาบ', -43.989438, 170.500761, 'เทคาโป นิวซีแลนด์', 'house', 'FOR RENT AND FOR SELL', 'FREEHOLD', 99000000, 500000, 0, NULL, 6, 6, 'South', 700, 800, 'FULLY FURNISHED,BATHTUB,เครื่องปั่นไฟ ', 'FOREST,RIVER', 'house7/h7_1.jpg', 'house7/h7_2.jpg', 'house7/h7_3.jpg', 'house7/h7_4.jpg', 'house7/h7_5.jpg'),
(14, 'คอนโด LOW RISE ห้องใหญ่', 13.721703, 100.503831, 'คลองสาน กรุงเทพฯ', 'condominium', 'RENT UP TO 6 MONTHS', 'FREEHOLD', NULL, 15000, 1500, 'MODERN', 2, 1, 'North', 48, NULL, 'BALCONY,FULLY FURNISHED,KITCHEN,AIR CONDITION,HOT WATER ', 'POOL,FITNESS,BTS KRUNGTHONBURI,ICON SIAM', 'condo1/c1_1.jpg', 'condo1/c1_2.jpg', 'condo1/c1_3.jpg', 'condo1/c1_4.jpg', 'condo1/c1_5.jpg'),
(15, 'คอนโด Loft ชั้น 37', 13.747198, 100.563403, 'อโศก กรุงเทพฯ', 'condominium', 'RENT UP TO 6 MONTHS', 'FREEHOLD', NULL, 65000, 3200, 'MODERN', 2, 2, 'East', 57, NULL, 'FULLY FURNISHED,KITCHEN,AIR CONDITION,HOT WATER,WASHER,WIFI ', 'POOL,FITNESS,SECURITY,MRT', 'condo2/c2_1.jpg', 'condo2/c2_2.jpg', 'condo2/c2_3.jpg', 'condo2/c2_4.jpg', 'condo2/c2_5.jpg'),
(16, 'THE CAT ชั้น 18', 13.723811, 100.538346, 'สาทร กรุงเทพฯ', 'condominium', 'FOR RENT AND FOR SELL', 'LEASEHOLD', 39000000, 150000, 8300, 'VINTAGE', 3, 3, 'South', 215, NULL, 'FULLY FURNISHED,KITCHEN,AIR CONDITION,HOT WATER,WASHER ', 'POOL,FITNESS,SECURITY,BTS,SUPERMARKET', 'condo3/c3_1.jpg', 'condo3/c3_2.jpg', 'condo3/c3_3.jpg', 'condo3/c3_4.jpg', 'condo3/c3_5.jpg'),
(17, 'คอนโดริมแม่น้ำเจ้าพระยา', 13.683079, 100.508319, 'บางคอแหลม กรุงเทพฯ', 'condominium', 'FOR SELL ONLY', 'FREEHOLD', 47000000, NULL, 3600, 'VINTAGE', 1, 1, 'West', 39, NULL, 'BALCONY,FULLY FURNISHED,KITCHEN,AIR CONDITION,HOT WATER ', 'POOL,FITNESS,SECURITY,BIG C', 'condo4/c4_1.jpg', 'condo4/c4_2.jpg', 'condo4/c4_3.jpg', 'condo4/c4_4.jpg', 'condo4/c4_5.jpg'),
(18, 'THE DOG ชั้น 42', 13.523335, 100.671782, 'บางปู สมุทรปราการ', 'condominium', 'FOR SELL ONLY', 'FREEHOLD', 19000000, NULL, 6000, 'MODERN', 2, 2, 'North', 123, NULL, 'FULLY FURNISHED,KITCHEN,AIR CONDITION,HOT WATER,BATHTUB ', 'POOL,FITNESS,SECURITY,ใกล้สถานตากอากาศบางปู', 'condo5/c5_1.jpg', 'condo5/c5_2.jpg', 'condo5/c5_3.jpg', 'condo5/c5_4.jpg', 'condo5/c5_5.jpg'),
(19, 'คอนโดติดทะเล ห้องวิวเกาะช้าง', 12.195738, 102.356079, 'อ.แหลมงอบ ตราด', 'condominium', 'FOR RENT AND FOR SELL', 'FREEHOLD', 17500000, 85000, 3850, 'MODERN', 2, 2, 'South', 76, NULL, 'BALCONY,FULLY FURNISHED,KITCHEN,AIR CONDITION,HOT WATER ', 'POOL,FITNESS,SECURITY,ใกล้เกาะช้าง', 'condo6/c6_1.jpg', 'condo6/c6_2.jpg', 'condo6/c6_3.jpg', 'condo6/c6_4.jpg', 'condo6/c6_5.jpg'),
(20, 'THE DOG ชั้น 29', 13.523335, 100.671782, 'บางปู สมุทรปราการ', 'condominium', 'FOR RENT AND FOR SELL', 'FREEHOLD', 15000000, 70000, 5550, 'MODERN', 2, 2, 'East', 94, NULL, 'FULLY FURNISHED,KITCHEN,AIR CONDITION,HOT WATER,BATHTUB ', 'POOL,FITNESS,SECURITY,ใกล้สถานตากอากาศบางปู', 'condo7/c7_1.jpg', 'condo7/c7_2.jpg', 'condo7/c7_3.jpg', 'condo7/c7_4.jpg', 'condo7/c7_5.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `w701_test_properties`
--
ALTER TABLE `w701_test_properties`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `w701_test_properties`
--
ALTER TABLE `w701_test_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
