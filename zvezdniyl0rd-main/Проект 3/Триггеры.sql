--Триггер AFTER, срабатывающий при добавлении сотрудника в таблицу. Добавление происходит, если кол-во сотрудников меньше 15.
create trigger insert_Sotrud on Сотрудники after insert as 
declare @id integer if @@ROWCOUNT= 1
select @id = ID_Code_Assistant from inserted
begin
	if (select count(*) from Сотрудники) <= 15
	begin
		print 'Сотрудник добавлен'
	end
	else
	begin
		rollback transaction
		print 'Превышение количества возможных сотрудников'
	end
end

--Триггер AFTER, срабатывающий при удалении сотрудника и удаляющий сотрудников, возраст которых больше 50 лет
create trigger delete_Sotrud on Сотрудники after delete as
declare @Num_Phone varchar(11), @id int if @@ROWCOUNT= 1
select @Num_Phone = Phone, @id = ID_Code_Assistant from deleted
begin
	declare @Year datetime
	select @Year = (select Birthday from Сотрудники where ID_Code_Assistant = @id)
	if year(GETDATE()) - year(@Year) > 50
	begin  
		delete from Сотрудники where ID_Code_Assistant = @id
	end
	print 'Сотрудник удален'
end

  
--Триггер, срабатывающий при добавлении новой услуги в таблицу и использующий хранимую процедуру скидки в 15% к этой услуге, если ее стоимость от 3000
--Хранимая процедура:
create Procedure Скидка_для
@work varchar(30)
AS
UPDATE Виды_работ
SET Price = Price * 0.85
WHERE Name_work = @work
  
--Триггер:
create trigger new_Work on Виды_работ after insert as
declare @work varchar(30) 
if @@rowcount = 1
select @work = Name_work from inserted
begin
	declare @price int
	select @price = (select Price from Виды_работ where @work = Name_work)
	if @price >= 3000
	begin
		exec Скидка_для @work
	end
end

