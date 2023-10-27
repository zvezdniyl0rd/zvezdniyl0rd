--1. Скалярная функция, выводящая количество выполненных заказов после даты, переданной в качестве параметра
create function getCountAfter(@Date datetime)
returns integer
begin
declare @Count integer
select @Count = count(ID_Code_Order) from Заказ
where Data2 > @Date
return @Count
end

--Выполнение скалярной функции
select dbo.getCountAfter('21.10.2021') as Количество_заказов


--2. Функция, возвращающая таблицу, которая посчитает общий доход от продаж до даты, переданной в качестве параметра
create function getSumOrder(@Date datetime)
returns table
as
return
(
select Заказ.ID_Code_Order as Номер_заказа, Price as Стоимость
from Заказ
inner join Услуги_заказа
on Услуги_заказа.ID_Code_Order = Заказ.ID_Code_Order
inner join Виды_работ
on Виды_работ.ID_Code_Works = Услуги_заказа.ID_Code_Works
where Data2 < @Date
)

--Выполнение функции, возвращающей таблицу:
select*from getSumOrder('21.01.2021')


--3. Многооператорная функция, возвращающая таблицу, которая выводит данные о сотрудниках (id, ФИО, номер телефона)
create function Sotrudniki()
returns @table table (id_Сотрудника int primary key, ФИО varchar(50), Номер_телефона varchar(11))
as begin insert @table
select ID_Code_Assistant, Surname + ' ' + First_Name + ' ' + Last_Name, Phone from Сотрудники;
return
end

--Выполнение
select*from Sotrudniki()
