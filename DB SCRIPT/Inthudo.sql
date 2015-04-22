create table Nop_Service
(
	ServiceID int identity primary key not null,
	LanguageID int foreign key references dbo.Nop_Language(LanguageID) not null,
	Title nvarchar(1000) not null,
	Short nvarchar(4000) not null,
	[Full] nvarchar(max) not null,
	Published bit not null,
	AllowComments bit not null,
	CreateOn datetime not null
)

create table Nop_ServiceComment
(
	ServiceCommentID int identity primary key not null,
	ServiceID int foreign key references Nop_Service(ServiceID) not null,
	CustomerID int not null,
	IPAddress nvarchar(100) not null,
	Title nvarchar(1000) not null,
	Comment nvarchar(max) not null,
	CreateOn datetime not null
)

alter table Nop_Service
	add PictureId int foreign key references Nop_Picture(PictureId)

alter table Nop_News
	add PictureId int not null default 0

select * from Nop_News


select * from Nop_Picture
delete Nop_Picture where PictureID = 144
select * from Nop_News where PictureId=144
update Nop_News set PictureId = 144 where PictureId is  null

declare @newsId int
declare new_cur cursor for
select NewsId from Nop_News
open new_cur
FETCH NEXT FROM new_cur into @newsId
WHILE @@FETCH_STATUS = 0
BEGIN
	update Nop_News set PictureId = (select top 1 PictureId from Nop_Picture order by NEWID())
	where NewsID = @newsId
	FETCH NEXT FROM new_cur into @newsId
END
close new_cur
deallocate new_cur

update Nop_News set PictureId = null
--drop table Nop_ServiceComment
--drop table Nop_Service
select * from dbo.Nop_Picture

select * from dbo.Nop_Category