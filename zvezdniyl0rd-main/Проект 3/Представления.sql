--Обновляемое представление
create view Автомобиль (Марка, Год_выпуска)
as select Name, Birthday
from Марки_автомобилей, Автомобили
where Марки_автомобилей.ID_Brand = Автомобили.ID_Brand

--Проверка
update Автомобиль
set Год_выпуска = '2003'
where Марка = 'Audi'

--Необновляемое представление
create view Количество (Количество_сотрудников)
as select count(*) from Сотрудники

--Проверка
update Количество
set Количество_сотрудников = 8
where Количество_сотрудников = 10


--Агрегирующее представление
create view ФИО_владельца (Фамилия_инициалы)
as select (Surname) + ' ' + LEFT (First_Name,1) + '.' + LEFT (Last_Name,1) + '.' AS ФИО
from Владельцы

--Представление на основе нескольких таблиц
create view Информация_о_заказах (Автомобиль, Дата_приезда, Работы) 
as select Марки_автомобилей.Name, Data1, Name_work from Марки_автомобилей, Автомобили, Заказ, Услуги_заказа, Виды_работ 
where Марки_автомобилей.ID_Brand = Автомобили.ID_Brand and Автомобили.ID_Code_Auto = Заказ.ID_Code_Auto and
Заказ.ID_Code_Order = Услуги_заказа.ID_Code_Order and Услуги_заказа.ID_Code_Works = Виды_работ.ID_Code_Works
