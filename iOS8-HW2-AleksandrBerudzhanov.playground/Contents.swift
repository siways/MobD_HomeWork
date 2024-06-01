import Foundation
import PlaygroundSupport

// Домашнее задание №2

/*
 1. Умножьте средний расход топлива на количество километров пути и разделите на 100.
    Так вы получите нужное количество литров бензина. Если эту цифру умножить на стоимость литра,
    то узнаете, сколько денег уйдет на топливо в поездке.
 2. Чтобы найти время, нужно расстояние разделить на скорость.
*/

// Блок 0. Псевдонимы типов.
// 0.1 Псевдонимы типов
typealias Rub = Float // Псевдониим типа обазначающий валюту рубль
typealias InfoAboutCitiec = (cityName: String, population: Int, distanceNextCity: Float) // Информации о городе

// 0.2 Псевдонимы типов для ТС
// Личный автомобиль
typealias Car = (carName: String, carColor: String, fuelConsumption: Float, yearIssue: Int)?

// Арендованый автомобиль
typealias RentCar = (carName: String, carColor: String, fuelConsumption: Float, yearIssue: Int, costDay: Rub)?

// автобус
typealias Bus = (busName: String, colorBus: String, yearIssue: Int)?

// Поезд
typealias Train = (trainName: String, trainColor: String, yearIssue: Int)?

// Позде (с опциональными эелементами
typealias TrainOptional = (trainName: String?, trainColor: String?, yearIssue: Int?)?
// -----------------------------------------------------

// Блок 1. Параметры городов.
// 1.1 Кортеж города, население городов и расстояние между городами (в киллометрах)
let aboutMoscow: InfoAboutCitiec = ("Москва", 13500000, 193)
let aboutKaluga: InfoAboutCitiec = ("Калуга", 333954, 228)
let aboutBryansk: InfoAboutCitiec = ("Брянск", 375669, 269)
let aboutGomel: InfoAboutCitiec = ("Гомель", 501802, 175)
let aboutMogilev: InfoAboutCitiec = ("Могилев", 353338, 200)
let aboutMinsk: InfoAboutCitiec = ("Минск", 1995371, 291)
let aboutVitebsk: InfoAboutCitiec = ("Витебск", 359148, 520)
// -----------------------------------------------------

// Блок 2. Доступный транспорт и его параметры.
// - 2.1.1 Личная транспорт
let carKiaSpectra: Car = ("Kia Spectra", "серебристый", 9.1, 2008)
let carHyundaiSolaris: Car = ("Hyundai Solaris", "синий", 6.6, 2017)

// - 2.1.2 Арендованый транспорт
let rentCarKiaRio: RentCar = ("Kia Rio", "желтый", 6.1, 2019, 2945) // Kia Rio
let rentCarVolkswagenPolo: RentCar = ("Volkswagen Polo", "серый", 4.7, 2020, 3325) // Volkswagen Polo

// - 2.1.3 Автобусы
let busScaniaIrizar: Bus = ("Scania Irizar i6", "белый", 2021) // Scania Irizar i6
let busHiger: Bus = ("Higer 6189", "синий", 2019) // Higer 6189 (865)
let busManLionsCoach: Bus = ("MAN Lion's Coach", "красный", 1984) // MAN Lion's Coach

// - 2.1.4 Поезд
let trainTem: Train = ("тепловоз ТЭМ23", "красный", 2023) // ТЭМ23
let trainTgmFour: TrainOptional = ("тепловоз ТГМ4", "синий", 1981) // ТГМ4
// -----------------------------------------------------

// Блок 3. Параметры расходов, цен и разных величин
// 3.1 Разные велечины и расходы
var timeTrip: Float = 0 // Время в поездке между городами
var gasolineConsumption: Float = 0 // Расход бензина между городами в литрах
var costsRentalCar: Rub = 0 // Расходы на аренду автомобиля
var costsGasoline: Rub = 0 // Расходы на бензин
var costsHotel: Rub = 0 // Расходы на гостиницу
var costsFood: Rub = 0 // Расходы на еду
var costsEvents: Rub = 0 // Расходы на развлекательные мероприятия
var costsTaxi: Rub = 0 // Расходы на такси в городе
var costsTicketTransport: Rub = 0 // Расходы на билеты для общественного транспорта
var amountDays = 0 // Дни проведенные в одном городе

