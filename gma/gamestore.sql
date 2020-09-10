-- 1: Create database 
-- Kiểm tra database có tồn tại hay không mới xóa
DROP DATABASE IF EXISTS gameStore;
-- Kiểm tra database có tồn tại không mới tạo 
CREATE DATABASE IF NOT EXISTS gameStore;
-- 2: sử dụng database shoppe
use gameStore;
SET SQL_SAFE_UPDATES = 0;

-- 3: CREATE TABLE accounts
CREATE TABLE accounts (
    accountID INT AUTO_INCREMENT,
    userName NVARCHAR(225) NOT NULL,
    pass VARCHAR(225) NOT NULL,
    firstName VARCHAR(225) NOT NULL,
    lastName VARCHAR(225) NOT NULL,
    birthday DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(11) NOT NULL UNIQUE,
    money DOUBLE NOT NULL DEFAULT 0,
    mail VARCHAR(225) UNIQUE,
    position VARCHAR(225) NOT NULL,
    createDATE DATE NOT NULL,
    accountStatus VARCHAR(225) NOT NULL,
    PRIMARY KEY (accountID)
);
-- 4: CREATE TABLE category
CREATE TABLE categories (
    categoryID INT AUTO_INCREMENT,
    categoryName NVARCHAR(255) NOT NULL,
    PRIMARY KEY (categoryID)
);

-- 5: CREATE TABLE publisers
CREATE TABLE publishers (
    publisherID INT AUTO_INCREMENT,
    publisherName NVARCHAR(255) NOT NULL,
    PRIMARY KEY (publisherID)
);

-- 6: CREATE TABLE game
CREATE TABLE games (
    gameID INT AUTO_INCREMENT,
    publisherID INT NOT NULL,
    gameName NVARCHAR(225) NOT NULL,
    gameDescription TEXT NOT NULL,
    gamePrice DOUBLE NOT NULL,
    rating DOUBLE NOT NULL,
    gameDownloadTimes INT NOT NULL,
    size VARCHAR(225) NOT NULL,
    gameStatus VARCHAR(225) NOT NULL,
    FOREIGN KEY (publisherID)
        REFERENCES publishers (publisherID),
    PRIMARY KEY (gameID)
);


-- 7: CREATE TABLE categoryDetail 
CREATE TABLE categoryDetails (
    categoryID INT,
    gameID INT,
    FOREIGN KEY (categoryID)
        REFERENCES categories (categoryID),
    FOREIGN KEY (gameID)
        REFERENCES games (gameID),
    PRIMARY KEY (categoryID , gameID)
);


-- 9: CREATE TABLE orders
CREATE TABLE orders (
    orderID INT AUTO_INCREMENT,
    accountID INT NOT NULL,
    gameID INT NOT NULL,
    priceOfgame DOUBLE NOT NULL,
    orderCreateDate VARCHAR(255) NOT NULL,
    totalBill DOUBLE NOT NULL,
    orderstatus NVARCHAR(255) NOT NULL,
    FOREIGN KEY (accountID)
        REFERENCES accounts (accountID)
        ON DELETE CASCADE,
    FOREIGN KEY (gameID)
        REFERENCES games (gameID)
        ON DELETE CASCADE,
    PRIMARY KEY (orderID)
);

-- 11: CREATE TABLE options 
CREATE TABLE options (
    optionID INT AUTO_INCREMENT,
    optionName NVARCHAR(225) NOT NULL,
    resources VARCHAR(225) NOT NULL,
    PRIMARY KEY (optionID)
);

-- 12: CREATE TABLE gameOption
CREATE TABLE gameOptions (
    optionID INT NOT NULL,
    gameID INT NOT NULL,
    FOREIGN KEY (optionID)
        REFERENCES options (optionID)
        ON DELETE CASCADE,
    FOREIGN KEY (gameID)
        REFERENCES games (gameID)
        ON DELETE CASCADE,
    PRIMARY KEY (optionID , gameID)
);

