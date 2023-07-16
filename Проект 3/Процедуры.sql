--Процедура, которая создает новую услугу с информацией о ней (сумма, гарантия)
USE Автосервис
GO
CREATE Procedure Скидка
AS
UPDATE Виды_работ 
SET Price = Price * 0.9
WHERE PRICE IS NOT NULL

--Проверка
exec Услуга 'Замена лобового стекла', 7000, 9


--Процедура, которая удалит чек с указанной услугой
USE Автосервис
GO
CREATE Procedure Заказы
@Work varchar(30)
AS
delete from Услуги_заказа
from Услуги_заказа
inner join Виды_работ
on Услуги_заказа.ID_Code_Works = Виды_работ.ID_Code_Works
where Name_work = @Work

--Проверка
exec Заказы 'Ремонт стеклоподъемников'


--Процедура для уменьшения стоимости всех услуг на 10 % 
USE Автосервис
GO
CREATE Procedure Услуга
@Name varchar(40), @Price int, @Garant int
AS
insert into Виды_работ
Values (@Name, @Price, @Garant)

--Проверка
EXECUTE Скидка;