// 3.2 Общие (все) расходы во время путешевствия
var allCostsRentalCar: Rub = 0 // Общие расходы на аренду автомобиля
var allCostsGasoline: Rub = 0 // Все расходы на бензин
var allCostsHotel: Rub = 0 // Все расходы на гостинецу
var allCostsFood: Rub = 0 // Все расходы на еду
var allCostsEvents: Rub = 0 // Все расходы на развекательные мероприятия
var allCostsTaxi: Rub = 0 // Все расходы на такси
var allCostsTicketTransport: Rub = 0 // Все расходы на билеты для общественного транспорта
var allAmountDays = 0 // Общее кол-во дней в путешевствии

// 3.3 Цены на товары и услуги
let priceLiterGasolineRussia: Rub = 52.88 // Стоймость бензина за литр в российских рублях в России
let priceLiterGasolineBelarus: Rub = 66.08 // Стоймость бензина за литр в российских рублях в Беларуси
// -----------------------------------------------------

// Блок 4. Путещевствие
// 4.0 Логический выбор транспортного средства
var currentCar: Car = nil
var currentRentCar: RentCar = nil
var currentBus: Bus = nil
var currentTrain: Train = nil
var currentTrainOptional: TrainOptional = nil

// 4.1 Москва
// 4.1.1 Выбор транспорта
currentCar = carHyundaiSolaris


// 4.1.2 Рассказ
print("Начало пути!")
print("""
Мы с женой решили поехать в отпуск и посетить 7 городов.
Начнется он с города \(aboutMoscow.cityName)! С собой мы взляи немного
воды и еды ведь смысла закупать более нет, так как ехать
в первый по маршруту город нам не далеко.\n
""")

if let currentCar = currentCar {
    timeTrip = aboutMoscow.distanceNextCity / 110
    gasolineConsumption = currentCar.fuelConsumption * aboutMoscow.distanceNextCity / 100
    costsGasoline = priceLiterGasolineRussia * gasolineConsumption
    allCostsGasoline += costsGasoline

    print("""
    - Сегодня мы поеедем на своем автомобиле \(currentCar.carName).
    Дорога не будет длинной, так как на трассе сегодня мало
    людей. В дороге мы будем \(timeTrip) часа(ов)/минут(ы).
    Цвет нашей машины \(currentCar.carColor), \(currentCar.yearIssue) года. Так как с собой
    мы взяли мало припасов, то возможно мы остановимся на
    какой нибудь заправке. Возможно что далее мы отправимся
    другим транспортом. В поездке мы потратим примерно \(Int(gasolineConsumption))
    литров бензина, что обойдется нам в \(Int(costsGasoline)) рублей.\n
    """)
}

