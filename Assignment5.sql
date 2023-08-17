create database Assesment05Db
use Assesment05Db

create schema bank
create table bank.Customer
(
	CId int primary key identity(1000,1),
	CName nvarchar(50) not null,
	CEmail nvarchar(50) not null unique,
	Contact nvarchar(50) not null unique,
	CPwd as right(CName,2)+cast(CId as nvarchar(10))+left(Contact,2) persisted 
)
insert into bank.Customer(CName,CEmail,Contact) values ('Sam','sam48@gmail.com','9701784666')
insert into bank.Customer(CName,CEmail,Contact) values ('Suresh','suresh123@gmail.com','987655522')
insert into bank.Customer(CName,CEmail,Contact) values ('Rahul','rahul65@gmail.com','8794563218')
insert into bank.Customer(CName,CEmail,Contact) values ('Axar','axar11@gmail.com','8106541230')
insert into bank.Customer(CName,CEmail,Contact) values ('Rishab','rishab17@gmail.com','9876541230')

select * from bank.Customer
----------------------------------------------------------------------
create table bank.MailInfo
(	
	MailTo nvarchar(50),
	MailDate date,
	MailMessage nvarchar(50)
)
---------------------------------------------------------------------
create trigger InsertIntoCust
on bank.Customer
after insert
as
begin
declare @id int
declare @name nvarchar(50)
declare @mail nvarchar(50)
declare @contact nvarchar(50)
declare @pwd nvarchar(50)

declare @msg nvarchar(50)

select @id=Cid,@name=CName,@mail=CEmail,@contact=Contact,@pwd=(right(CName,2)+cast(CId as nvarchar(10))+left(Contact,2)) from inserted
select @msg='you NetBanking password is : '+@pwd+'it is valid up to 2 days only. Update it'

insert into MailInfo values (@mail,GETDATE(),@msg)

if(@@ROWCOUNT>=1)
begin
print 'After trigger value inserted'
end
end

insert into bank.Customer(CName,CEmail,Contact) values ('Kiran','kiran111@gmail.com','9849518760')
select * from bank.Customer
select * from bank.MailInfo