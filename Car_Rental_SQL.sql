CREATE TABLE `tblCustomer` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`customer_name` varchar(50) NOT NULL,
	`address` varchar(100) NOT NULL,
	`contact` varchar(11) NOT NULL,
	`profile_image` blob NOT NULL,
	`fb_account` varchar(50) NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`password` varchar(30) NOT NULL,
	`admin_id` INT(11) NOT NULL,
	`account_status` INT NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `tblCustomerCredentials` (
	`credential_id` INT NOT NULL AUTO_INCREMENT,
	`credential_name` varchar(30) NOT NULL,
	`file_upload` blob NOT NULL,
	`customer_id` INT(11) NOT NULL,
	PRIMARY KEY (`credential_id`)
);

CREATE TABLE `tblPayment` (
	`payment_id` INT NOT NULL AUTO_INCREMENT,
	`rental_id` INT(11) NOT NULL,
	`payment_amount` FLOAT NOT NULL,
	`add_charges` FLOAT NOT NULL,
	`payment_date` DATE NOT NULL,
	`admin_id` INT NOT NULL,
	PRIMARY KEY (`payment_id`)
);

CREATE TABLE `tblAdmin` (
	`admin_id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`contact` varchar(11) NOT NULL,
	`address` varchar(100) NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`password` varchar(30) NOT NULL,
	PRIMARY KEY (`admin_id`)
);

CREATE TABLE `tblRental` (
	`rental_id` INT(11) NOT NULL AUTO_INCREMENT,
	`rental_date` DATE NOT NULL,
	`rental_time` TIMESTAMP NOT NULL,
	`return_date` DATE NOT NULL,
	`car_id` INT(11) NOT NULL,
	`customer_id` INT(11) NOT NULL,
	`rental_status` INT(2) NOT NULL,
	PRIMARY KEY (`rental_id`)
);

CREATE TABLE `tblTestimonial` (
	`testimonial_id` INT(11) NOT NULL AUTO_INCREMENT,
	`review` varchar(100) NOT NULL,
	`review_score` INT(1) NOT NULL,
	`date` DATETIME NOT NULL,
	`customer_id` INT(11) NOT NULL,
	`car_id` INT(11) NOT NULL,
	PRIMARY KEY (`testimonial_id`)
);

CREATE TABLE `tblCar` (
	`car_id` INT NOT NULL AUTO_INCREMENT,
	`car_name` varchar(30) NOT NULL,
	`description` varchar(100) NOT NULL,
	`car_brand` varchar(25) NOT NULL,
	`color` varchar(15) NOT NULL,
	`capacity` INT(13) NOT NULL,
	`plate_number` varchar(15) NOT NULL,
	`rate` FLOAT NOT NULL,
	`status` INT(2) NOT NULL,
	PRIMARY KEY (`car_id`)
);

CREATE TABLE `tblImage` (
	`image_id` INT NOT NULL AUTO_INCREMENT,
	`img_desc` varchar(50) NOT NULL,
	`car_id` INT(11) NOT NULL,
	PRIMARY KEY (`image_id`)
);

ALTER TABLE `tblCustomer` ADD CONSTRAINT `tblCustomer_fk0` FOREIGN KEY (`admin_id`) REFERENCES `tblAdmin`(`admin_id`);

ALTER TABLE `tblCustomerCredentials` ADD CONSTRAINT `tblCustomerCredentials_fk0` FOREIGN KEY (`customer_id`) REFERENCES `tblCustomer`(`customer_id`);

ALTER TABLE `tblPayment` ADD CONSTRAINT `tblPayment_fk0` FOREIGN KEY (`rental_id`) REFERENCES `tblRental`(`rental_id`);

ALTER TABLE `tblPayment` ADD CONSTRAINT `tblPayment_fk1` FOREIGN KEY (`admin_id`) REFERENCES `tblAdmin`(`admin_id`);

ALTER TABLE `tblRental` ADD CONSTRAINT `tblRental_fk0` FOREIGN KEY (`car_id`) REFERENCES `tblCar`(`car_id`);

ALTER TABLE `tblRental` ADD CONSTRAINT `tblRental_fk1` FOREIGN KEY (`customer_id`) REFERENCES `tblCustomer`(`customer_id`);

ALTER TABLE `tblTestimonial` ADD CONSTRAINT `tblTestimonial_fk0` FOREIGN KEY (`customer_id`) REFERENCES `tblCustomer`(`customer_id`);

ALTER TABLE `tblTestimonial` ADD CONSTRAINT `tblTestimonial_fk1` FOREIGN KEY (`car_id`) REFERENCES `tblCar`(`car_id`);

ALTER TABLE `tblImage` ADD CONSTRAINT `tblImage_fk0` FOREIGN KEY (`car_id`) REFERENCES `tblCar`(`car_id`);