if let currentBus = currentBus {
    timeTrip = aboutMoscow.distanceNextCity / 90
    costsTicketTransport = 898.43 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - В этот раз выбрали автобус и уже стоим в очереди за
    покупкой билетов. В пути мы будем ориентировачно
    \(timeTrip) часа(ов)/минут(ы). К нам подошел человек с
    просьбой уточнить время, оказалось что это водитель
    автобуса на котором мы поедем. Я уточнил у воителя какой
    будет транспорт. Он сказал что что марка автобуса
    \(currentBus.busName) \(currentBus.yearIssue) года сборки. У него \(currentBus.colorBus) цвет.
    За билеты мы заплатили \(Int(costsTicketTransport)) рублей. Автобус трогается
    через 10 минут и мы заняли купленые места!\n
    """)
}

if let currentRentCar = currentRentCar {
    timeTrip = aboutMoscow.distanceNextCity / 110
    gasolineConsumption = currentRentCar.fuelConsumption * aboutMoscow.distanceNextCity / 100
    costsGasoline = priceLiterGasolineRussia * gasolineConsumption
    costsRentalCar = currentRentCar.costDay
    allCostsGasoline = costsGasoline
    allCostsRentalCar = costsRentalCar

    print("""
    - Мы отправляемся в путь на арендованой машине \(currentRentCar.carName)!
    Нам предстоит проехать \(Int(aboutMoscow.distanceNextCity)) киллометра(ов) за \(timeTrip)
    часа(ов)/минут(ы). У нашей машины \(currentRentCar.carColor) цвет, она \(currentRentCar.yearIssue)
    года. Только что мы заплатили за аренду машины и готовы
    выезжать, посмотрим как будем двигаться далее, ведь
    в городе \(aboutKaluga.cityName) мы сможем сдать машину, пока не известно
    есть ли сервисы в других городах по маршруту. Стоймость
    аренды машины составила \(Int(costsRentalCar))  рублей, так же помимо
    аренды стоймость бензина выйдет примерно \(Int(costsGasoline)) рублей.\n
    """)
}

// 4.1.3 Сброс транспорта
currentCar = nil
// -----------------------------------------------------

// 4.2 Калуга
// 4.2.1 Выбор транспорта
currentCar = carHyundaiSolaris

// 4.2.2 Подсчет расходов и других параметров в городе
costsHotel = 3800.00
costsEvents = 1400.00 * 2
costsFood = 2030.45
amountDays = 1 // Количество дней прибытия в городе (изменить если более 1 дня)

// 4.2.3 Подсчет общих расходов и других параметров.
allCostsHotel = costsHotel
allCostsEvents = costsEvents
allCostsFood = costsFood
allAmountDays = amountDays

// 4.2.4 Рассказ
print("Первый город!")
print("Мы приехали в " + aboutKaluga.cityName + "!" )
print("""
В этом городе проживают \(aboutKaluga.population) тысяч человек. До того
как выехать из начальной точки в сервисе бронирования
отелей мы арендовали двухместный номер в "Интермашотель"
за \(Int(costsHotel)) рублей. После поездки нужно было отдохнуть, но
уже вскоре мы загуглили куда можно сходить, а через 10
минут и помчались в "Калужский областной драматический
театр", билеты на спектакль стоили \(Int(costsEvents)) рублей за двоих.
Спектакль былочень хорошим за свои деньги. Тем не менее
возвращатся в отель мы не торопились. Наши желудки
урчали, а значит нужно было найти место где можно было
поесть. К счастью для нас мы проходили кафе "Solyanka",
увидев его мы не раздумывая направились туда. Кафе
оказалось не очень хорошим по нашему мнению, по крайней
мере можно было цены сделать дешевле, а потратили мы там
\(Int(costsFood)) рублей. После вернушись в отель решили отдохнуть,
ведь на завтра нужно собраться силами для новой поездки.\n
""")

switch currentCar?.carName {
case "Kia Spectra", "Hyundai Solaris":
    timeTrip = aboutKaluga.distanceNextCity / 110
    gasolineConsumption = (currentCar != nil ? currentCar!.fuelConsumption : 0) * aboutKaluga.distanceNextCity / 100
    costsGasoline = priceLiterGasolineRussia * gasolineConsumption
    allCostsGasoline += costsGasoline

    print("""
    - Снова выезжаем на личном авто! Мы решили не оставлять
    \(currentCar?.carName ?? "автомобиль") здесь и отправится на нем далее.
    Расстояние которое нам предстоит преодолеть состовляет
    \(Int(aboutKaluga.distanceNextCity)) км. Приедем на место примерно через \(timeTrip)
    часа(ов)/минут(ы). По расчетам топлива мы потратим \(Int(gasolineConsumption))
    литров за \(Int(costsGasoline)) рублей. В городе \(aboutBryansk.cityName) я передам машину
    своему другу который как раз направляется в город \(aboutMoscow.cityName).
    Он оставит машину на возле нашего дома, а мы же поедем
    дальше другим тарнпортом.\n
    """)
default:
   break
}

switch currentRentCar?.carName {
case "Kia Rio", "Volkswagen Polo":
    timeTrip = aboutKaluga.distanceNextCity / 90
    gasolineConsumption = (currentRentCar != nil ? currentRentCar!.fuelConsumption : 0) * aboutKaluga.distanceNextCity / 100
    costsGasoline = priceLiterGasolineRussia * gasolineConsumption
    costsRentalCar = currentRentCar != nil ? currentRentCar!.costDay : 0.0
    allCostsGasoline += costsGasoline
    allCostsRentalCar += costsRentalCar

    print("""
    - Выезжаем в следующий город на арендованой машине
    \(currentRentCar?.carName ?? "без названия") \(currentRentCar?.yearIssue ?? 0) года выпуска, цвет машины
    \(currentRentCar?.carColor ?? "не определен"). За аренду машины на сутки мы отдали \(Int(costsRentalCar)) рублей,
    за бензин \(Int(costsGasoline)) рублей. В поездке мы будем \(timeTrip)
    часа(ов)/минут(ы), так как поедем со скоростью 90
    киллометров в час.\n
    """)
default:
    break
}

switch currentTrain?.trainName {
case "тепловоз ТЭМ23":
    timeTrip = aboutKaluga.distanceNextCity / 60
    costsTicketTransport = 1890.34 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Из города \(aboutKaluga.cityName) мы отправляемся на поезде
    \(currentTrain?.trainName ?? "новом"), у него \(currentTrain?.trainColor ?? "яркий") цвет. В пути мы будем \(timeTrip)
    часа(ов)/минут(ы). Билеты стоили \(Int(costsTicketTransport)) рублей.\n
    """)