-- insert accounts
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (1, 'Voibenho', '83422503bcfc01d303030e8a7cc80efc', 'Do', 'Dinh', '1999-06-21', 'Hung Yen', '0984869201', '0', 'dinhdt.nde19026@vtc.edu.vn', 'Customer','2020-03-01', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (2, 'Phuongrhyder01', '83422503bcfc01d303030e8a7cc80efc', 'Tran', 'Phuong', '2001-03-18', 'Ha Noi', '0378709602', '0', 'phuongtt.nde19073@vtc.edu.vn', 'Customer','2020-03-05', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (3, 'LoiBelyBoi01', '83422503bcfc01d303030e8a7cc80efc', 'Tran', 'Loi', '2001-02-14', 'Ha Noi', '0325810316', '0', 'loitd.nde19072@vtc.edu.vn', 'Customer','2020-04-08', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (4, 'Thanh96', '83422503bcfc01d303030e8a7cc80efc', 'Vu', 'Thanh', '1996-01-05', 'Ha Noi', '0974294028', '0', 'thanhvv.nde19052@vtc.edu.vn', 'Customer','2020-04-02', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (5, 'Minhptzzz', '83422503bcfc01d303030e8a7cc80efc', 'Le', 'Minh', '1998-11-09', 'Da Nang', '0352984165', '0', 'Leminhzzz@gmail.com', 'Customer','2020-04-09', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (6, 'Huenguyen', '83422503bcfc01d303030e8a7cc80efc', 'Nguyen', 'Hue', '2001-06-12', 'Khanh Hoa', '0952617487', '0', 'Huenguyen1206@gmail.com', 'Customer','2020-03-18', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (7, 'Manhnx', '83422503bcfc01d303030e8a7cc80efc', 'Xuan', 'Manh', '2001-06-08', 'Hai Duong', '0952617486', '0', 'Manhnc2001@gmail.com', 'Customer','2020-03-11', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (8, 'tiendatoxy', '83422503bcfc01d303030e8a7cc80efc', 'Tien', 'Dat', '1998-05-26', 'Phu Tho', '0952657487', '0', 'Tiendatoxyyy@gmail.com', 'Customer','2020-04-15', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (9, 'Chungnhomkinh', '83422503bcfc01d303030e8a7cc80efc', 'Le', 'Chung', '1992-01-01', 'Thanh Hoa', '0978608686', '0', 'Lesychung1992@gmail.com', 'Customer','2020-04-26', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus)
VALUES (10, 'QuanhVu', '83422503bcfc01d303030e8a7cc80efc', 'Vu', 'Quynh Anh', '2002-03-17', 'Cao Bang', '0985236147', '0', 'Vuquynhanh1703@gmail.com', 'Customer','2020-04-16', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus) 
VALUES ('11', 'VuVan', '83422503bcfc01d303030e8a7cc80efc', 'Vu', 'Van', '2001-06-17', 'Thach That', '0352948154', '0', 'Vuvan1706@gmail.com', 'Customer', '2020-04-26', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus) 
VALUES ('12', 'TranMinh', '83422503bcfc01d303030e8a7cc80efc', 'Minh', 'Tran', '1998-08-28', 'Phu Tho', '0395842657', '0', 'Minhtran000@gmail.com', 'Customer', '2020-04-01', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus) 
VALUES ('13', 'MinhQuang', '83422503bcfc01d303030e8a7cc80efc', 'Minh', 'Quang', '1999-12-25', 'Ha Noi', '0385962145', '0', 'minhquang99@gmail.com', 'Customer', '2020-03-13', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus) 
VALUES ('14', 'MyMy', '83422503bcfc01d303030e8a7cc80efc', 'My', 'My', '1997-08-26', 'Da Nang', '0352184479', '0', 'mymyhihi@gmail.com', 'Customer', '2020-03-12', 'non-active');
INSERT INTO accounts(accountID, userName, pass, firstName, lastName, birthday, address, phone, money, mail, position, createDATE, accountStatus) 
VALUES ('15', 'HongMinh', '83422503bcfc01d303030e8a7cc80efc', 'Hong', 'Minh', '1992-07-28', 'Khanh Hoa', '0352168594', '0', 'hongminhtt@gmail.com', 'Customer', '2020-03-28', 'non-active');


-- insert category
INSERT INTO categories(categoryID, categoryName)
VALUES (1, 'Riddle');
INSERT INTO categories(categoryID, categoryName)
VALUES (2, 'Tactic');
INSERT INTO categories(categoryID, categoryName)
VALUES (3, 'Board forms');
INSERT INTO categories(categoryID, categoryName)
VALUES (4, 'Funny question');
INSERT INTO categories(categoryID, categoryName)
VALUES (5, 'Racing');
INSERT INTO categories(categoryID, categoryName)
VALUES (6, 'Education');
INSERT INTO categories(categoryID, categoryName)
VALUES (7, 'Act');
INSERT INTO categories(categoryID, categoryName)
VALUES (8, 'Simulation');
INSERT INTO categories(categoryID, categoryName)
VALUES (9, 'Music');
INSERT INTO categories(categoryID, categoryName)
VALUES (10, 'Role playing');
INSERT INTO categories(categoryID, categoryName)
VALUES (11, 'Adventure');
INSERT INTO categories(categoryID, categoryName)
VALUES (12, 'Casino');
INSERT INTO categories(categoryID, categoryName)
VALUES (13, 'Card');
INSERT INTO categories(categoryID, categoryName)
VALUES (14, 'Sport');
INSERT INTO categories(categoryID, categoryName)
VALUES (15, 'Usually');
INSERT INTO categories(categoryID, categoryName)
VALUES (16, 'Find the crossword');
INSERT INTO categories(categoryID, categoryName)
VALUES (17, 'Video games');


-- insert publishers
INSERT INTO publishers(publisherID, publisherName) VALUES (1, 'Playrix');
INSERT INTO publishers(publisherID, publisherName) VALUES (2, 'Saygames');
INSERT INTO publishers(publisherID, publisherName) VALUES (3, 'Lion Studios');
INSERT INTO publishers(publisherID, publisherName) VALUES (4, 'Focus apps');
INSERT INTO publishers(publisherID, publisherName) VALUES (5, 'Super game Studios');
INSERT INTO publishers(publisherID, publisherName) VALUES (6, 'ninja kiwi');
INSERT INTO publishers(publisherID, publisherName) VALUES (7, 'SENSPARK CO., LTD');
INSERT INTO publishers(publisherID, publisherName) VALUES (8, 'ELECTRONIC ARTS');
INSERT INTO publishers(publisherID, publisherName) VALUES (9, 'Ironhide game Studio');
INSERT INTO publishers(publisherID, publisherName) VALUES (10, 'Chess Prince');
INSERT INTO publishers(publisherID, publisherName) VALUES (11, 'Higgs Studio');
INSERT INTO publishers(publisherID, publisherName) VALUES (12, 'Better Life - Color and Draw');
INSERT INTO publishers(publisherID, publisherName) VALUES (13, 'X-Flow');
INSERT INTO publishers(publisherID, publisherName) VALUES (14, 'Unico Studio');
INSERT INTO publishers(publisherID, publisherName) VALUES (15, 'MTH Studio');
INSERT INTO publishers(publisherID, publisherName) VALUES (16, 'etermax');
INSERT INTO publishers(publisherID, publisherName) VALUES (17, 'gameloft SE');
INSERT INTO publishers(publisherID, publisherName) VALUES (18, 'BabyBus');
INSERT INTO publishers(publisherID, publisherName) VALUES (19, 'VOODOO');
INSERT INTO publishers(publisherID, publisherName) VALUES (20, 'Clickteam USA LLC');
INSERT INTO publishers(publisherID, publisherName) VALUES (21, 'Crazy Labs by TabTale');
INSERT INTO publishers(publisherID, publisherName) VALUES (22, 'AMANOTES');
INSERT INTO publishers(publisherID, publisherName) VALUES (23, '4399en game');
INSERT INTO publishers(publisherID, publisherName) VALUES (24, 'ZigZagame Inc.');
INSERT INTO publishers(publisherID, publisherName) VALUES (25, 'Hazel Mobile games');
INSERT INTO publishers(publisherID, publisherName) VALUES (26, 'D3 GO');
INSERT INTO publishers(publisherID, publisherName) VALUES (27, 'NET CORPORATION');
INSERT INTO publishers(publisherID, publisherName) VALUES (28, 'Mobile Amusements');
INSERT INTO publishers(publisherID, publisherName) VALUES (29, 'Ten Square games');
INSERT INTO publishers(publisherID, publisherName) VALUES (30, '52PLAY game');
INSERT INTO publishers(publisherID, publisherName) VALUES (31, 'BoomBit games');
INSERT INTO publishers(publisherID, publisherName) VALUES (32, 'MOUNTAIN game');
INSERT INTO publishers(publisherID, publisherName) VALUES (33, 'Garena Mobile Private');
INSERT INTO publishers(publisherID, publisherName) VALUES (34, 'Scopely');
INSERT INTO publishers(publisherID, publisherName) VALUES (35, 'PeopleFun');


-- Câu đố
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES (1, 1, 'Fishdom', 
'Try challenging and fun match-3 gameplay with unique puzzles as you decorate aquariums to create cozy homes for lovely talking fish.
 Feed them, play with them, and watch them interact with each other. Hey, your finned friends are waiting for you, 
 so dive in now and enjoy this amazing underwater adventure!', '0', '4.8', 1114000, '128M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (1, 'Image','https://lh3.googleusercontent.com/1NXEyybznnleMc-wGR7nmxl2XHBx9E-ASIG_N41c92M7NQ9bGNc5KJo5SUKzLMOaJQ=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (1, 1);
INSERT INTO options (optionID, optionName, resources)
VALUES (2, 'Image','https://lh3.googleusercontent.com/Ax7yQpJ56CPxJdjA7pj_BshHpJV9Xf-qsedtPV8dCZUASq5f4pNQZuQWks4iX0InkjQ=w1536-h706-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (2, 1);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES (2, 2, 'DOP: Draw One Part', 
'It will make you feel both like genius and talented artist.Take you time to think the puzzle over, then draw the solution. 
Vast range of riddles to draw: from common daily things to famous cultural reference.', 
'0', '4.2', '2154870', '120M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (3, 'Image','https://lh3.googleusercontent.com/2KjwmtDNoVI5PLFruVFq24Y3yR36wGGA4YLhxFfd6Frp2O-YrFzYqhIxWleUdn9wMw=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (3, 2);
INSERT INTO options (optionID, optionName, resources)
VALUES (4, 'Image','https://lh3.googleusercontent.com/G7h-eKPlTcsokuWnVBtSnDNyhULQ2P1kFc8wF3QdsRFx7XzlkipjhPxYblwKHtAJRqY=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (4, 2);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES (3, 3, 'Clue Hunter', 'With this addictive and hilarious game, you will have non stop fun inside trying to find out what happens next! Who knows, 
you might even be compelled to make a video out of it for the internet! Are you detective enough? Find out now.', 
'6000', '4.5', '1021500', '42M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (5, 'Image','https://lh3.googleusercontent.com/s_kunqkNbzyDAD4-D5hAjbDjkEFA6A1sz9XUtywHq8_TX9LiAFQ9Z_rm9YvZPJA4OgDD=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (5, 3);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(4, 4, 'Brain Out', 'The questions are extremely brain-damaging with shocking answers
The challenge game is full of fun and upsets your imagination', '0', '4.8', '5120000', '54M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (6, 'Image','https://lh3.googleusercontent.com/s_kunqkNbzyDAD4-D5hAjbDjkEFA6A1sz9XUtywHq8_TX9LiAFQ9Z_rm9YvZPJA4OgDD=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (6, 4);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(5, 5, 'Hero Rescue', 'Join the hero rescue in today most unique rescue game. It is made for yourself, those who love brain hacking games and those who love adventure.
What do you think your IQ is? It is the brain hacking puzzles in Hero Rescue that will give you the answer. 
Train your intelligence with this puzzle game that will help develop your brain. 
Especially since this is a rescue game, you will find it fascinating and engaging from start to finish.', 
'0', '4.2', '3120002', '69M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (7, 'Image','https://lh3.googleusercontent.com/XwN9hPQby4PB3Ir8TiNlK-vYgDMFgSbSYrKwDDkPIvfQvb5wUkxCwgUoiOrCDNhJkA=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (7, 5);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(6, 1, 'Brain Wash', 'Hey, friend, what’s up! It’s me – your crazy brain!  Let’s talk a bit, I’ve made a surprise for you… 
If you are brave enough, ask yourself three simple questions:', '0', '4.2', '2516485', '84M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (8, 'Image','https://lh3.googleusercontent.com/x-APduqO1sNCP1baG8RG7AMavEtTfZLbwhUM1n2anzwrhXUzmQwyiZOk44zVyOQNZUw=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (8, 6);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(7, 1, 'Homescapes', 'Welcome to Homescapes! Help Austin the butler bring warmth and comfort back to his wonderful family mansion. 
Come on in—adventures await you from the moment you walk in the door!', '0', '4.8', '21548754', '148M', 'active'); 
 INSERT INTO options(optionID, optionName, resources) 
VALUES (9, 'Image','https://lh3.googleusercontent.com/2wBdWQFN8XUpt9bRw7snLR-m95A97sAxGcsV21T4ah6MbMXsboGnidA35dEAz9Q3w3I=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (9, 7);
 INSERT INTO options(optionID, optionName, resources) 
VALUES (10, 'Video','https://youtu.be/v8vr-IwAPPA');
INSERT INTO gameOptions(optionID, gameID) VALUES (10, 7);
 
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(8, 3, 'Just Draw', 'People need your help! Pictures will be presented to you and it is up to you to use your creative wit to 
find what the missing object is and draw it in the right spot! It’s about to rain and the poor guy has no shelter? Draw him an umbrella! 
The girl is cold and shivering - time to sketch in a sun! Each level is a brain teaser that only the smartest can figure out. 
Never has solving puzzles been this much fun.', '0', '3.6', '2154855', '59M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (11, 'Image','https://lh3.googleusercontent.com/fl3xO9BpfOYeW1bDDVbwd2ru7O6zGx9vj6oUUzfJWyd16LpSQ0yRcI4JVsMvLrFssTY=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (11, 8);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(9, 3, 'Pull Him Out', 'The hunter begins his journey for treasure, but the puzzles in front of the hunter trapped him. 
What you need to do is to draw the stick in the right order, so that the hunter can take the hidden treasure away safely.', 
'0', '3.2', '2148576', '78M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (12, 'Image','https://lh3.googleusercontent.com/Jy3h3bzsqsPhgG2ZnjDL7LwGmqYPCPngI6rJx0Q6Tf4bjdLqdlqavrI_NjeALseYsk4=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (12, 9);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(10, 3, 'Mr Ninja - Slicey Puzzles','Sequel to the 2019 smash hit, Mr Bullet, Mr Ninja will be your next great puzzle obsession!
 Replace your gun toting ways and equip a sword in this slash and dash’em puzzle experience! Swipe away and slice down the enemy spies, 
 pirates, and zombies. This unique puzzle experience will test your creative thinking. 
 Enemies have gotten smarter and will block your attacks. Do you have what it takes to solve them all??', 
'0', '3.8', '15124800', '33M', 'non-active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (13, 'Image','https://lh3.googleusercontent.com/Jy3h3bzsqsPhgG2ZnjDL7LwGmqYPCPngI6rJx0Q6Tf4bjdLqdlqavrI_NjeALseYsk4=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (13, 10);

-- Chiến thuật 
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(11, 7, 'Stick War: Stickman Battle Legacy 2020','Stick war - stickman battle legacy 2020: Stickman battle legacy 2020: Stick war game (stickman battle)
 genre action game revolves around extremely fierce battles of the stick army to redistribute the occupied territory. 
 Stickman Fighting Game (Stickman Fighting) is a good strategy game on the pc web now officially available on mobile mobile. 
 Is the latest version 2020, other games archery (ban bow) or supreme duelist stickman.', 
'6000', '4.8', '1115005', '65M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (14, 'Image','https://lh3.googleusercontent.com/xnfN91B6uxoxbAO3Srl_zXdmaGoApQd-fcmfIE7dZUQDpCwmdojJMsirpFBZPaQvCwI=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (14, 11);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(12, 8, 'Stick War: Legacy','One of the most popular and highest rated web games of all time is now available on mobile!',
 '0', '4.2', '10154896', '81M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (15, 'Image','https://lh3.googleusercontent.com/sITxnGaUxYVzTDkVAjRSKM8JKehWTuseE4hF8937sWVattKHEAirl7uZw93gqad_fQg6=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (15, 12);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(13, 6, 'Bloons TD 6','Get ready for a massive 3D tower defense game designed to give you hours and hours of the best strategy 
gaming available. Craft your perfect defense from a combination of awesome monkey towers, upgrades, Heroes, and activated abilities, 
then pop every last Bloon that comes your way!', 
'111000', '5', '1485500', '68M', 'non-active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (16, 'Image','https://lh3.googleusercontent.com/eLQwvPea1fpBHB5wsIGF7lZAFK4gROUaNkhMfJRsj6rYvE7wscdTWAU8GPof0UFjeks=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (16, 13);
INSERT INTO options(optionID, optionName, resources) 
VALUES (17, 'Video','https://www.youtube.com/embed/mZSY1PSIJ-E?');
INSERT INTO gameOptions(optionID, gameID) VALUES (17, 13);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(14, 8, 'Plants vs. Zombies FREE','Get ready to soil your plants as a mob of fun-loving zombies is about to invade your home. 
Use your arsenal of 49 zombie-zapping plants — peashooters, wall-nuts, cherry bombs and more — to mulchify 26 types of zombies before 
they break down your door.', 
'0', '4.5', '15197880', '94M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (18, 'Image','https://lh3.googleusercontent.com/Ze2zQvotGvXDe8yBHXzEXsom6UUe_xvPadoivBzniGzNA31lYWhUYpvUQBb2GFKtvTo=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (18, 14);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(15, 8, 'Kingdom Rush FrONtiers - Tower Defense game',
'Fight on forests, mountains, and wastelands, customizing your defensive strategy with different tower test and specializations! 
Rain fire upon your enemies, summon reinforcements, command your troops, recruit elven warriors and face legendary monsters on 
a quest to save the Kingdom from the forces of darkness!', 
'12000', '4.9', '1055498', '100M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (19, 'Image','https://lh3.googleusercontent.com/2MNn3aBsoxtUpvj126CNtshhbRw0ROZh7QO664mwRUcAX8gFFtr-KLTO98pDQFuUVNDt=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (19, 15);
INSERT INTO options(optionID, optionName, resources) 
VALUES (20, 'Video','https://youtu.be/ilshnhXtfKQ');
INSERT INTO gameOptions(optionID, gameID) VALUES (20, 15);

-- Dạng bảng
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(16, 11, 'Master Puzzle-Puzzle Classic mahjong shape',
'The new Puzzle Master has a simple gameplay, addictive gameplay: just collect fruit jigsaw puzzles, butterflies (choose 3 of the same puzzle), 
after all puzzle pieces are collected You will win! You will be shining in the Puzzle Master.', 
'0', '4.4', '10059863', '100M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (21, 'Image','https://lh3.googleusercontent.com/fwyQDqI5W0CtNxMf4LZbiMnCoo7LDsmeNnvuaRA6zujF3-bB70axz2u5sieT-3e13zg=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (21, 16);
INSERT INTO options(optionID, optionName, resources) 
VALUES (22, 'Video','https://www.youtube.com/embed/EazNUWTcZAk?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (22, 16);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(17, 10, 'Chess',
'As you know, Chess is one of the oldest strategic thinking disciplines in the world.
Chess is a board game that requires logic to develop skills such as strategy, thinking, and visual memory.', 
'0', '4.2', '10054928', '2,9M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (23, 'Image','https://lh3.googleusercontent.com/wwAiz5FIU30yGr9wAgt789hQ8eP2hOPNXIYs0NpIKQYJoYkNc1ZAcwegcvVUcIjTIvz6=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (23, 17);
INSERT INTO options(optionID, optionName, resources) 
VALUES (24, 'Video','https://youtu.be/60WKis7st5w');
INSERT INTO gameOptions(optionID, gameID) VALUES (24, 17);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(18, 12, 'Coloring by Numbers - Free coloring book & puzzle game', 'Several coloring books and coloring puzzle games for everyone, 
there are lots of free and cool coloring pages in this coloring book and new pictures to draw with numbers will be updated every day! 
Dozens of coloring categories to choose from, such as animals, love, jigsaw, quotes, characters, flowers, mandalas and so on.', 
'0', '4.1', '1054982', '2,9M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (25, 'Image','https://lh3.googleusercontent.com/SDM2OtiKT5bc76242_N1IibmmZVAq1hieDOP7rk-EJVL8dUBxqXMTqlHajHJUysTKw=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (25, 18);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(19, 13, 'Happy Color - coloring game',
'Happy Color is a coloring game for adults. There are lots of colorful and breathtaking images to color!', 
'0', '4.3', '5582648', '55M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (26, 'Image','https://lh3.googleusercontent.com/OKIUc3vQq9bemwOMHYURdp7sD2_arP63f11lHYwzfTM45pAVsQIdYjlZaaygkW5LP4U=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (26, 19);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(20, 13, '1LINE - One line with one touch',
'One Line with One Touch is a simple way to get some brain exercise every day. This is the best mind challenging game with simple rules. 
Just try to connect all the points with only one touch.', 
'1000', '4.2', '1849528', '17M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (27, 'Image','https://lh3.googleusercontent.com/kLuDP6CmQ7ZrjuE4pK2v6wPkb7P9nRf--0UAmzVaisyIk_m4xh_7SMDr6pC1rYCKDg=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (27, 20);
INSERT INTO options(optionID, optionName, resources) 
VALUES (28, 'Image','https://lh3.googleusercontent.com/z0jhQIeRu7_j6TjpCiv8pf1UQQj7igP51GUG8uFY41YGnYGFFq4yWNPSpv0fkI2qyOA=w1536-h754-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (28, 20);

-- Đố Vui
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(21, 14, 'Brain Test 2: Storytime Tips',
'With over a million downloads, Brain Test: Trivia Quiz has redefined the concept of mobile gaming. Now welcome the fun quizzes and 
fun tests in Brain Test 2! Brain hacking game.', 
'0', '4.9', '10095682', '67M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (29, 'Image','https://lh3.googleusercontent.com/eoHmsq3L-5gORmivx5AA5XIDrHL-J838EWy28gdbE1lj1NsXD73cyaXNiIbg9mrmVK4=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (29, 21);
INSERT INTO options(optionID, optionName, resources) 
VALUES (30, 'Video','https://www.youtube.com/embed/0B98zQAtUKI?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (30, 21);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(22, 14, 'Brain Test: Fun Puzzle Tips',
'Brain Test is an extremely addictive puzzle game. Many tricky and funny puzzles are waiting for you. Your mind will be challenged and
 relaxed while playing this game. You can also solve these cunning puzzles with your family and friends. 
Prepare yourself to take the test and see what your IQ is!', 
'0', '4.2', '65982154', '69M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (31, 'Image','https://lh3.googleusercontent.com/POtPtYWIXfwOLy8rUw1QASsiVYvncJdL7Uc32oEQxQ-iBkPqmTL8wpRreo-x3PKn3cc=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (31, 22);
INSERT INTO options(optionID, optionName, resources) 
VALUES (32, 'Video','https://www.youtube.com/embed/AjhpwX6zNZE?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (32, 22);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(23, 15, 'Lightning Fast - Read Questions',
'The game includes quiz questions, fun questions, knowledge questions ... carefully selected by the editor, without duplication. 
The questions are easy but difficult, difficult but easy, it will bring you cheerful and cheerful laughs after studying, stressful work.', 
'0', '4.8', '9254618', '12M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (33, 'Image','https://lh3.googleusercontent.com/Q7FV28j6FSIjm98GqVv_B97f2kek_kshSWaHlPNn02fWLQMFjXuumus1o8XbnX4zN_g=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (33, 23);
INSERT INTO options(optionID, optionName, resources) 
VALUES (34, 'Video','https://www.youtube.com/embed/flhvqVCxsoQ?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (34, 23);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(24, 15, 'Who Is Trieu Phu 2020 - Reading Questions',
'Is an intellectual game, knowledge test based on the gameshow Ai La Trieu Phu on VTV3, 
the sound game hosted by MC Lai Van Sam, reading questions and 4 The answer plan promises to give players the experience of sitting in 
a hot chair.', 
'0', '4.2', '2554845', '41M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (35, 'Image','https://lh3.googleusercontent.com/alL8sMhn2b_u83qaUesDLPCjB9PWzm6JAXNYFXVAJZktLbtNEdKe1YkWrLD9Pe6uOq83=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (35, 24);
INSERT INTO options(optionID, optionName, resources) 
VALUES (36, 'Video','https://www.youtube.com/embed/0YAXRWJBi4s?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (36, 24);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(25, 16, 'Trivia Crack (Ad free)',
'An advanced step to the puzzle game, it is to answer the quiz questions fun general knowledge!
Do you like playing games with your friends? Challenge friends and family to answer fun quiz questions together!
 Prove you are the smartest not only by answering multiple choice questions, but also by proposing multiple choice questions in this app.', 
'6000', '4.2', '500000', '99M', 'non-active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (37, 'Image','https://lh3.googleusercontent.com/3X3E094Vd94k54RVBc1N8Bzd2f6Lcy1rsM0YlndZMgT5V6567MGlqjrvLL_t3xqg4MU=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (37, 25);
INSERT INTO options(optionID, optionName, resources) 
VALUES (38, 'Video','https://www.youtube.com/embed/RTv3oIv7NIk?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (38, 25);

-- Đua xe
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(26, 2, 'Turbo Stars',
'Race in awesome tracks with different obstacles.
Face opponents and be the best of the best!', 
'0', '4.5', '5095826', '37M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (39, 'Image','https://lh3.googleusercontent.com/EtAYKSp_Ncz-vqaRH6RMWVTwVagwsZGOdelo6qztOwJTEdKcLLvYoWiwyWUj6KBp_ss=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (39, 26);
INSERT INTO options(optionID, optionName, resources) 
VALUES (40, 'Video','https://www.youtube.com/embed/vJaKby3Q_TY?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (40, 26);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(27, 8, 'Need for Speed™ Most Wanted',
'It pushes the mobile platform to its utmost limits and doesn’t even break a sweat(Capsule Computers)
Buckle up, hit the gas and hold on tight; you’re in for the ride of your life. Outrun cops, outsmart rivals – and outdrive your friends – in the most dangerous Need for Speed yet. Do you dare to be the Most Wanted?', 
'109000', '4.2', '10659845', '19M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (41, 'Image','https://lh3.googleusercontent.com/LyOLqzFJtKHmTPiciOepfy2yatlJ7fJYITmNMO63Qd1qYWhwXvk-VioEp0jBHwTqrJA=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (41, 27);
INSERT INTO options(optionID, optionName, resources) 
VALUES (42, 'Video','https://www.youtube.com/embed/xhcJlcGuovU?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (42, 27);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(28, 17, 'Asphalt 9: Legends - Epic Car Action Racing game',
'Asphalt 9: Legends features a top roster of real hypercars for you to drive that is unlike that found in any other game, 
from renowned car manufacturers like Ferrari, Porsche, Lamborghini and W Motors. You’re free to pick the dream car you need and 
race across spectacular locations against rival speed machines around the world. Hit the fast track and leave your limits in the 
dust to become a Legend of the Track!', 
'0', '4.6', '5854925', '95M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (43, 'Image','https://lh3.googleusercontent.com/cQBJ7Jwvz0jex8sL7LjgLId-wOdmMajSZbpC-bzHDhS5uK9Zms0fFsXEVNGvlIUk_g=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (43, 28);
INSERT INTO options(optionID, optionName, resources) 
VALUES (44, 'Video','https://www.youtube.com/embed/VgCMOReW2zQ?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (44, 28);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(29, 16, 'Asphalt 8 Racing game - Drive, Drift at Real Speed',
'Over 220 high-performance cars and bikes for you to drive and push beyond their limits.
Top licensed manufacturers and models, such as the Lamborghini Veneno, Bugatti 16.4 Grand Sport Vitesse, Ferrari LaFerrari, McLaren P1, 
Porsche 911 GT3 RS, Ducati Monster 1200 and more, including a selection of racing motorbikes!
Newly recorded high-fidelity motor sounds for realistic audio immersion.
Customize & upgrade your rides with over 2,300 decals to take down your opponents with style!', 
'0', '4.2', '10008549', '84M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (45, 'Image','https://lh3.googleusercontent.com/q0b-uKBQ8SGgU3BRkXIKAWgirzG5BCWjZ8uAq1Z0a0n4H_SxdlSi5aV2YUzJtE67fXk=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (45, 29);
INSERT INTO options(optionID, optionName, resources) 
VALUES (46, 'Video','https://www.youtube.com/embed/TEuZZB_zSOw?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (46, 29);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(30, 16, 'Asphalt Nitro',
'Drive licensed supercars like Ferrari LaFerrari or Lamborghini Veneno on beautiful, "falling apart" but hard to "beaten" roads and perform some of 
the craziest performances on earth you can think of. ! Burn Nitro and be the first to finish!', 
'0', '4.8', '5529784', '45M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (47, 'Image','https://lh3.googleusercontent.com/xMRV92isAcFWE8c2sZk90mZNxBICaVU1BSjsbf65g1z9tElBNOUeJpNrwH4Kcqu8TQ=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (47, 30);
INSERT INTO options(optionID, optionName, resources) 
VALUES (48, 'Video','https://www.youtube.com/embed/R2a20lFFfVs?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (48, 30);

-- Giáo dục
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(31, 18, 'Baby Pandas World',
'Welcome to Baby Panda World. Here, you can make food, manage your restaurant, become a fashion designer, adventure with dinosaurs and interact with them to make your own story!', 
'0', '4.4', '5289500', '75M', 'non-active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (49, 'Image','https://lh3.googleusercontent.com/TnZYhlv7B2BfAS8LIKCUBGXXj7amSD-KxJw6pEvRBmh2uHWrd1CA9ccGzVPVjb50OP8=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (49, 31);
INSERT INTO options(optionID, optionName, resources) 
VALUES (50, 'Image','https://lh3.googleusercontent.com/U_qOEecryGe5nb3iBSEhO3ZINpTEWDu00T34mo6qgXZ6Z-Mg5fM5VPgBIhLBSXsNoik=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (50, 31);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(32, 18, 'Baby Panda: Oral Care',
'Is becoming a dentist your dream job? Then dont miss this game! Come to Baby Panda Dental Clinic! Experience the work of a dentist, 
managing a dental clinic to clean and care for small animals! Become a good dentist!', 
'0', '4.2', '500020', '88M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (51, 'Image','https://lh3.googleusercontent.com/A2u7dLWyJHGPNjhSqEfq38n3IqLHBz8yzeHcJdlcvGxvsn1M5n-ea0jLZ_93goMzky0=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (51, 32);
INSERT INTO options(optionID, optionName, resources) 
VALUES (52, 'Video','https://www.youtube.com/embed/EUmTebUdLf0?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (52, 32);

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(33, 18, 'Baby Pandas Supermarket',
'Welcome to the largest supermarket in Panda Town! When When and Mom Panda have to go shopping at the supermarket! 
Play with friends and family and help your favorite pandas go shopping in Baby Panda Supermarket!', 
'0', '2.5', '5000000', '78M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (53, 'Image','https://lh3.googleusercontent.com/0qy6LJKYNN0ZU1p4jEkH6N-OWI55Y7Uu9_pXx_43aKTCmDD-ydhXcqTI8KBgfwPBog8=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (53, 33);
INSERT INTO options(optionID, optionName, resources) 
VALUES (54, 'Video','https://www.youtube.com/embed/qfxFqeuYqrk?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (54, 33); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(34, 18, 'Little Panda: Princess Makeup',
'Are you a fashion expert? Come to Little Panda Makeup Salon and show off your makeup talent! Design great style with beautiful makeup, 
new hairstyles and outfits suitable for princesses. Help them shine at the party!', 
'6000', '4.2', '1045284', '60M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (55, 'Image','https://lh3.googleusercontent.com/w7fqNGg4ANswezeraCb-1xaATbQ4eP9JwUUx1j5jm_LJHtzzXVONtploB0nf7R_AXBc=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (55, 34);
INSERT INTO options(optionID, optionName, resources) 
VALUES (56, 'Video','https://www.youtube.com/embed/HSaOTY2yl4A?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (56, 34);  

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(35, 18, 'Baby Panda Playhouse',
'Welcome to Baby Panda Playhouse, where you can cook, toy, experience different careers, and enjoy Babybus cartoon songs.
Explore the playhouse for more games!', 
'0', '4.5', '5052985', '126M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (57, 'Image','https://lh3.googleusercontent.com/2SdBDbQeAzqA3NbLI5tPp7TgaCy0y9Bz0oUh0W_B0JxAh44_7JIZxSSApbRmh4Tp_jw=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (57, 35);
INSERT INTO options(optionID, optionName, resources) 
VALUES (58, 'Video','https://www.youtube.com/embed/D1okDP7DHd0?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (58, 35);   

-- Hành Động
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(36, 19, 'Scribble Rider',
'Roll, Swim, Stick and Fly with the ultimate All-Terrain vehicle!', 
'0', '4.5', '10458452', '76M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (59, 'Image','https://lh3.googleusercontent.com/sSA1GaA7RcnL842iAhja-QI9mEBeDjGwH5ZUhSF2NiW0ni3-NUe0Xm9ZJzd60MQ9cVY=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (59, 36);
INSERT INTO options(optionID, optionName, resources) 
VALUES (60, 'Image','https://lh3.googleusercontent.com/r6LyJE9agew_kgMLbmiqXVnWdDPzIP55Hv7TKd1GfoLhwNpFzdOVoWMGn6u1LLMKfXQ=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (60, 36);  

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(37, 19, 'Draw Joust!',
'Build your ride, and joust it out with your opponent! Do you have what it takes to win the tourney?
Axes, spears, cannons, swords, all sorts of weapons attachable to your cart
Dozens of cart types, Multiple Arenas, Endless enemies', 
'0', '4.8', '10259000', '62M', 'non-active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (61, 'Image','https://lh3.googleusercontent.com/N5MA7n1JF5sTgooti7Ehe6MrYIuREBDyakqxwYl2Id9N7wplmeFXw7q72kJHowie6uIH=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (61, 37);
INSERT INTO options(optionID, optionName, resources) 
VALUES (62, 'Image','https://lh3.googleusercontent.com/VX7VBaLwn30NpqMp51zP2EVm50n7AhDPkaIC2XD83g5Uq_hXiLsX1ivON7RpuOQkPvF8=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (62, 37);  

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(38, 20, 'Ultimate Custom Night',
'Welcome to the ultimate FNaF mashup, where you will once again be trapped alone in an office fending off killer animatronics! 
Featuring 50 selectable animatronic characters spanning seven Five Nights at Freddy games, 
the options for customization are nearly endless. Mix and match any assortment of characters that you like, set their difficulty from 0-20,
 then jump right into the action! From your office desk, you will need to manage two side doors, two vents, as well as two air hoses, 
 all of which lead directly into your office.', 
'69000', '4.6', '5052816', '151M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (63, 'Image','https://lh3.googleusercontent.com/s700KAjsLI3b39KAyRmQW2laDPBJljNGTgx7mSvea-LArfcjbB06-ANK8oO3X0mcSzo=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (63, 38);
INSERT INTO options(optionID, optionName, resources) 
VALUES (64, 'Video','https://www.youtube.com/embed/bvINCphw6xc?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (64, 38);   

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(39, 20, 'Five Nights at Freddy',
'Welcome to your new summer job at Freddy Fazbear Pizza, where kids and parents alike come for entertainment and food as far as the eye can 
see! The main attraction is Freddy Fazbear, of course; and his two friends. They are animatronic robots, programmed to please the crowds! 
The robots behavior has become somewhat unpredictable at night however, and it was much cheaper to hire you as a security guard 
than to find a repairman.', 
'69000', '4.5', '5002050', '151M', 'active'); 
INSERT INTO options(optionID, optionName, resources) 
VALUES (65, 'Image','https://lh3.googleusercontent.com/fpvuIfT4oY7RkQOFbLT56wIP70kauqwtRSbXSiFAIJ5c3gEEGfIETCVBRGn3AjjBfM8g=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (65, 39);
INSERT INTO options(optionID, optionName, resources) 
VALUES (66, 'Image','https://lh3.googleusercontent.com/lbMz9O0ps5OxeKYoZiRpQ6f-EITr-HXP4H6H9Hia6GsXf_LEiJR2Qw2zjPOoXdIk_YA=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (66, 39); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(40, 20, 'Five Nights at Freddy',
'Welcome to Circus Baby Pizza World, where family fun and interactivity go beyond anything you seen at those other pizza places! 
With cutting-edge animatronic entertainers that will knock your kids socks off, as well as customized pizza catering, 
no party is complete without Circus Baby and the gang!', 
'70000', '4.4', '100140', '3,6M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (67, 'Image','https://lh3.googleusercontent.com/k2JSbLINZZffIqhW6PA86e6xiJ0S_ZTUv2Z_Q3xI2Fmig2bHuJ0Rw0W3abZnlQojXR0=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (67, 40);
INSERT INTO options(optionID, optionName, resources) 
VALUES (68, 'Image','https://lh3.googleusercontent.com/YKRhM90P91GBncsq8rYtzvahw5mHVhuTClolLExaoTdvPH6Qq8DpE6IRXDEnDYuD8w=w1536-h402-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (68, 40);  

-- Mô phỏng
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(41, 21, 'Tie Dye',
'T-shirts, bikinis, beach bags... you name it! Show off your creative DIY art skills while customizing the Tie Dye clothes to your liking
Get requests from clients and paint clothes to your desire. Being creative isn’t hard: first tie, then dye! 
Unleash your DIY art skills and let the paint do the work! Let the summer fun begin!', 
'0', '4.2', '1000650', '97M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (69, 'Image','https://lh3.googleusercontent.com/s481_VFbHzewIOVSJJ9TQE1DafQD19LLUoMBbX90Z27tFRr84G7U88-Gks8MPfsUIaQ=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (69, 41);
INSERT INTO options(optionID, optionName, resources) 
VALUES (70, 'Image','https://lh3.googleusercontent.com/rgSrebfzdIVoYcTrLqP8Wjoe8S2248u8ciIx1pfhhCQaInwCfb5GKMYF8EXErClQy_8=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (70, 41);  

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(42, 21, 'ASMR Slicing',
'This is the most satisfying ASMR kinetic sand simulator cutting game. It not just kinetic sand, there are multiple other awesome objects and shapes too! 
You seen it in the ASMR videos and now you get to cut and slice and dice it yourself in this simulator!', 
'0', '4.5', '1000250', '64M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (71, 'Image','https://lh3.googleusercontent.com/raBgEsK-UhmjzoKdR-2vhN37MSKblz_-2reYETGsPXyNZ1yyxnnj01Fzd1cHw7lWeQ=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (71, 42);
INSERT INTO options(optionID, optionName, resources) 
VALUES (72, 'Video','https://www.youtube.com/embed/4EWWNZTAlpk?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (72, 42);  

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(43, 21, 'Soap Cutting - Satisfying ASMR',
'The most satisfying ASMR soap cutting game for antistress. You seen it in the videos and now you get to slice, cut, 
and shred some amazing soaps yourself while listening to relaxing sounds and getting a tingling ASMR sensation.', 
'0', '4.8', '125480', '158M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (73, 'Image','https://lh3.googleusercontent.com/00LCpmRkON3bbhWi_cLn0NIoC39lXW_6bGeTtmc-kcJ-5OBY084EWn3y-NKL-fcv5nQ=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (73, 43);
INSERT INTO options(optionID, optionName, resources) 
VALUES (74, 'Video','https://www.youtube.com/embed/2DGp8bCwfwM?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (74, 43);  

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(44, 21, 'JoJo Siwa - Live to Dance',
'Hey Siwanatorz! Enter the colorful and sparkly world of JoJo Siwa, dress up like a fashion superstar, get that sparkly makeup on, 
and get ready to dance your heart out. Design bows, live out your superstar dream on stage, and rise to the top with JoJo Siwa and BowBow!', 
'50000', '4.2', '10158299', '50M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (75, 'Image','https://lh3.googleusercontent.com/XuhWhZ9USD3J_fqiKgrfS-1Vu89WmhEDODlDs3KW_r9Uin8Ldshd_-EQA6KRZtA6J-Za=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (75, 44);
INSERT INTO options(optionID, optionName, resources) 
VALUES (76, 'Video','https://www.youtube.com/embed/KP1bVW_MEY0?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (76, 44);  

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(45, 21, 'My Horse Stories',
'Go from city girl to country gal, in My Horse Stories! Choose your pet horse and become a horse racing champion, in this horse story game! 
Get ready for a summer of drama! Compete against your rival, and maybe even fall in love with your crush!', 
'1000', '4.2', '1002590', '55M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (77, 'Image','https://lh3.googleusercontent.com/kGOm4fjmxrXn453odxyH3IIwFzI1QU9KeSZtjHfUvQr6s8IstcMNJczp0ZAVW03X0T5L=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (77, 45);
INSERT INTO options(optionID, optionName, resources) 
VALUES (78, 'Video','https://www.youtube.com/embed/sK8J3kU6X0s?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (78, 45); 

-- Nhạc
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(46, 22, 'Tiles Hop: EDM Rush!',
'Right now you can experience the extremely interesting music challenge with the music of Son Tung M-TP: Run Now, Lac Troi, 
Yesterday Brother, This Place Has You ...
You can also manually upload a song you love and pass the song challenge.', 
'0', '4.8', '1042588', '71M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (79, 'Image','https://lh3.googleusercontent.com/8WYC7Z27p09jqLwTTWcKD20DZx_HMXR-jWJg3OLkcK6qcKOgLjsVSpNRSaGF3U-sRA=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (79, 46);
INSERT INTO options(optionID, optionName, resources) 
VALUES (80, 'Video','https://www.youtube.com/embed/3ma9wMrSTMI?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (80, 46); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(47, 22, 'Magic Tiles 3',
'Swaying is not bad, swinging is to shake off sadness
Shake your fingers practice right away with Magic Tiles 3 with 30 days to try the hottest songs on Magic Tiles 3 for FREE!', 
'6000', '4.2', '1001582', '69M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (81, 'Image','https://lh3.googleusercontent.com/0e0MIl22rhTzOlF3qR1doVSsvMRoZv2F03xK0cCOXCwV0dxNA2dw547mZjzNu09faT0=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (81, 47);
INSERT INTO options(optionID, optionName, resources) 
VALUES (82, 'Video','https://www.youtube.com/embed/J5iKqn2lDnE?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (82, 47); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(48, 22, 'Color Hop 3D - Music Game',
'Color Hop 3D combines one-touch controlled gameplay with carefully selected EDMs for an experience like never before. 
The trick here is to not let your ball jump over the bricks of the wrong color. Listen to the music beat and enjoy the melody, 
and you will love this music game.', 
'0', '4.2', '5015825', '47M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (83, 'Image','https://lh3.googleusercontent.com/C7mVrSFJJDu5JmtYOmbDD4ak-r346hdvnXZ1D1xUjj8G1bViuOfbskFfMdTa_LHsMw=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (83, 48);
INSERT INTO options(optionID, optionName, resources) 
VALUES (84, 'Video','https://www.youtube.com/embed/Td-G0hpyV48?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (84, 48); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(49, 22, 'Hop Ball 3D',
'It one of the music game was designed for Ball Lovers. You surely love this ball game at the first try.', 
'100000', '4.2', '100000', '71M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (85, 'Image','https://lh3.googleusercontent.com/vP0PFBNOxNTFqOGtiKqUbZbqPf-JbamR3YpgVewyxOmp5bnbhy7aFdd2Ba3S6cRZD0o=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (85, 49);
INSERT INTO options(optionID, optionName, resources) 
VALUES (86, 'Image','https://lh3.googleusercontent.com/szsdRH-HEqyV1z9zvHq7XK4BqViGhNBveruNwQ2JTYaNTzgkkdnghfJbexURcAe-i1Q=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (86, 49); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(50, 22, 'Dancing Road: Color Ball Run!',
'Let’s dance hard with the colorful ball under the rolling sky challenging like solving puzzle
Galaxy adventure to unlock new songs in the music box:.
And if you are an authentic KPOP fans, you cannot skip BigBang, BLACKPINK,iKON,...Your idols are in here!!!', 
'0', '4.9', '100000158', '70M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (87, 'Image','https://lh3.googleusercontent.com/rv_vLMmATUBr-UfBEPiK-WQq4YnmVJYh9fHQpH8ePa2KwmgOuvheH8e9jVijna7OxLzK=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (87, 50);
INSERT INTO options(optionID, optionName, resources) 
VALUES (88, 'Image','https://lh3.googleusercontent.com/28NqHf1h5ys2RF-1qCQGQlJUWRErmiSpY9N3PFU2lJJMpL8BH-6vQ8iQEBwsIobl96Ww=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (88, 50); 

-- Nhập Vai
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(51, 23, 'Goddess MUA',
'Goddess Buy is an MMORPG with a natural setting in love', 
'0', '4.2', '502525', '97M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (89, 'Image','https://lh3.googleusercontent.com/8ckjjlFOgDyNNtyey_RVFAJniXJ15amkF31O4udx9QC-cyNMe-2ReBQ7YgtZ8YiOew=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (89, 51);
INSERT INTO options(optionID, optionName, resources) 
VALUES (90, 'Video','https://www.youtube.com/embed/8b-1CmvBhHs?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (90, 51); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(52, 23, 'Jade Sword - Lien Hiep Truyen Ky - Phuong Hoang',
'Experience RPG gameplay with breathtaking action!
EX skills are fierce and lively! Call on your friends Striker to dominate the game!', 
'12000', '4.2', '500000', '98M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (91, 'Image','https://lh3.googleusercontent.com/gnW0T7BONiui5rZ3-McLiX6dXGVcdG0kVzmhlpPQiZwpI5U7ZhH0jxSt7xjXOsX6Nbs=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (91, 52);
INSERT INTO options(optionID, optionName, resources) 
VALUES (92, 'Image','https://lh3.googleusercontent.com/DI5LtN_4oMsrEwISN3TZk7E77kzHjRi8IHZC28lWxshLtiBOJK46nMphdvW03jp_RFo=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (92, 52); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(53, 23, 'Mucheon',
'Welcome to the new sky!
The game that Rainbow Jisook (a.k.a Gemduk) chose was a great one!', 
'20000', '4.2', '10000', '100M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (93, 'Image','https://lh3.googleusercontent.com/FhSsUkpGbnBn0pY-9HmdfleNTXI1xepeM4oX3byFFLUJ3kUvbha55E3AkHYazi5ZrrJJ=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (93, 53);
INSERT INTO options(optionID, optionName, resources) 
VALUES (94, 'Video','https://www.youtube.com/embed/YRgaDeBWPpo?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (94, 53); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(54, 24, 'Neo Monsters',
'Neo Monsters is an addictive strategy RPG that features epic 4v4 battles between two teams of up to 16 monsters. 
The unique turn-based battle system allows you to come up with powerful chain strategies by combining hundreds of abilities. 
Hunt down the strongest monsters and harness their power, then take the battle online to dominate in exciting PvP battles and leagues! 
Are you ready to take the challenge?', 
'6000', '4.6', '1001528', '100M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (95, 'Image','https://lh3.googleusercontent.com/o9CWSTUhzkIQuxvFwqJfwWhWW-VktS5Z1yy94YmM2rBX9DLofhaHmYnW33_99OuNHvv9=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (95, 54);
INSERT INTO options(optionID, optionName, resources) 
VALUES (96, 'Image','https://lh3.googleusercontent.com/s46g5d1cgkHgRZU8bZUcggR_uhb5bSq2IcOHV0iLq9-k-5oo84GIFcfEtPNSeUgRGG8=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (96, 54); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(55, 24, 'Evertale',
'Dive into a breathtaking fantasy world filled with mysterious monsters to capture, battle, and train. Explore sprawling landscapes, 
bustling cities, and mythical dungeons in this expansive open-world RPG!', 
'6000', '4.5', '10254240', '70M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (97, 'Image','https://lh3.googleusercontent.com/G3gkhGlmTlSNUhjj4UILyiLjcbrwAdCofO0jNNGWs1lyYgpP603jSKz_c39EIbEDBZo=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (97, 55);
INSERT INTO options(optionID, optionName, resources) 
VALUES (98, 'Image','https://lh3.googleusercontent.com/t-DHYDW6_6SVQTT3ZaDYcVUcK2zqLg0zXjb2el3GHnX7drpcMbSelCIwfkxskKuKa78=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (98, 55); 

-- Phiêu lưu
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(56, 25, 'FPS Commando Secret Mission - Free Game',
'Welcome to the army FPS commando missions. You will meet all the terrorists as a specially trained military commando in the FPS 2020 shooting game.', 
'0', '3.5', '10015896', '26M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (99, 'Image','https://lh3.googleusercontent.com/OFTJIZPepEP446U--xBqp3naQm8RNLBkpDNVOm7iqgrBg_tpWI9Cuo1NPc-4qkubu2oO=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (99, 56);
INSERT INTO options(optionID, optionName, resources) 
VALUES (100, 'Video','https://www.youtube.com/embed/EYlXAM56lGg?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (100, 56); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(57, 25, 'Anti Terrorist Shooter 2020: Free Game',
'Hello Fans of free shooting games. Welcome to join the new action game.', 
'0', '4.5', '1045896', '39M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (101, 'Image','https://lh3.googleusercontent.com/ZxQ5Vm44ScwKPR9xLqiL_-opERaMudTQPiVa_Uou9Xzz4yeJoqz9KWaHVT3VlnvklhBn=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (101, 57);
INSERT INTO options(optionID, optionName, resources) 
VALUES (102, 'Image','https://lh3.googleusercontent.com/iVwm73uHODfRBMgecip6DSRFU7VndpEg1OqhvG5-i2UsbbdcRTsOc7GR5xO5RyLpzng=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (102, 57); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(58, 25, 'Alien: Blackout',
'The terror of Alien is brought to life in Alien: Blackout. Try to stay alive while trapped aboard a crippled Weyland-Yutani space station 
carrying a deadly Xenomorph as it tirelessly hunts you and the crew. Outsmart the perfect hunter by making perilous choices. 
Players must rely on the damaged controls of the space station or risk sacrificing crew members to avoid deadly contact, 
permanently altering the outcome of the game.', 
'0', '4.2', '1015895', '31M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (103, 'Image','https://lh3.googleusercontent.com/tZsW2cETxSjdJk7RGW6hskzEHBjMGUhvbi7qG-Ae8nJMkGegbpMmE_GoCMLW8ROpgY4=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (103, 58);
INSERT INTO options(optionID, optionName, resources) 
VALUES (104, 'Video','https://www.youtube.com/embed/qZIol5bMgBk?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (104, 58); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(59, 26, 'MARVEL Puzzle Quest: Join the Super Hero Battle!',
'S.H.I.E.L.D. misappropriated powerful new resource Iso-8, Super Villain Norman Osborn took over the agency and replaced it 
with H.A.M.M.E.R., power-hungry in The Dark Reign. Super Heroes and villains link together in this RPG game to end Norman Osborn rise and 
rebalance the Marvel Universe!', 
'6000', '4.8', '10259860', '114M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (105, 'Image','https://lh3.googleusercontent.com/zvXPpFrfDZASyOxawPWGbmWSgdLC_o2-jGj9eTrn0kYGPpfJG4Wtck4NQmIzuUAVuOM=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (105, 59);
INSERT INTO options(optionID, optionName, resources) 
VALUES (106, 'Video','https://www.youtube.com/embed/KlodShEjUAY?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (106, 59); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(60, 26, 'Magic: Puzzle Quest',
'Magic: The Gathering and the original Match 3 RPG are re-imagined in Magic: Puzzle Quest, an epic deck building, strategy and deep leveling role playing game!
Kotaku says it “is a marriage of two distinct games into a unique new experience.”', 
'0', '4.9', '1258450', '54M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (107, 'Image','https://lh3.googleusercontent.com/DUaK3acy2UmToRAST-rtkAnEuh3hGywRzPe0X4eneKNy4SRBM4N9EU6Qke6-PW-7riE=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (107, 60);
INSERT INTO options(optionID, optionName, resources) 
VALUES (108, 'Video','https://www.youtube.com/embed/TEPcPVbuzW4?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (108, 60); 

-- Sòng Bạc
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(61, 27, 'Super Blackjack 2',
'BLACKJACK 2: THE BEST Blackjack GAMES ONLINE or OFFLINE! Play Las Vegas Casino Blackjack 21 with the Black Jack 21 FREE APP!
The Best FREE blackjack card game app! Play LIVE tournaments online or offline!', 
'25000', '3.2', '100250', '30M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (109, 'Image','https://lh3.googleusercontent.com/rxgyXn-vPwKVP4lkrt7XlNX87dbMOLmENHfKc0GLb1I0lqd-V9ELb8BEJGUipa941g=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (109, 61);
INSERT INTO options(optionID, optionName, resources) 
VALUES (110, 'Video','https://www.youtube.com/embed/swTuPm9UQyc?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (110, 61); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(62, 27, 'Snipey 72',
'This is a full application version of Pachi "Sunaipai 72". Auto Play, also set the device default function changes.
Please experience the reality of the pachinko hall in your smartphone.', 
'24000', '3.8', '104000', '32M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (111, 'Image','https://lh3.googleusercontent.com/_MIuCYh67T5hdV1IsKT78ruL06V-6fdN7pwLDyjbRauSNGLq4WFQ7ywUZ0_vLz93CNM=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (111, 62);
INSERT INTO options(optionID, optionName, resources) 
VALUES (112, 'Video','https://www.youtube.com/embed/W4-nWt9FtSk?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (112, 62); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(63, 28, 'Crock OGold Slots 3 ReSpin Party PAID',
'With a HUGE VARIETY OF SLOTS and pokies, UNLIMITED FREE COINS and MULTI Minor, Major and Grand PROGRESSIVE JACKPOTS, 
try to win as much cash as possible by also playing bonus features such as Roulette, Scratchcards, Higher or Lower Cards and 
Lucky Dice to accumulate virtual credit prizes.', 
'28000', '3.4', '150000', '32M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (113, 'Image','https://lh3.googleusercontent.com/Yce5FUFcBaCXktWxe662TWho-t_OiChJBmYh07Tn5NcD8YEJEZmVrcgfSdvjcWMeE6U=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (113, 63);
INSERT INTO options(optionID, optionName, resources) 
VALUES (114, 'Video','https://www.youtube.com/embed/6XpP9wNcZW8?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (114, 63); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(64, 29, 'Crock OGold Slots 3 ReSpin Party FREE',
'With a HUGE VARIETY OF SLOTS and pokies, UNLIMITED FREE COINS and MULTI Minor, Major and Grand PROGRESSIVE JACKPOTS, 
try to win as much cash as possible by also playing bonus features such as Roulette, Scratchcards, Higher or Lower Cards and Lucky Dice 
to accumulate virtual credit prizes.', 
'0', '3.8', '100200', '32M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (115, 'Image','https://lh3.googleusercontent.com/iA1JpZFUtrINTcdLht8RTzE8S9b24_2Yq5QU4rpNwnbBWizAtYkyYg_CC1GK7V9uCj4E=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (115, 64);
INSERT INTO options(optionID, optionName, resources) 
VALUES (116, 'Video','https://www.youtube.com/embed/6XpP9wNcZW8?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (116, 64); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(65, 30, 'Crock OGold Rainbow Slots PAID',
'With UNLIMITED FREE COINS try to win as much cash as possible by also playing features such as the Leprechaun Riches Bonus Feature, 
Lucky Shamrock and Crock OGold mini-games to accumulate virtual credit prize bonuses.', 
'28000', '3.5', '100101', '32M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (117, 'Image','https://lh3.googleusercontent.com/-45j5q5RitETd1dsFsC-rJGcNoXKYKXiqNbmGNLkiTNvWnTGOZYWdoYVfTXDn_zwEwBK=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (117, 65);
INSERT INTO options(optionID, optionName, resources) 
VALUES (118, 'Image','https://lh3.googleusercontent.com/tLE9UBnN04DHRgaC4Xx6vRyyO6eKEqh2IARx_JdKZr5zI-mYwrpzHdPRbyi7Od432rqy=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (118, 65); 

-- Thẻ Bài
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(66, 29, 'Solitales: game Solitaire Tripeaks cổ điển ở Vườn',
'It a classic solitaire card game. Tripeaks, also known as Tri Towers, Triple Peaks or Three Peaks, are a few great examples of solitaire. 
Or do you like Pyramid, Klondike or Spider Solitaire? Or Free Cell? It up to you to choose!', 
'0', '4.2', '100025', '85M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (119, 'Image','https://lh3.googleusercontent.com/v78lRb-06cbu03jtoIRdyit2jaGZyz_-qtkQQc9a5JaK9_vVpnVevKsBV3cJjt-12mqj=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (119, 66);
INSERT INTO options(optionID, optionName, resources) 
VALUES (120, 'Video','https://www.youtube.com/embed/moMeS8hqnjI?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (120, 66); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(67, 30, 'Tien Len',
'Version up for free, no need to load coins anything.
Going south can fight with the computer, extremely smart 4-player mode.
Everyone can play first, but depending on the amount of coins you have to choose the right bet, 1k, 2k, 5k up to 5 million coins a game.
When fighting to the south but you are busy with something you dont care about, just pause the game we will save the final state and when 
it done you can switch back up, play continue easily, gambling has never been so easy.', 
'0', '4.5', '1026800', '32M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (121, 'Image','https://lh3.googleusercontent.com/vphTijrbg0NzaH1C_v8mpuFBUEjfQyd9bshFVsj4BVrv4qy-DOKm40hqfK6z1NIbrsx7=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (121, 67);
INSERT INTO options(optionID, optionName, resources) 
VALUES (122, 'Image','https://lh3.googleusercontent.com/qpH2T5IivoQ_yVBiA3-Qm6g2WbUkrAOloXNK3yAXiPToQLlt6JtZOwnJQgo0Xx2Z9A=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (122, 67); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(68, 30, 'Bai cao - Lieng',
'Lieng has a simple way to play, easy to grasp. There is a play style similar to the high card of the South, which many people know and love.
 Simple gameplay, fast, attractive, but equally brain-weighted game, Bai Lieng game promises to become a favorite game.', 
'0', '4.8', '50200', '32M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (123, 'Image','https://lh3.googleusercontent.com/5A61Ok8wvoXM2VY29xtD3fZlUUK8gcEfsqKpQzmcqyAk2XapSTU1FgnISLAoIBNMebA=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (123, 68);
INSERT INTO options(optionID, optionName, resources) 
VALUES (124, 'Video','https://www.youtube.com/embed/pJWSwwijGTo?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (124, 68); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(69, 30, 'Sam Loc',
'I wish you all fun playing the game, and at the same time I remind you that I have other games such as: go ahead, coin, len mien nam, 
four colors, gray gray, scratch cards, dozen lemons, phom, catte Dont forget.', 
'0', '3.8', '1056000', '32M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (125, 'Image','https://lh3.googleusercontent.com/byqjaUYCnGPDhWhM0UlLE4tv5cxaWlal6AmPo7D8aLQ-gaiTc4kG0WwdVsOF_FVADg=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (125, 69);
INSERT INTO options(optionID, optionName, resources) 
VALUES (126, 'Image','https://lh3.googleusercontent.com/IpbMcmh0CmWONL1JWdLk2C9LOmn7K1dehyQUoMQEUIUsnXUNU5Tnvh-GhuoxhQOARAU=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (126, 69); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(70, 30, 'Phom - Ta La',
'Phom Offline is a completely free version and does not need internet, wifi can still be played. Players can play Phom cards anytime and 
anywhere without worrying about losing their lives or having to recharge the game.', 
'0', '3.2', '1000250', '32M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (127, 'Image','https://lh3.googleusercontent.com/rDX92-q5jpqUDeYB9dsBx44Ngar-QNHgtGQnr5z0xTWL70T1Yk4IFEZUdRAG7PDB3w=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (127, 70);
INSERT INTO options(optionID, optionName, resources) 
VALUES (128, 'Image','https://lh3.googleusercontent.com/Y3AYsmZhoYKVQxXEJgMPrM9Ev1jr5-4_yHtsKj69AekR15OcfbFlwB_pCsSvZYgwuXLZ=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (128, 70); 

-- Thể Thao
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(71, 31, 'Archery Club: PvP Multiplayer',
'Archery Club is a multiplayer archery game with a variety of fun game styles and an extensive upgrade system. Become a master archer, 
collect the best equipment, and win online against other opponents!', 
'6000', '4.8', '1052000', '119M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (129, 'Image','https://lh3.googleusercontent.com/j1uF9doq2tu6fn-XKA-e0s3ZIo1q0NA1K49dWy49moq90-q4YoZUZs_L_GdltqbSkw=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (129, 71);
INSERT INTO options(optionID, optionName, resources) 
VALUES (130, 'Video','https://www.youtube.com/embed/qdDsFhtWBgw?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (130, 71); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(72, 32, 'Pooking - Billiards City',
'Billiards City is a modern pool style game with single player, if you like a relaxing game of 8 balls, this is the game for you!', 
'0', '4.8', '12516487', '41M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (131, 'Image','https://lh3.googleusercontent.com/GX2TaMJf2dWDsDva9feSz8u4b0bP0ldc68Dka9KiZL16HvzcghN9T2jygTlElZNElrE=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (131, 72);
INSERT INTO options(optionID, optionName, resources) 
VALUES (132, 'Video','https://www.youtube.com/embed/2GtT-ZNr_q4?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (132, 72); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(73, 32, 'Billiards Nation',
'Play the best offline 8 Ball Billiard game on Android. No waiting for opponents. You do not need wifi. You play with the best 8 ball pool players. 
You may become the best of pool players.', 
'0', '4.6', '551249', '52M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (133, 'Image','https://lh3.googleusercontent.com/GX2TaMJf2dWDsDva9feSz8u4b0bP0ldc68Dka9KiZL16HvzcghN9T2jygTlElZNElrE=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (133, 73);
INSERT INTO options(optionID, optionName, resources) 
VALUES (134, 'Video','https://www.youtube.com/embed/2GtT-ZNr_q4?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (134, 73); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(74, 33, 'FIFA Online 4 M by EA SPORTS™',
'FIFA Online 4 Vietnam officially released the phone version. From now on, you can fulfill the dream of grass field anytime, anywhere easily.
FIFA Online 4 Vietnam has copyrighted over 32 tournaments and 15000 players worldwide. Building your dream team is now at your fingertips.', 
'0', '4.5', '1000524', '52M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (135, 'Image','https://lh3.googleusercontent.com/kowbsYz1izsnyoHfq3swmjTKuYP4xN3RfQ4mB2EX5PL9Ot_OC2ONKB4TigmjDu7iExY=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (135, 74);
INSERT INTO options(optionID, optionName, resources) 
VALUES (136, 'Video','https://www.youtube.com/embed/g2fB58tzLYI?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (136, 74); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(75, 33, 'FIFA Online EA SPORTS™',
'The data is completely synchronized with FIFA Online 4 on the computer to help manage the team, upgrade, buy and sell players in the transfer market and open items faster and more convenient than ever.
World Tour mode only available on FIFA Online 4M will be the place for you to conquer the heights in the highest tournaments, along with the attractive rewards.', 
'6000', '3.8', '5105000', '52M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (137, 'Image','https://lh3.googleusercontent.com/vn5LTXi4Jz4MfwysHoAKgij63rZwtblP7eXRWKlmqqweGSuw3v5h-MKvXxHeYfrjVQ=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (137, 75);
INSERT INTO options(optionID, optionName, resources) 
VALUES (138, 'Video','https://www.youtube.com/embed/JfDdYlDf_JA?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (138, 75); 

-- Thông Thường
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(76, 1, 'Homescapes',
'Welcome to Homescapes! Help Austin the butler bring warmth and comfort back to his wonderful familys mansion. 
Come on in—adventures await you from the moment you walk in the door!', 
'12000', '3.2', '1130000', '148M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (139, 'Image','https://lh3.googleusercontent.com/2wBdWQFN8XUpt9bRw7snLR-m95A97sAxGcsV21T4ah6MbMXsboGnidA35dEAz9Q3w3I=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (139, 76);
INSERT INTO options(optionID, optionName, resources) 
VALUES (140, 'Video','https://www.youtube.com/embed/v8vr-IwAPPA?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (140, 76); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(77, 1, 'Gardenscapes',
'Embark on an adventurous journey: beat match-3 levels, restore and decorate different areas in the garden, get to the bottom of the secrets 
it holds, and enjoy the company of amusing in-game characters, including Austin, your butler, and a funny dog! What are you waiting for? 
Indulge yourself in some gardening and become the hero of a brand new story. Build your dream garden for free!', 
'0', '3.1', '1050000', '145M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (141, 'Image','https://lh3.googleusercontent.com/r_k-j67HS58xC-DZwg0BDLnVblk0S3puTor67vMtedKqCg8KvuWNVkvAbKGdQRn8_g=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (141, 77);
INSERT INTO options(optionID, optionName, resources) 
VALUES (142, 'Video','https://www.youtube.com/embed/oq7QxDh_b1c?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (142, 77); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(78, 3, 'Save The Girl',
'The tricky and relaxing puzzle game you’ve been seeing all this time is finally a reality! Only the smartest will be able to solve 
these brain teaser tests in order to save the girl from the villains chasing her! Each level will present you with a scenario that 
you will have to use your IQ and wit to solve. Solve the funny challenge correctly and the woman will proceed on. Get it wrong, 
then it won’t end well for our heroine.', 
'6000', '3.8', '10032100', '43M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (143, 'Image','https://lh3.googleusercontent.com/38aCDbu6aoCPtQoT6BX3Rif3R4YRASgb6dGm3s7RAu7n6xxgBRn7YskQN8kOLylokg=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (143, 78);
INSERT INTO options(optionID, optionName, resources) 
VALUES (144, 'Video','https://www.youtube.com/embed/SX4d9pP4xKQ?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (144, 78); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(79, 3, 'Fruit Clinic',
'Prepare your tools and heal the fruits.
Be careful, as an official fruit operator take your job seriously and let the fruits leave your clinic happy.
The more fruits and vegetables you help the more you will earn.', 
'0', '3.5', '5000000', '89M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (145, 'Image','https://lh3.googleusercontent.com/C3cdFreryJmLcZOR1ON_mamj3bcvxLLDcLiqNQVIjUAi_MXpUV5U0FWBdo6Uigdlk-4=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (145, 79);
INSERT INTO options(optionID, optionName, resources) 
VALUES (146, 'Video','https://www.youtube.com/embed/eF9bcl8zW5k?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (146, 79); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(80, 1, 'Wildscapes',
'Build spacious enclosures for animals and make your zoo visitor-friendly with cafes, fountains, playgrounds, hangout spots, and more! 
Learn about species from all over the world and create the best zoo ever! Ready for a wild ride? Then hop on!', 
'6000', '3.9', '10010000', '171M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (147, 'Image','https://lh3.googleusercontent.com/fit7FbYONYMN4MdZVgf0uddaoMv5nCyBDABcdxUArmCldVcQouMzH4s0m85_SAZ2CQ=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (147, 80);
INSERT INTO options(optionID, optionName, resources) 
VALUES (148, 'Video','https://www.youtube.com/embed/AAnkLKIX5kU?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (148, 80); 

-- Tìm ô chữ 
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(81, 34, 'Scrabble® GO - New Word game',
'Welcome to Scrabble GO, the new and updated version of the classic crossword game!', 
'20000', '3.9', '10001500', '104M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (149, 'Image','https://lh3.googleusercontent.com/4BpvouLX4ztpiVi6PgDNcRxaMY_Ww54sWhsMfEMfsM1aNjQFC_5bgjfKLarvzM8KV-A=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (149, 81);
INSERT INTO options(optionID, optionName, resources) 
VALUES (150, 'Video','https://www.youtube.com/embed/85DTEe8GfZQ?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (150, 81); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(82, 34, 'ThanTai - Giai doithuong doan chu',
'It is a game about guessing words through 4 pictures. One word in common among 4 visual goals is identifying words and filling in answers.', 
'0', '3.2', '10568000', '52M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (151, 'Image','https://lh3.googleusercontent.com/yNvdfaTMilFxaVwQLxibYSmkn1dJL7ZWopuF_vVKWnq5hI92OC2E8ioVx_JLYCOIVeM=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (151, 82);
INSERT INTO options(optionID, optionName, resources) 
VALUES (152, 'Video','https://www.youtube.com/embed/nUmwEJjxDjQ?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (152, 82); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(83, 34, 'Wordscapes Search',
'Would you like to relax, exercise your brain, and expand your vocabulary-all at the same time? With Wordscapes Search , 
the NEWEST game from the makers of Wordscapes, you can! These incredibly addicting word search puzzles are brain blasting fun! 
Connect letters to find every word on the board and sail through thousands of classic puzzle levels set against stunning nature backgrounds.
 Training your brain has never been easier —or more relaxing. Once you start playing, you just wont be able to put it down!', 
'1000', '4.2', '1009500', '100M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (153, 'Image','https://lh3.googleusercontent.com/Z36V5WNbrfNku1JbN97u8m2Wr1AXIs-NSLVWdsKzF1JBABYmSUeAM-_yFYw7vJcaDR4=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (153, 83);
INSERT INTO options(optionID, optionName, resources) 
VALUES (154, 'Video','https://www.youtube.com/embed/53z_vpAu9is?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (154, 83); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(84, 34, 'Wordscapes',
'This text twist of a word game is tremendous brain challenging fun. Enjoy modern word puzzles with the best of word searching, anagrams, 
and crosswords!', 
'0', '4.8', '1052000', '112M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (155, 'Image','https://lh3.googleusercontent.com/tf8zsw-KDgl_LBogFLJ31V6t-HJOPULRxgglTYDhrALJ63T4FDfOSPt3QJWGIpntyFM=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (155, 84);
INSERT INTO options(optionID, optionName, resources) 
VALUES (156, 'Video','https://www.youtube.com/embed/f_xqk8RMMsg?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (156, 84); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(85, 34, 'Word Stacks',
'Would you like to relax, exercise your brain, and expand your vocabulary-all at the same time? With Word Stacks, 
the brand NEW & incredibly addicting word game from the makers of Wordscapes, you can!', 
'0', '5', '10052000', '84M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (157, 'Image','https://lh3.googleusercontent.com/eq3DmgSc5QpoACTAIUrSYmiOOLCie3lO0OwHdNvIc4Jbh9flUdLONQeK7Dibl8dptobn=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (157, 85);
INSERT INTO options(optionID, optionName, resources) 
VALUES (158, 'Video','https://www.youtube.com/embed/VOWMBiYB9Jo?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (158, 85); 

-- Trò chơi điện tử
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(86, 19, 'Looney Tunes™ World of Mayhem - Action RPG',
'Join Bugs Bunny, Daffy Duck, Marvin the Martian and all the classic toons to build the greatest “Toon Team” in Looney Tunes™ World of Mayhem! 
Collect cartoon characters like Tweety Bird, Taz, Road Runner and more to wage wacky battles in a vibrant Looney Tunes™ World.', 
'0', '4.2', '1054800', '47M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (159, 'Image','https://lh3.googleusercontent.com/pnHfiauzr1lXa1b8KEVo3YDaOKVWhtLr8vF6_C12TbVZfFeVP7Bkoz8zRE9FjQGr_zY=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (159, 86);
INSERT INTO options(optionID, optionName, resources) 
VALUES (160, 'Image','https://lh3.googleusercontent.com/6I5YNUZtPGYT1e0kHF7Jv00-ieHPJdvkdr64rQueYONtN6YvszST-uGIoxEoPAFYS9U=w1536-h754-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (160, 86); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(87, 19, 'Tower Run',
'Tap at the right time to make a tower of humans.', 
'0', '3.4', '10015000', '90M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (161, 'Image','https://lh3.googleusercontent.com/y9wAYLfJ4UeDp0mqh-dwq5F49l0PjBvLkNW0k8o9CfuzW8LfIHlBJRESqQCUvj-Dng=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (161, 87);
INSERT INTO options(optionID, optionName, resources) 
VALUES (162, 'Image','https://lh3.googleusercontent.com/oMeSgLPCEok8ECwH9G36_RRJX8OxtgQXoSwHzBJKAwW5gn3_P0h5cnRA1tspvEjv0w2X=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (162, 87); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(88, 19, 'Good Slice',
'Relax and cut the fruits to get it all to fall in the blender!', 
'0', '3.8', '15641000', '90M', 'non-active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (163, 'Image','https://lh3.googleusercontent.com/EZ_cXxVDZp74VPcdAh9Bcz076HI_wKwh7__6XPMXVZcotWVlaPxlYH9LZ4mq6axU8XE=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (163, 88);
INSERT INTO options(optionID, optionName, resources) 
VALUES (164, 'Image','https://lh3.googleusercontent.com/NRMjMyvOISF5psKCnTMkhHuvD29vwD7bu8sPv_Fpn29jl-OY8HCHipLhMSRHtBkw8yQA=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (164, 88); 
	
INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(89, 19, 'Draw Climber',
'Funniest race you ever played!, Draw your legs to win the race!, Any drawing will make you run!,
When you are stuck you can draw another shape to pass!', 
'0', '3.8', '5058400', '67M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (165, 'Image','https://lh3.googleusercontent.com/ykGTZy7sIrzxYSDs34kPqGGY8osV0jjqXZ26RpwqVJFqYKEvOyGAylK_Z2HKiPp3Kw=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (165, 89);
INSERT INTO options(optionID, optionName, resources) 
VALUES (166, 'Video','https://www.youtube.com/embed/jTKLzZQyiCY?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;authuser=0');
INSERT INTO gameOptions(optionID, gameID) VALUES (166, 89); 

INSERT INTO games(gameID, publisherID, gameName, gameDescription, gamePrice, rating, gameDownloadTimes, size, gameStatus)
VALUES(90, 19, 'Hole.io',
'Enter the arena and face the other holes in a fierce battle.
Eat everything in sight with your black hole and expand it to eat more! Show them who is the biggest hole in town!', 
'12000', '4.2', '5058470', '100M', 'active');
INSERT INTO options(optionID, optionName, resources) 
VALUES (167, 'Image','https://lh3.googleusercontent.com/0dR2wX1gFEJJ5nytYHer6PvySJWnG-AfbExWBHfhI281pq0aNQHXYyxUNlV5S3CcQwNr=s180-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (167, 90);
INSERT INTO options(optionID, optionName, resources) 
VALUES (168, 'Video','https://lh3.googleusercontent.com/bafh-aLux3PVbMWSFMnBe0snoiQoVaJcptOgD_hIzgFss3AftfxVJuPNAAJ1wHsM_XJD=w720-h310-rw');
INSERT INTO gameOptions(optionID, gameID) VALUES (168, 90); 


-- insert categoryDetail
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 1);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 2);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 3);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 4);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 5);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 6);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 7);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 8);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 9);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (1, 10);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (2, 11);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (2, 12);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (2, 13);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (2, 14);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (2, 15);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (3, 16);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (3, 17);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (3, 18);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (3, 19);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (3, 20);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (4, 21);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (4, 22);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (4, 23);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (4, 24);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (4, 25);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (5, 26);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (5, 27);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (5, 28);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (5, 29);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (5, 30);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (6, 31);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (6, 32);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (6, 33);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (6, 34);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (6, 35);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (7, 36);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (7, 37);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (7, 38);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (7, 39);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (7, 40);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (8, 41);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (8, 42);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (8, 43);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (8, 44);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (8, 45);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (9, 46);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (9, 47);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (9, 48);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (9, 49);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (9, 50);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (10, 51);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (10, 52);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (10, 53);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (10, 54);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (10, 55);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (11, 56);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (11, 57);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (11, 58);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (11, 59);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (11, 60);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (12, 61);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (12, 62);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (12, 63);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (12, 64);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (12, 65);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (13, 66);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (13, 67);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (13, 68);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (13, 69);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (13, 70);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (14, 71);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (14, 72);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (14, 73);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (14, 74);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (14, 75);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (15, 76);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (15, 77);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (15, 78);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (15, 79);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (15, 80);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (16, 81);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (16, 82);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (16, 83);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (16, 84);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (16, 85);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (17, 86);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (17, 87);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (17, 88);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (17, 89);
INSERT INTO categoryDetails(categoryID, gameID) VALUES (17, 90);


-- insert rate


-- PROCEDURE
DELIMITER $$
CREATE PROCEDURE getAllgames(IN sets INT)

BEGIN
SELECT g.gameName,g.gameID, s.publisherName,concat(substr(g.gameDescription,1,40),'')AS gameDescription,g.gamePrice,c.categoryName AS `gameType`,g.rating,g.gameDownloadTimes,g.size
 FROM games AS g INNER JOIN categoryDetails AS cd ON cd.gameID = g.gameID INNER JOIN categories AS c ON c.categoryID = cd.categoryID 
 INNER JOIN publishers AS s ON g.publisherID = s.publisherID
ORDER BY g.gamename
 LIMIT 6 OFFSET sets;
END; $$
DELIMITER ;
-- end getallgames
DELIMITER $$
CREATE PROCEDURE getDownloadTimes(IN gameID INT)

BEGIN
	SELECT g.gameDownloadTimes from games as g 
    WHERE g.gameID = gameID;
END; $$
DELIMITER ;
-- end getDownloadTimes
DELIMITER $$
CREATE PROCEDURE getGameByID(IN gameID INT)

BEGIN
	SELECT 
    g.gameName,
    g.gameID,
    s.publisherName,
    CONCAT(SUBSTR(g.gameDescription, 1, 40),
            '') AS gameDescription,
    g.gamePrice,
    c.categoryName AS `gameType`,
    g.rating,
    g.gameDownloadTimes,
    g.size
FROM
    games AS g
        INNER JOIN
    categoryDetails AS cd ON cd.gameID = g.gameID
        INNER JOIN
    categories AS c ON c.categoryID = cd.categoryID
        INNER JOIN
    publishers AS s ON g.publisherID = s.publisherID
    WHERE g.gameID = gameID;
END; $$
DELIMITER ;
-- end getGameByID
DELIMITER $$
CREATE PROCEDURE createOrder(IN accountID INT,IN gameID INT,IN priceOfGame DOUBLE, IN orderCreateDate VARCHAR(255) ,IN totalBill double ,IN orderStatus VARCHAR(255))
BEGIN
	iNSERT INTO orders(accountID,gameID,priceOfGame,orderCreateDate,totalBill,orderStatus)
    VALUES (accountID,gameID,priceOfGame,orderCreateDate,totalBill,orderStatus);
END; $$
DELIMITER ;
-- end createOrder
DELIMITER $$
CREATE PROCEDURE getUser(IN username VARCHAR(255))
BEGIN
SELECT ac.accountID, ac.pass,concat(ac.firstname,' ',ac.lastname)as fullname,
ac.birthday,ac.address,ac.phone,ac.money,ac.mail,ac.createDate,ac.accountStatus,ac.username FROM accounts AS ac WHERE ac.username = username;
END ; $$
DELIMITER ;
-- end getUser
DELIMITER $$
CREATE PROCEDURE getUserName(IN username VARCHAR(255))
BEGIN
SELECT ac.username FROM accounts AS ac WHERE ac.username = username;
END ; $$
DELIMITER ;
-- end getUserName
DELIMITER $$
CREATE PROCEDURE getPassword(IN username VARCHAR(255))
BEGIN
SELECT ac.pass FROM accounts AS ac WHERE ac.username = username;
END ; $$
DELIMITER ;
-- end getPassword
DELIMITER $$
CREATE PROCEDURE updateAccountStatus(IN username VARCHAR(255),IN statusIN VARCHAR(255))
BEGIN
	UPDATE accounts AS ac
    SET ac.accountStatus = statusIN
    WHERE ac.username = username;
END ; $$
DELIMITER ;
-- end updateAccountStatus
DELIMITER $$
CREATE PROCEDURE updateMoney(IN username VARCHAR(255), IN money DOUBLE)
BEGIN

	UPDATE accounts AS ac
    SET ac.money = ac.money+money
    WHERE ac.username = username;
END ; $$
DELIMITER ;
-- end updateMoney

DELIMITER $$

CREATE PROCEDURE getOrder(IN gameID INT, IN  accountID INT)
BEGIN
	SELECT * FROM orders AS o 
    WHERE o.gameID = gameID AND o.accountID = accountID;
END ; $$
DELIMITER ;
-- end isGameBought

DELIMITER $$

CREATE PROCEDURE getOrders(IN  accountID INT)
BEGIN
	SELECT * FROM orders AS o 
    WHERE o.accountID = accountID;
END ; $$
DELIMITER ;
DELIMITER $$

CREATE PROCEDURE buyGame(IN  gamePrice double, IN userName VARCHAR(255))
BEGIN
	update accounts as ac 
    set ac.money  = ac.money-  gamePrice
	where ac.username= username;
END ; $$
DELIMITER ;
-- end buyGame

DELIMITER $$
CREATE PROCEDURE updateTimesDownload(IN  gameID int)
BEGIN
	UPDATE games AS g 
SET 
    g.gameDownloadTimes = g.gameDownloadTimes + 1
WHERE
    g.gameID = gameID;
END ; $$
DELIMITER ;
-- end updateTimesDownload

DELIMITER $$
CREATE PROCEDURE searchGame(IN  gameName varchar(255),IN offsets INT)
BEGIN
	SELECT 
    g.gameName,
    g.gameID,
    s.publisherName,
    CONCAT(SUBSTR(g.gameDescription, 1, 40),
            '') AS gameDescription,
    g.gamePrice,
    c.categoryName AS `gameType`,
    g.rating,
    g.gameDownloadTimes,
    g.size
FROM
    games AS g
        INNER JOIN
    categoryDetails AS cd ON cd.gameID = g.gameID
        INNER JOIN
    categories AS c ON c.categoryID = cd.categoryID
        INNER JOIN
    publishers AS s ON g.publisherID = s.publisherID
where g.gameName like (concat('%',gamename,'%'))
ORDER BY g.gamename
 LIMIT 6 OFFSET offsets;
END ; $$
DELIMITER ;
-- end searchGame

DELIMITER $$
	CREATE TRIGGER tg_beforeUpdate
	BEFORE UPDATE ON accounts FOR EACH ROW
	IF NEW.money < 0 THEN
	SIGNAL sqlstate '45001' set message_text = "Have not enough money to purchase!";
	END IF ;
	END $$ 
DELIMITER ;


