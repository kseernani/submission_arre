CREATE DATABASE Whatsapp_Schema;
SHOW DATABASES;
USE Whatsapp_Schema;\

/* contains list of all users (userId : primary key) */


/* contains list of all groups */
CREATE TABLE Groups (
    group_Id int not null auto_increment,
    group_pic varchar(512),
    group_name varchar(255),
    members_count int,
    created_at datetime,
    updated_at datetime,
    created_by varchar(255)
);

CREATE TABLE users (
    user_Id int not null auto_increment,
    phone_Number int not null,
    created_at datetime,
    user_name varchar(255),
    updated_at datetime,
    PRIMARY KEY (user_Id)
);

/* contains list all group members in all groups */
CREATE TABLE Group_Members (
    Id int not null auto_increment,
    group_Id int not null auto_increment,
    user_Id varchar(255),
    added_at datetime,
    removed_at datetime,
    PRIMARY KEY (Id),
    FOREIGN KEY (group_Id)
    REFERENCES grps(group_Id),
    FOREIGN KEY (user_Id)
    REFERENCES users(user_Id)
);


/* contains list of all messages connecting grp sent to and the user sent by*/
CREATE TABLE Messages (
    message_Id int not null auto_increment,
    group_Id int not null,
    mssg_text varchar(1000),
    media_Url varchar(512),
    created_at datetime,
    user_Id int not null,
    
    PRIMARY KEY (message_Id),
    FOREIGN KEY (group_Id)
    REFERENCES grps(group_Id),
    FOREIGN KEY (user_Id)
    REFERENCES users(user_Id)
);