default:
    break
}

// 4.2.5 Сброс транспорта
currentCar = nil
// -----------------------------------------------------

// 4.3 Брянск
//4.3.1 Выбор транспора
currentTrainOptional = trainTgmFour


// 4.3.2 Подсчет расходов и других параметров в городе
costsHotel = 4784.00
costsEvents = 1321.29 * 2
costsFood = 832.48 * 2

// 4.3.3 Подсчет общих расходов и других параметров.
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allAmountDays += amountDays


// 4.3.4 Рассказ
print("Второй город!")
print("Мы приехали в " + aboutBryansk.cityName + "!")
print("""
Путешевствие продолжается, предвкушение от поездки не
оставляет в покое. Мы приехали в город с населением
\(aboutBryansk.population) тысяч человек! Далее мы пешком
отправились в отель попутно гуляя и изучая город.
Присмотрев некоторые места мы уже определились куда мы
пойдем. Кстати об отеле. Мы нашли классный отель с
названием "Мегаполис", а за сутки заплатили \(Int(costsHotel))
рублей. После заселения мы пошли гулять по центру города,
после же отправились в картинг клуб "Форсаж-32" где
заплатили \(Int(costsEvents)) рублей. Ощущения невероятные! По пути в
отель мы зашли поужинать в небольшое кафе европейской
кухни "ЧИН.ЧИН". Было очень вкусно! Там с нас взяли \(Int(costsFood))
рублей. После же мы отправились в отель, ведь утром нас
ждала новая поездка.\n
""")

if currentTrainOptional != nil {
    timeTrip = aboutBryansk.distanceNextCity / 60
    costsTicketTransport = 2010.34 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Купив билет на поезд, мы выезжаем в следующий город.
    По фотографии и гугл я узнал что мы поедем на транспорте
    \(currentTrainOptional!.trainName ?? "тепловоз"). В дороге мы будем примерно \(timeTrip)
    часа(ов)/минут(ы). Цвет нашего тепловоза \(currentTrainOptional!.trainColor ?? "красный"), а год
    его постройки \(currentTrainOptional?.yearIssue ?? 1986). Билеты мы купили за \(Int(costsTicketTransport)) рублей.\n
    """)
}

if currentBus != nil {
    timeTrip = aboutBryansk.distanceNextCity / 90
    costsTicketTransport = 918.48 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Сегодня мы поедем на автобусе! Время в дороге составит
    \(timeTrip) часа(ов)/минут(ы). Мы поедем на необычном
    автобусе марки \(currentBus?.busName ?? ""), его цвет \(currentBus?.colorBus ?? ""), а год
    постройки \(currentBus?.yearIssue ?? 0). Билеты вышли нам очень дешево, \(Int(costsTicketTransport))
    рублей за двоих.\n
    """)
}

// 4.3.5 Сброс транспорта
currentTrainOptional = nil
// -----------------------------------------------------

// 4.4 Гомель
// 4.4.1 Выбор транспорта
currentRentCar = rentCarVolkswagenPolo


// 4.4.2 Подсчет расходов и других параметров в городе
costsHotel = 3490.00
costsEvents = 831.42 * 2
costsFood = 590.00 * 2
costsTaxi = 410.00

// 4.4.3 Подсчет общих расходов и других параметров.
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allCostsTaxi = costsTaxi
allAmountDays += amountDays

