#include <iostream>
using namespace std;

template <typename T>
class Competitor 
{
    T id;
    string Surname;
    string Name;
    string Competition;
    int Year;
    int Time_1;
    int Time_2;
    int Time_3;
public:
    // - - - - - - - - - - - - - - - - - - - - - - - -
    // 1. Учимся строить конструкторы
    Competitor() 
    {
        cout << "Constructor default" << endl;
        Surname = "Королев";
        Name = "Лекесей";
        Competition = "3 на 3";
        Year = 1999;
        Time_1 = 21;
        Time_2 = 33;
        Time_3 = 25;
    };
    Competitor(T Id, string Sur, string Nm, string Competit, int Yr, int T_1, int T_2, int T_3) 
    {
        id = Id;
        Surname = Sur;
        Name = Nm;
        Competition = Competit;
        Year = Yr;
        Time_1 = T_1;
        Time_2 = T_2;
        Time_3 = T_3;
        cout << "Constructor with parameter" << endl;
    };
    Competitor(const Competitor& D) 
    {
        Surname = D.Surname;
        Name = D.Name;
        Competition = D.Competition;
        Year = D.Year;
        Time_1 = D.Time_1;
        Time_2 = D.Time_2;
        Time_3 = D.Time_3;
        cout << "Constructor copy" << endl;
    };

    void show_Competitor()
    {
        cout << "\n" << id << ", " << Surname << ", " << Name << ", " << Competition << ", "
            << Year << ", " << Time_1 << ", " << Time_2 << ", " << Time_3 << endl;
    };

    ~Competitor() {
        cout << "Constructor destructor" << endl;
    };

    // - - - - - - - - - - - - - - - - - - - - - - - -
    // 2. Перегрузка
    
    int get_Year() { return Year; }
    int get_Time_1() { return Time_1; }

    Competitor& operator ++() {
        ++Year;
        return *this;
        cout << "Operator ++" << endl;
    }; 

    const Competitor& operator = (const Competitor& C) 
    {
        if (&C == this) return *this;
        Surname = C.Surname;
        Name = C.Name;
        Competition = C.Competition;
        Year = C.Year;
        Time_1 = C.Time_1;
        Time_2 = C.Time_2;
        Time_3 = C.Time_3;
        cout << "Operator =" << endl;
        return *this;
    };

    Competitor& operator + (Competitor& C) 
    {
        Time_1 += C.Time_1;
        cout << "Operator +" << endl;
        return *this;
    };

    // - - - - - - - - - - - - - - - - - - - - - - - -

    friend ostream& operator << (ostream &os, const Competitor& C)
    {
        cout << "Operator <<\n" << endl;
        return os << "Фамилия: " << C.Surname << "  Соревнование: " << C.Competition << "  Среднее время сборки: " << (C.Time_1 + C.Time_2 + C.Time_3) / 3 << "\n";
    };
};

// - - - - - - - - - - - - - - - - - - - - - - - -
// 3. Наследование

//class Medals : public Competitor
//{
//    int Count_Win;
//public:
//    Medals()
//    {
//        Count_Win = 0;
//        cout << "Medals default" << endl;
//    };
//
//    Medals(int Wins) 
//    { 
//        Count_Win = Wins;
//        cout << "Medals parameters" << endl;
//    };
//
//    Medals& operator ++ (int)
//    {
//        Count_Win++;
//        cout << "Medals ++" << endl;
//        return *this;
//    };
//
//    void Show_Medals() { show_Competitor(); cout << "Кол-во побед: " << Count_Win << "\n\n"; };
//
//    ~Medals() { cout << "Destructor Medals" << endl; }
//};
//
//// - - - - - - - - - - - - - - - - - - - - - - - -
//// 4. Виртуальные методы и абстрактные классы
//
//class Competitor_res
//{
//protected:
//    int Result;
//public:
//    virtual int Competitor_Result() = 0;
//    void Set_Result(int res)
//    {
//        Result = res;
//    }
//};
//
//class Result_Competition : public Competitor_res
//{
//public:
//    int Competitor_Result()
//    {
//        cout << "Результат: ";
//        return Result;
//    }
//};
// - - - - - - - - - - - - - - - - - - - - - - - -


int main()
{
    setlocale(LC_ALL, "Rus");
    Competitor <double> gg(22, "Евклид", "Аминович", "3 на 3", 1123, 23, 21, 17);
    gg.show_Competitor();

    Competitor <string> ff("33", "Пифагор", "Еремович", "4 на 4", 3211, 32, 12, 71);
    ff.show_Competitor();

    //Competitor One;
    //One.show_Competitor();
    //cout << "\n";

    //Competitor Two;
    //Two = One; // переопред ======

    //Competitor Three;
    //Three = One + Two; // переопред ++++++

    //cout << "\nTime_1 One = " << One.get_Time_1() << "\n";
    //cout << "Time_1 Two = " << Two.get_Time_1() << "\n";
    //cout << "Time_1 Three = " << Three.get_Time_1() << "\n\n";

    //cout << One << "\n"; // переопред <<<<<<<

    //Medals Odin; // Наследуемый класс
    //Odin = 5;
    //Odin.Show_Medals();

    //Result_Competition res; // Абстрактный класс
    //res.Set_Result(3);
    //cout << res.Competitor_Result() << "\n\n";



    return 0;
} // <- здесь вызывается деструктор