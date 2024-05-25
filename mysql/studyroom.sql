-- 用户表
CREATE TABLE `User` (
    UserId INT PRIMARY KEY AUTO_INCREMENT, -- 用户ID，主键，自增
    userName VARCHAR(100) NOT NULL, -- 用户名，不为空
    userKey VARCHAR(100) NOT NULL, -- 用户密钥，不为空
    school VARCHAR(100), -- 学校
    sex ENUM('male', 'female'), -- 性别，枚举类型
    birthday DATE, -- 生日
    telephone VARCHAR(20), -- 电话号码
    Role ENUM('student', 'admin') NOT NULL -- 角色，不为空，枚举类型
);
-- DROP TABLE user;
-- 
-- 自习室表
CREATE TABLE StudyRooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT, -- 自习室ID，主键，自增
    RoomName VARCHAR(100) NOT NULL, -- 自习室名称，不为空
    Location VARCHAR(100), -- 自习室位置
    Capacity INT NOT NULL, -- 自习室容量，不为空
    Status ENUM('available', 'reserved', 'closed') NOT NULL, -- 自习室状态，不为空，枚举类型
    ImagePath VARCHAR(255) -- 图片路径，用于存储自习室图片
);

-- 座位表
CREATE TABLE Seats (
    SeatID INT PRIMARY KEY AUTO_INCREMENT, -- 座位ID，主键，自增
    RoomID INT, -- 自习室ID，外键
    SeatNumber INT NOT NULL, -- 座位号，不为空
    FOREIGN KEY (RoomID) REFERENCES StudyRooms(RoomID) -- 外键约束，关联自习室表中的自习室ID
);

-- 预订表
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT, -- 预订ID，主键，自增
    UserID INT, -- 用户ID，外键
    SeatID INT, -- 座位ID，外键
    BookingDate DATE, -- 预订日期
    StartTime TIME, -- 预订开始时间
    EndTime TIME, -- 预订结束时间
    Status ENUM('pending', 'confirmed', 'cancelled') NOT NULL, -- 预订状态，不为空，枚举类型
    FOREIGN KEY (UserID) REFERENCES `User`(UserID), -- 外键约束，关联用户表中的用户ID
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID) -- 外键约束，关联座位表中的座位ID
);

-- -- 使用记录表
-- CREATE TABLE UsageRecords (
--     RecordID INT PRIMARY KEY AUTO_INCREMENT, -- 记录ID，主键，自增
--     UserID INT, -- 用户ID，外键
--     SeatID INT, -- 座位ID，外键
--     StartTime DATETIME, -- 使用开始时间
--     EndTime DATETIME, -- 使用结束时间
--     Purpose TEXT, -- 使用目的
--     FOREIGN KEY (UserID) REFERENCES Users(UserID), -- 外键约束，关联用户表中的用户ID
--     FOREIGN KEY (SeatID) REFERENCES Seats(SeatID) -- 外键约束，关联座位表中的座位ID
-- );
-- 
-- 管理员日志表
CREATE TABLE AdminLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT, -- 日志ID，主键，自增
    AdminID INT, -- 管理员ID，外键
    Action TEXT NOT NULL, -- 操作内容，不为空
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP, -- 时间戳，默认为当前时间
    FOREIGN KEY (AdminID) REFERENCES `User`(UserID) -- 外键约束，关联用户表中的用户ID
);

-- 插入示例数据
INSERT INTO user (userName, userKey, school, sex, birthday, telephone, Role) VALUES
('Alice', 'password123', 'University A', 'female', '1990-05-15', '1234567890', 'admin'),
('Bob', 'password456', 'University B', 'male', '1992-08-25', '9876543210', 'student');

INSERT INTO user (userName, userKey, school, sex, birthday, telephone, Role) VALUES
('Charlie', 'password789', 'University C', 'male', '1991-03-20', '1231231234', 'student'),
('Diana', 'passwordabc', 'University D', 'female', '1993-11-10', '4564564567', 'student');

INSERT INTO StudyRooms (RoomName, Location, Capacity, Status, ImagePath) VALUES
('Room 101', 'Building A, Floor 1', 50, 'available', '/images/room101.jpg'),
('Room 102', 'Building B, Floor 2', 30, 'reserved', '/images/room102.jpg');

INSERT INTO Seats (RoomID, SeatNumber) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);
INSERT INTO Bookings (UserID, SeatID, BookingDate, StartTime, EndTime, Status) VALUES
(1, 1, '2024-05-21', '08:00:00', '09:00:00', 'confirmed'), -- Alice预定了Room 101的座位1，从08:00到09:00
(2, 3, '2024-05-21', '09:00:00', '10:00:00', 'pending');  -- Bob预定了Room 102的座位1，从09:00到10:00