// 4.4.4 Рассказ
print("Третий город!")
print("Мы приехали в " + aboutGomel.cityName + "!")
print("""
Пересекли границу Беларуси! Во всех городах куда мы
приезжаем гуглим сколько жителей живет в этом городе, к
примеру в городе \(aboutGomel.cityName) живет \(aboutGomel.population) тысяч человек. Далее
мы вызвали такси за \(Int(costsTaxi)) рублей от воклаза до гостиницы
"Замковой", в которой сняли номер за \(Int(costsHotel)) рублей. Далее
мы посетили "Гомельский областной музей военной славы"
что стоило нам \(Int(costsEvents)) рублей. В этот раз мы решили
разнообразить нашу кухню и купили шаурму в
"Сити Шаурма Кинг" за \(Int(costsFood)) рублей. Безумно вкусная штука!
Мы все так же пошли в гостиницу так как утром едем дальше
по маршруту!\n
""")

switch currentRentCar?.carName {
case "Kia Rio", "Volkswagen Polo":
    timeTrip = aboutGomel.distanceNextCity / 90
    costsRentalCar = (currentRentCar != nil ? currentRentCar!.costDay : 0)
    gasolineConsumption = currentRentCar!.fuelConsumption * aboutMogilev.distanceNextCity / 100
    costsGasoline = priceLiterGasolineBelarus * gasolineConsumption
    allCostsRentalCar += costsRentalCar
    allCostsGasoline += costsGasoline

    print("""
    - Мы арендавали машину \(currentRentCar?.carName ?? ""), ее цвет \(currentRentCar?.carColor ?? ""),
    ее собрали в \(currentRentCar?.yearIssue ?? 0) году. Аренда машины вышла нам
    \(Int(currentRentCar?.costDay ?? 0)) рублей. Стоймость бензина составила \(Int(costsGasoline)) рубль.\n
    """)
default:
    break
}

switch currentBus?.busName {
case "Scania Irizar i6", "Higer 6189", "MAN Lion's Coach":
    timeTrip = aboutGomel.distanceNextCity / 90
    costsTicketTransport = 1002.34 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Мы выезжаем на втобусе в город \(aboutMogilev.cityName)! Наш автобус
    \(currentBus?.busName ?? ""), его год постройки \(currentBus?.yearIssue ?? 0), а его цвет \(currentBus?.colorBus ?? "").
    Ехать нем приблизительно \(timeTrip) часа(ов)/минут(ы).
    Стоймость блетов составила \(Int(costsTicketTransport)) рублей.\n
    """)
default:
    break
}

// 4.4.5 Сброс транспорта
currentRentCar = nil
// -----------------------------------------------------

// 4.5 Могилев
// 4.5.1 Выбор транспорта
currentBus = busScaniaIrizar


// 4.5.2 Подсчет расходов и других параметров в городе
costsHotel = 2530.00
costsEvents = 500.81 * 2
costsFood = 2161.32

// 4.5.3 Подсчет общих расходов и других параметров.
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allAmountDays += amountDays

// 4.5.4 Рассказ
print("Четвертый город!")
print("Мы приехали в город " + aboutMogilev.cityName + "!")
print("""
Если честно мы с женой уже немного устали от поездок, от
перемещения по такому количеству городов в короткий срок.
Здесь проживает \(aboutMogilev.population) тысяч человек. Мы решили немного
ускорить поездку и сразу же заехали в гостиницу "Могилев"
за \(Int(costsHotel)) рублей. Перекусив там, мы отправились в
Могилевскую ратушу, где смогли выйти на наблюдательную
площадку и даже подняться к часам. Цена была неприлично
дешевой, примерно \(Int(costsEvents)) рубль за двоих. Далее мы
отправились гулять по бесплатным местам города к примеру
были около скульптуры "Станционный смотритель". После мы
прогролодались и решили зайти в ресторан, это был
"ПАРМЕЗАН Пиццерия", это стоило нам \(Int(costsFood)) рублей.
Все города которые мы посетили безумно классные, но пора
ехать дальше!\n
""")

if let currentBus = currentBus {
    timeTrip = aboutMogilev.distanceNextCity / 90
    costsTicketTransport = 790.0 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Из города \(aboutMogilev.cityName) в город \(aboutMinsk.cityName) мы решили поехать на
    автобусе. Марка и модель автобуса \(currentBus.busName), его
    цвет \(currentBus.colorBus), а собрали его в \(currentBus.yearIssue) году. Стоймость поездки
    вышла \(Int(costsTicketTransport)) рублей. В поездке мы будем \(timeTrip)
    часа(ов)/минут(ы).\n
    """)
}

