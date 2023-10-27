--1. Вывести регистрационные номера машин, год выпуска которых ранее 2007 года.
use Автосервис
select Reg_Num, Birthday
from Автомобили
where Birthday < 2007
 
--2. Определить дату начала самого старого заказа.
use Автосервис
select top 1 Data1
from Заказ
order by Data1 ASC
	 
--3. Определить стоимость самой дорогой услуги в автосервисе.
use Автосервис
select max(Price)[Стоимость]
from Виды_работ
 
--4. Вывести марки последней тройки авто, которые появлялись в автосервисе.
use Автосервис
select top 3 Name, ID_Code_Order, Data1
from Марки_автомобилей
inner join Автомобили
on Марки_автомобилей.ID_Brand = Автомобили.ID_Brand
inner join Заказ
on Заказ.ID_Code_Auto = Автомобили.ID_Code_Auto
order by Data1 DESC
	 
--5. По регистрационному номеру автомобиля определить телефон его владельца.
use Автосервис
select Reg_Num, Phone
from Владельцы
inner join Заказ
on Заказ.ID_Code_Owner = Владельцы.ID_Code_Owner
inner join Автомобили
on Автомобили.ID_Code_Auto = Заказ.ID_Code_Auto
where Reg_Num = 'В156АМ20'
	 
--6. Вывести марку автомобилей, которая чаще всего встречалась в автосервисе.
use Автосервис
select top 1 Name, count(ID_Code_Order)[Кол-во посещений]
from Марки_автомобилей
inner join Автомобили
on Марки_автомобилей.ID_Brand = Автомобили.ID_Brand
inner join Заказ
on Заказ.ID_Code_Auto = Автомобили.ID_Code_Auto
group by Name
order by count(ID_Code_Order) DESC
	 
--7. Определить фамилию владельца, который самый первый пришел в автосервис.
use Автосервис
select top 1 Surname, Data1
from Владельцы
inner join Заказ
on Заказ.ID_Code_Owner = Владельцы.ID_Code_Owner
order by Data1 ASC

--8. Найти номера заказов, стоимость работ которых составила более 2000.
use Автосервис
select ID_Code_Order, Price
from Услуги_заказа
inner join Виды_работ
on Услуги_заказа.ID_Code_Works = Виды_работ.ID_Code_Works
where Price > 2000
	 
--9. По номеру телефона владельца авто определить ФИО сотрудника, обслужившего его.
use Автосервис
select Сотрудники.Surname[Фамилия сотрудника], Сотрудники.First_Name[Имя сотрудника], Сотрудники.Last_Name[Отчество сотрудника], Владельцы.Phone[Номер владельца] 
from Сотрудники
inner join Заказ
on Заказ.ID_Code_Assistant = Сотрудники.ID_Code_Assistant
inner join Владельцы
on Владельцы.ID_Code_Owner = Заказ.ID_Code_Owner
where Владельцы.Phone = '79157778899'
	 
--10. Определить марку автомобиля по номеру телефона владельца.
use Автосервис
select Name, Владельцы.Phone
from Марки_автомобилей
inner join Автомобили
on Автомобили.ID_Brand = Марки_автомобилей.ID_Brand
inner join Заказ
on Заказ.ID_Code_Auto = Автомобили.ID_Code_Auto
inner join Владельцы
on Владельцы.ID_Code_Owner = Заказ.ID_Code_Owner
where Phone = '79157778899'