-- DROP TABLE comment;
-- 留言板
CREATE TABLE `comment`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级评论id（查一级，二级的时候方便）,为null则为一级评论',
  `user_id` INT COMMENT '用户id',
  `comment_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `comment_date` datetime(0) NULL DEFAULT NULL COMMENT '评论日期',
  `replied_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被回复评论id',
  `replied_user_id` INT COMMENT '被回复用户id',
  PRIMARY KEY (`id`) USING BTREE,
	 FOREIGN KEY (`user_id`) REFERENCES `user` (`UserId`),
	FOREIGN KEY (`replied_user_id`) REFERENCES `user` (`UserId`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;


-- 插入示例数据
INSERT INTO `comment` (`id`, `parent_id`, `user_id`, `comment_content`, `comment_date`, `replied_id`, `replied_user_id`) VALUES
('1', NULL, '1', '这是一条一级评论', '2024-05-21 10:00:00', NULL, NULL),
('2', NULL, '2', '这是一条一级评论，也是回复user1的评论', '2024-05-21 10:30:00', NULL, NULL),
('3', '1', '3', '这是一条回复user1的二级评论', '2024-05-21 11:00:00', '1', '1'),
('4', '2', '4', '这是一条回复user2的二级评论', '2024-05-21 11:30:00', '2', '2');


-- 建运动场信息
CREATE TABLE `court` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '场地的唯一标识符，采用自增长的方式生成',
  `sport` ENUM('羽毛球', '乒乓球', '网球', '台球') NOT NULL COMMENT '场地支持的运动类型，使用 ENUM 类型来限制为羽毛球、乒乓球、网球或台球',
  `court_number` INT UNSIGNED NOT NULL COMMENT '场地编号，用于标识同一运动的不同的场地',
  `location` VARCHAR(100) NOT NULL COMMENT '场地的位置信息，描述场地所在的地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- 建运动场预约
CREATE TABLE `reservation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT ,
  `sport` ENUM('羽毛球', '乒乓球', '网球', '台球') NOT NULL,
  `court_id` INT UNSIGNED NOT NULL,
  `reservation_date` DATE NOT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `User` (`UserId`),
  FOREIGN KEY (`court_id`) REFERENCES `court` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 示例信息


-- 插入运动场信息
INSERT INTO `court` (`sport`, `court_number`, `location`) VALUES
('羽毛球', 1, 'A场地'),
('羽毛球', 2, 'B场地'),
('乒乓球', 1, 'C场地'),
('网球', 1, 'D场地'),
('台球', 1, 'E场地');

-- 插入运动场预约信息
INSERT INTO `reservation` (`user_id`, `sport`, `court_id`, `reservation_date`, `start_time`, `end_time`) VALUES
(1, '羽毛球', 1, '2024-05-25', '10:00:00', '12:00:00'),
(2, '乒乓球', 3, '2024-05-26', '14:00:00', '16:00:00'),
(3, '网球', 4, '2024-05-27', '09:00:00', '11:00:00');


-- 公告
CREATE TABLE `announcement` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告的唯一标识符，自增长',
  `title` VARCHAR(255) NOT NULL COMMENT '公告标题',
  `category` VARCHAR(100) NOT NULL COMMENT '公告分类',
  `sort_order` INT NOT NULL COMMENT '排序号，小的先显示',
  `summary` TEXT NOT NULL COMMENT '公告简介',
  `content` TEXT NOT NULL COMMENT '公告内容',
  `cover_image` VARCHAR(255) COMMENT '封面图',
  `publish_date` DATETIME NOT NULL COMMENT '发布日期和时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- 示例数据
INSERT INTO `announcement` (`title`, `category`, `sort_order`, `summary`, `content`, `cover_image`, `publish_date`) VALUES
('自习室预约规则', '预约规则', 1, '自习室预约规则说明', '尊敬的用户，为了更好地管理自习室资源，提高自习室使用效率，现制定以下预约规则：
1. 预约时间：自习室可以提前一周进行预约，每次预约时间段为2小时。
2. 预约限制：每个用户每天最多只能预约一个时间段。
3. 使用须知：预约成功后，请提前15分钟到达自习室并准备好有效证件进行签到。
4. 取消预约：如需取消预约，请提前一小时取消，否则将扣除信用分。
请遵守预约规则，共同维护好自习室的秩序和环境。', 'cover_image_url.jpg', NOW());