if let currentTrain = currentTrain {
    timeTrip = aboutMogilev.distanceNextCity / 60
    costsTicketTransport = 1100.19 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Сегодня отправимся в путь на поезде \(currentTrain.trainName), год
    постройки \(currentTrain.yearIssue). Его цвет \(currentTrain.trainColor). В пути мы будем
    \(timeTrip) часа(ов)/минут(ы). Стоймость билетов составила
    \(Int(costsTicketTransport)) рублей.\n
    """)
}

// 4.5.5 Сброс транспорта.
currentBus = nil
// -----------------------------------------------------

// 4.6 Минск
// 4.6.1 Выбор транспорта
currentRentCar = rentCarKiaRio

// 4.6.2 Подсчет расходов и других параметров в городе
costsHotel = 6924.00
costsEvents = 814.85 + 3198.00 + 2750.00 + 350.00 * 2
costsFood = 5832.96
amountDays = 2

// 4.6.3 Подсчет общих расходов и других параметров.
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allAmountDays += amountDays

// 4.6.4 Рассказ
print("Пятый город!")
print("Мы приехали в город " + aboutMinsk.cityName + "!")
print("""
Столица республики Беларусь! Как долго мы хотели сюда
добраться! В городе проживает \(aboutMinsk.population) тысяч человек.
Город очень большой. В первый день с самого начала мы
пошли в "Национальный исторический музей Республики
Беларусь", а после, нам нужно было заселится куда нибудь
и по дороге мы нашли отличный отель под названием
"Минск". Cтоймость за сутки составляла \(Int(costsHotel)) рубля. В
течение \(amountDays) дней мы гуляли в центр города, ходили в
аквапарк "Лебяжий", в "ДиноПарк" и на колесо обозрения.
За все развлечения мы заплаитили \(Int(costsEvents)) рублей. Улицы в
городе были очень чистыми и опрятными! При отеле был
ресторан в которым нас вкусно кормили в течение
нескольких дней. Завтракали, обедали и ужинали там. За
все дни питаясь в отеле мы потратили \(Int(costsFood))
рублей. Мы столько потратили, что в основном гуляли по
городу, так как денег оставалось немного. В основном это
были прогулки по городу.\n
""")

if currentRentCar != nil {
    timeTrip = aboutMinsk.distanceNextCity / 90
    gasolineConsumption = currentRentCar!.fuelConsumption * aboutMinsk.distanceNextCity / 100
    costsRentalCar = currentRentCar!.costDay
    costsGasoline = priceLiterGasolineBelarus * gasolineConsumption
    allCostsRentalCar += costsRentalCar
    allCostsGasoline += costsGasoline

    print("""
    - Сегодня мы выезжаем на арендованой машине из города
    \(aboutMinsk.cityName) в город \(aboutVitebsk.cityName). Наш автомобиль сегодня \(currentRentCar!.carName),
    его цвет \(currentRentCar!.carColor), он \(currentRentCar!.yearIssue) года сборки. Аренда в сутки
    стоила нам \(Int(costsRentalCar)) рублей. За бензин мы заплатили \(Int(costsGasoline))
    рублей. Время в поездке составило \(timeTrip)
    часа(ов)/минут(ы).\n
    """)
}

if currentTrain != nil {
    timeTrip = aboutMinsk.distanceNextCity / 60
    costsTicketTransport = 1800.56 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Из прекрасного города \(aboutMinsk.cityName) мы выезжаем на позеде
    модели \(currentTrain!.trainName) \(currentTrain!.yearIssue) года. Цвет \(currentTrain!.trainColor). Наша
    поездка составит \(timeTrip) часа(ов)/минут(ы). Ведь мы проедем
    \(Int(aboutMinsk.distanceNextCity)) киллометр. Стоймость билетов составила \(Int(costsTicketTransport)) рублей.\n
    """)
}

if currentBus != nil {
    timeTrip = aboutMinsk.distanceNextCity / 80
    costsTicketTransport = 2100.35 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Мы стоим на вокзале и ждем наш автобус, сегодня мы
    поедем на нем. Стоймость билетов обошлась нам в \(Int(costsTicketTransport))
    рублей. Мы поедем на автобусе \(currentBus!.yearIssue) года сборки,
    \(currentBus!.busName), цвет которого \(currentBus!.colorBus). Наше время в пути
    составляет примерно \(timeTrip) часа(ов)/минут(ы).\n
    """)
}

// 4.6.5 Сброс транспорта
currentRentCar = nil
// -----------------------------------------------------

// 4.7 Витебск
// 4.7.1  Выбор транспорта
currentTrainOptional = trainTgmFour

// 4.7.2 Подсчет расходов и других параметров в городе
costsHotel = 4280.00
costsEvents = 5823.00
costsFood = 3189.00
amountDays = 1

// 4.7.3 Подсчет общих расходов и других параметров.
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allAmountDays += amountDays

// 4.7.4 Рассказ
print("Шестой город!")
print("Мы приехали в город " + aboutVitebsk.cityName + "!")
print("""
Я давно хотел посетить этот город. Даже не знаю чем он
меня приманил, толи названием, толи своей простотой.
Стоит отметить что в городе живет \(aboutVitebsk.population) тысяч человек.
Расстояние которое мы проехали состояло \(Int(aboutMinsk.distanceNextCity))
киллометр(ов). Сняли номер в отеле "Apartament in Vitebsk
Tower" за \(Int(costsHotel)) рублей. Далее пошли иследовать город,
осматривать спокойные и тихие улицы. Мы зашли поиграть в
бильярд в развлекательный центр "Город", сходили в
"Витебский областной краеведческий музей" и в бассейн
"Витебскэнерго". Все мероприятия обошлись нам в
\(Int(costsEvents)) рублей. После же мы решили пойти в ресторан, так
скажем вкусно завершить нашу большую поездку по городам!
Мы зашли в небольшое но довольно уютное заведение под
названием "ZDOBA". Интересное название, со Словенского
оно переводится как красота. Мы посидели там с женой на
\(Int(costsFood)) рублей. Вот и подошла наша поездка к концу. Было
очень классно, даже не передать словами и видео
впечатлениях от этой поездки! Ниже будет сделан подсчет
общей суммы которой мы потратили за месяц, будем надеяться
что она более или менее адекватна.\n
""")

switch currentTrainOptional?.trainName {
case "тепловоз ТГМ4":
    timeTrip = aboutVitebsk.distanceNextCity / 60 // Возвращаемся на поезде в Москву
    costsTicketTransport = 3387 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Мы покидаем этот прекрасный город и на этом наше
    путешевствие заканчивается. Мы возвращаемся в город
    \(aboutMoscow.cityName). Поедем мы на поезде \(currentTrainOptional?.trainName ?? "") год
    постройки которого \(currentTrainOptional?.yearIssue ?? 0), а его цвет \(currentTrainOptional?.trainColor ?? ""). Стоят
    билеты \(Int(costsTicketTransport)) рублей. В пути мы будем примерно \(timeTrip)
    часа(ов)/минут(ы).\n
    """)
default:
    break
}

switch currentBus?.busName {
case "Scania Irizar i6", "Higer 6189", "MAN Lion's Coach":
    timeTrip = aboutVitebsk.distanceNextCity / 80
    costsTicketTransport = 2400 * 2
    allCostsTicketTransport += costsTicketTransport

    print("""
    - Мы покидаем этот прекрасный город и на этом наше
    путешевствие заканчивается. Мы возвращаемся в город
    \(aboutMoscow.cityName). Поедем мы на автобусе \(currentBus?.busName ?? "") год
    постройки которого \(currentBus?.yearIssue ?? 0), а его цвет \(currentBus?.colorBus ?? ""). Стоят
    билеты \(Int(costsTicketTransport)) рублей. В пути мы будем примерно \(timeTrip)
    часа(ов)/минут(ы).\n
    """)
default:
    break
}

// Сброс транспорта
currentTrainOptional = nil
// -----------------------------------------------------

// Блок 5. Подсчет и вывод в консоль расходов за поездку.
print("""
Мы приехали с женой домой и решили подсчитать наши расходы за \(allAmountDays) дней
в поездке. Мы потратили довольно большую сумму, но сейчас все
разберем по деталям и посчитаем.

Расходы -
Расходы на отель: \(Int(allCostsHotel)) рублей.
Расходы на мероприятия: \(Int(allCostsEvents)) рублей.
Расходы на еду: \(Int(allCostsFood)) рублей.
Расходы на билеты общественного транспорта: \(Int(allCostsTicketTransport)) рублей.
Расходы на аренду машины: \(Int(allCostsRentalCar)) рублей.
Расходы на бензин: \(Int(allCostsGasoline)) рублей.
Расходы на такси: \(Int(allCostsTaxi)) рублей.
""")

PlaygroundPage.current.finishExecution()



