import Foundation
import PlaygroundSupport

// Домашнее задание №1

/*
 1. Умножьте средний расход топлива на количество километров пути и разделите на 100.
    Так вы получите нужное количество литров бензина. Если эту цифру умножить на стоимость литра,
    то узнаете, сколько денег уйдет на топливо в поездке.
 2. Чтобы найти время, нужно расстояние разделить на скорость.
*/

// Блок 0. Псевдонимы типов.
// 0.1 Псевдонимы типов
typealias Killometrs = Float // Псвевдоним типа обозначающий киллометраж
typealias LitersGasoline = Float // Псевдоним типа обазначающий литры
typealias TravelDays = Int // Псевдоним типа обазначающий сколько прошло дней в путешевствии
typealias Rub = Float // Псевдониим типа обазначающий валюту рубль
// -----------------------------------------------------

// Блок 1. Параметры городов.
// 1.1 Города (маршрут)
let cityMoscow = "Москва"
let cityKaluga = "Калуга"
let cityBryansk = "Брянск"
let cityGomel = "Гомель"
let cityMogilev = "Могилев"
let cityMinsk = "Минск"
let cityVitebsk = "Витебск"

// 1.2 Расстояние между городами (в киллометрах)
let moscowToKaluga: Killometrs = 193
let kalugaToBryansk: Killometrs = 228
let bryanskToGomel: Killometrs = 269
let gomelToMogilev: Killometrs = 175
let mogilevToMinsk: Killometrs = 200
let minskToVitebsk: Killometrs = 291
let vitebskToSmolensk: Killometrs = 133

// 1.3 Население городов
let populationMoscow = 13500000
let populationKaluga = 333954
let populationBryansk = 375669
let populationGomel = 501802
let populationMogilev = 353338
let populationMinsk = 1995471
let populationVitebsk = 359148
// -----------------------------------------------------

// Блок 2. Параметры транспорта.
// - 2.1 Личная машина
let carKiaSpectra = "Kia Spectra"
let carKiaSpectraColor = "серебристый"
let carKiaSpectraFuelConsumption: LitersGasoline = 9.1
let carKiaSpectraYearIssue = 2008

// - 2.2 Машина жены
let carHyundaiSolaris = "Hyundai Solaris"
let carHyundaiSolarisColor = "синий"
let carHyundaiSolarisFuelConsumption: LitersGasoline = 6.6
let carHyundaiSolarisYearIssue = 2017

// - 2.3 Аренда машины Kia Rio
let rentCarKiaRio = "Kia Rio"
let rentCarKiaRioColor = "желтый"
let rentCarKiaRioFuelConsumption: LitersGasoline = 6.1
let rentCarKiaRioYearIssue = 2019
let rentCarKiaRioCostDay: Rub = 2945

// - 2.4 Аренда машины Volkswagen Polo
let rentCarVolkswagenPolo = "Volkswagen Polo"
let rentCarVolkswagenPoloColor = "серый"
let rentCarVolkswagenPoloFuelConsumption: LitersGasoline = 4.7
let rentCarVolkswagenPoloYearIssue = 2020
let rentCarVolkswagenPoloCostDay: Rub = 3325

// - 2.5 Автобус Scania Irizar i6
let busScaniaIrizar = "Scania Irizar i6"
let busScaniaIrizarColor = "белый"
let busScaniaIrizarYearIssue = 2021

// - 2.6 Автобус Higer 6189 (865)
let busHiger = "Higer 6189"
let busHigerColor = "синий"
let busHigerYearIssue = 2019

// - 2.7 Автобус MAN Lion's Coach
let busManLionsCoach = "MAN Lion's Coach"
let busManLionsCoachColor = "красный"
let busManLionsCoachYearIssue = 1984

// - 2.8 Поезд ТЭМ23
let trainTem = "тепловоз ТЭМ23"
let trainTemColor = "красный"
let trainTemYearIssue = 2023
// -----------------------------------------------------

// Блок 3. Параметры расходов, цен и разных величин
// 3.1 Разные велечины и расходы
var tripTime: Float // Время  потраченное на поездку между городами
var gasolineConsumption: LitersGasoline // Расход бензина между городами в литрах
var discountInRub: Rub // Сумма скидки в рублях
var costsRentalCar: Rub // Расходы на аренду автомобиля
var costsGasoline: Rub // Расходы на бензин
var costsHotel: Rub // Расходы на гостиницу
var costsFood: Rub // Расходы на еду
var costsEvents: Rub // Расходы на развлекательные мероприятия
var costsTaxi: Rub // Расходы на такси в городе
var costsTicketTransport: Rub // Расходы на билеты для общественного транспорта

// 3.2 Общие (все) расходы во время путешевствия
var allCostsRentalCar: Rub // Общие расходы на аренду автомобиля
var allCostsGasoline: Rub // Все расходы на бензин
var allCostsHotel: Rub // Все расходы на гостинецу
var allCostsFood: Rub // Все расходы на еду
var allCostsEvents: Rub // Все расходы на развекательные мероприятия
var allCostsTaxi: Rub // Все расходы на такси
var allCostsTicketTransport: Rub // Все расходы на билеты для общественного транспорта
var allTravelDays: TravelDays // Общее кол-во дней в путешевствии

// 3.3 Цены на товары и услуги
let priceLiterGasolineRussia: Rub = 52.88 // Стоймость бензина за литр в российских рублях в России
let priceLiterGasolineBelarus: Rub = 66.08 // Стоймость бензина за литр в российских рублях в Беларуси
// -----------------------------------------------------

// Блок 4. Путещевствие
// - 4.1 Москва

print("""
 Мы с женой решили поехать в отпуск и посетить 7 городов. Начнется оно
с города \(cityKaluga)! С собой мы взляи немного воды и еды ведь смысла
закупать более нет, так как город находится недалеко от Москвы. Мы
решили отправится на автобусе и уже стоим в очереди за покупкой билетов.
К нам подошел человек с просьбой уточнить время, оказалось что это
водитель автобуса и он как раз едет тем же рейсом. Я уточнил у воителя
какой будет транспорт, а он ответил что мы поедем на автобусе
\(busScaniaIrizar) \(busScaniaIrizarYearIssue) года сборки. У него \(busScaniaIrizarColor) цвет.\n
""")

// - 4.2 Калуга
// --  Локальные расходы в городе
tripTime = moscowToKaluga / 90
costsHotel = 3800.00
costsEvents = 1400.00 * 2
costsFood = 2030.45
costsTicketTransport = 898.43 * 2


// -- Рассказ
print(" Мы приехали в первывый город по нашему маршруту " + cityKaluga + "!" )
print("""
Наше время в поездке было не долгим, ориентировачно \(tripTime) часа/минут.
Мы проехали \(Int(moscowToKaluga)) киллометра. В городе \(cityKaluga) проживает \(populationKaluga) тысяч
человек. За билеты на автобус мы отдали относительно не дорого, вышло 
\(Int(costsTicketTransport)) рублей за двоих. До того как выехать из начальной точки в сервисе
бронирования отелей мы арендовали двухместный номер в "Интермашотель" за
\(Int(costsHotel)) рублей. После поездки нужно было отдохнуть, но уже вскоре мы 
загуглили куда можно сходить, а через 10 минут и помчались в "Калужский
областной драматический театр", билеты на спектакль стоили \(Int(costsEvents)) рублей
за двоих. Спектакль был очень хорошим за свои деньги. Тем не менее
возвращатся в отель мы не торопились. Наши желудки урчали, а значит нужно
было найти место где можно было поесть. К счастью для нас мы проходили
кафе "Solyanka", увидев его мы не раздумывая направились туда. Кафе
оказалось не очень хорошим по нашему мнению, по крайней мере можно было
цены сделать дешевле, а потратили мы там \(Int(costsFood)) рублей. После вернушись в
отель решили отдохнуть, ведь на завтра нужно собраться силами для новой
поездки.\n
""")

// -- Примерение скидки 20% на Отель (сумму разделить на 100 и умнодить на % процент скидки)
discountInRub = costsHotel / 100 * 13
costsHotel = costsHotel - discountInRub

// -- Глобальные расходы. Добавление из локальных.
allCostsHotel = costsHotel
allCostsEvents = costsEvents
allCostsFood = costsFood
allCostsTicketTransport = costsTicketTransport
allTravelDays = 1

// - 4.3 Брянск
// -- Локальные расходы в городе
tripTime = kalugaToBryansk / 120
costsHotel = 4784.00
costsEvents = 1321.29 * 2
costsFood = 832.48 * 2
costsRentalCar = rentCarKiaRioCostDay
gasolineConsumption = rentCarKiaRioFuelConsumption * kalugaToBryansk / 100
costsGasoline = priceLiterGasolineRussia * gasolineConsumption

// -- Рассказ
print(" Мы приехали во второй город " + cityBryansk + "!")
print("""
Путешевствие продолжается, предвкушение от поездки не оставляет в покое. 
Мы приехали в город с населением \(populationBryansk) тысяч человек! В этот раз мы 
решили арендовать машину \(rentCarKiaRio) \(rentCarKiaRioYearIssue) года, у нее \(rentCarKiaRioColor) цвет. Она
обошлась нам \(Int(rentCarKiaRioCostDay)) рублей за сутки, а так же отдельно мы заплатили за бензин
\(Int(costsGasoline)) рублей. На машине мы проехали \(Int(kalugaToBryansk)) киллометров за \(tripTime) час/минут. Когда
мы приехали сдали машину в одну из сетей сервиса где брали ее в городе
\(cityKaluga). Далее мы пешком отправились в отель попутно гуляя и изучая город.
Присмотрев некоторые места мы уже определились куда мы пойдем. Кстати об
отеле. Мы нашли классный отель с названием "Мегаполис", а за сутки заплатили
\(Int(costsHotel)) рублей. После заселения мы пошли гулять по центру города, после же
отправились в картинг клуб "Форсаж-32" где заплатили \(Int(costsEvents)) рублей. Ощущения
невероятные! По пути в отель мы зашли поужинать в небольшое кафе европейской
кухни "ЧИН.ЧИН". Было очень вкусно! Там с нас взяли \(Int(costsFood)) рублей. После же
мы отправились в отель, ведь утром нас ждала новая поездка.\n
""")

// -- Примерение скидки 20% на Отель (сумму разделить на 100 и умнодить на % процент скидки)
discountInRub = costsFood / 100 * 15
costsFood = costsFood - discountInRub

// -- Глобальные расходы. Добавление из локальных.
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allTravelDays += 1
allCostsRentalCar = costsRentalCar
allCostsGasoline = costsGasoline

// - 4.4 Гомель
// -- Локальные расходы в городе
tripTime = bryanskToGomel / 60
costsHotel = 3490.00
costsEvents = 831.42 * 2
costsFood = 590.00 * 2
costsTaxi = 410.00
costsTicketTransport = 2981.00 * 2

// -- Рассказ
print(" Мы приехали в третий город " + cityGomel + "!")
print("""
Пересекли границу с Беларусью! Только что вышли с поезда. Добрались мы за 
\(tripTime) часа/минут. Довольно быстро, хотя мы проехали \(Int(bryanskToGomel)) киллометров. Нас
доставил \(trainTemColor) \(trainTem) \(trainTemYearIssue) года. Во всех городах куда мы приезжаем
стараемся узнавать сколько жителей живет в этом городе, к примеру в городе
\(cityGomel) живет \(populationGomel) тысяч человек. Далее мы вызвали такси за \(Int(costsTaxi)) рублей от
воклаза до гостиницы "Замковой", в которой сняли номер за \(Int(costsHotel)) рублей. Далее
мы посетили "Гомельский областной музей военной славы" что стоило нам \(Int(costsEvents)) 
рублей. В этот раз мы решили разнообразить нашу кухню и купили шаурму в 
"Сити Шаурма Кинг" за \(Int(costsFood)) рублей. Безумно вкусная штука! Мы все так же пошли
в гостиницу так как утром едем дальше по маршруту!\n
""")

// -- Примерение скидки 20% на Отель (сумму разделить на 100 и умнодить на % процент скидки)
discountInRub = costsEvents / 100 * 9
costsEvents = costsEvents - discountInRub

// -- Глобальные расходы. Добавление глобальных расходов
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allCostsTaxi = costsTaxi
allTravelDays += 1
allCostsTicketTransport += costsTicketTransport

// - 4.5 Могилев
// -- Локальные расходы в городе
tripTime = gomelToMogilev / 90
costsHotel = 2530.00
costsEvents = 500.81 * 2
costsFood = 3761.32
costsTicketTransport = 790.0 * 2

// -- Рассказ
print(" Мы приехали в четвертый город " + cityMogilev + "!")
print("""
Если честно мы с женой уже немного устали от поездок, от перемещения по
такому количеству городов в короткий срок. Мы приехали на автобусе \(busHiger)
он \(busHigerYearIssue) года, у него был \(busHigerColor) цвет. Стоймость за такую поездку была \(Int(costsTicketTransport))
рублей за двоих. Кстати проехали мы \(gomelToMogilev) киллометров за \(tripTime) час/минут. 
В городе проживает \(populationMogilev) тысяч человек. Мы решили немного ускорить поездку и
сразу же заехали в гостиницу "Могилев" за \(Int(costsHotel)) рублей. Перекусив там, мы
отправились в Могилевскую ратушу, где смогли выйти на наблюдательную площадку
и даже подняться к часам. Цена была неприлично дешевой, примерно \(Int(costsEvents)) рубль за
двоих. Далее мы отправились гулять по бесплатным местам города к примеру были
около скульптуры "Станционный смотритель".После мы прогролодались и решили
зайти в ресторан, это был "ПАРМЕЗАН Пиццерия", это стоило нам \(Int(costsFood)) рублей. 
Все города которые мы посетили безумно классные, но пора ехать дальше!\n
""")

// -- Глобальные расходы. Добавление глобальных расходов.
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allTravelDays += 1
allCostsTicketTransport += costsTicketTransport


// - 4.6 Минск
// -- Локальные параметры
tripTime = mogilevToMinsk / 120
costsHotel = 6924.00
costsEvents = 814.85 + 3198.00 + 2750.00 + 350.00 * 2
costsFood = 5832.96
costsRentalCar = rentCarVolkswagenPoloCostDay
gasolineConsumption = rentCarVolkswagenPoloFuelConsumption * mogilevToMinsk / 100
costsGasoline = priceLiterGasolineBelarus * gasolineConsumption

// -- Рассказ
print(" Мы приехали в пятый город " + cityMinsk + "!")
print("""
Столица республики Беларусь! Как долго мы хотели сюда добраться! В городе
проживает \(populationMinsk) тысяч человек. Город очень большой. Сегодня мы приехали сюда
на арендованой машине \(rentCarVolkswagenPolo) \(rentCarVolkswagenPoloYearIssue) года выпуска, ее цвет был необычным,
как будето металик, возможно это не страндартный \(rentCarVolkswagenPoloColor) цвет. Проехали \(mogilevToMinsk)
киллометров за \(tripTime) час/минут. Стоймость аренды машины составила \(Int(costsRentalCar)), а
так же бензин у нас вышел на \(Int(costsGasoline)) рублей, ведь мы использовали \(gasolineConsumption) литров. В
первый день с самого сначала мы пошли в "Национальный исторический музей
Республики Беларусь", а после, нам нужно было заселится куда нибудь и по дороге
мы нашли отличный отель под названием "Минск". Cтоймость за сутки составляла
\(Int(costsHotel)) рубля. В течение 2 дней мы гуляли в центр города, ходили в аквапарк
"Лебяжий", в "ДиноПарк" и на колесо обозрения. За все развлечения мы
заплаитили \(Int(costsEvents)) рублей. Улицы в городе были очень чистыми и опрятными! При 
отеле был ресторан в которым нас вкусно кормили в течение нескольких дней. 
Завтракали, обедали и ужинали там. За все дни питаясь в отеле мы потратили \(Int(costsFood))
рублей. Мы столько потратили, что в основном гуляли по городу, так как денег
оставалось немного. В основном это были прогулки по городу.\n
""")

// -- Глобальные параметры.
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allTravelDays += 2
allCostsRentalCar += costsRentalCar
allCostsGasoline += costsGasoline

// - 4.7 Витебск
// -- Локальные параметры
tripTime = minskToVitebsk / 90
costsHotel = 4280.00
costsEvents = 5823.00
costsFood = 3189.00
costsTicketTransport = 1000.00 * 2

// -- Рассказ
print(" Мы приехали в шестой и заключающий нашу поездку город.")
print("""
Я давно хотел посетить этот город. Даже не знаю чем он меня примонил, толи 
названием, толи своей простотой. Мы находимся в городе \(cityVitebsk), стоит отметить
что в городе живет \(populationVitebsk) тысяч человек. Сюда мы добрались за \(tripTime) часа(ов)!
Расстояние которое мы проехали состояло \(minskToVitebsk) киллометр(ов). Нашим транспортом
был автобус \(busManLionsCoach) \(busManLionsCoachYearIssue) года выпуска, а его цвет \(busManLionsCoachColor).  Стоймость 
поездки составила \(Int(costsTicketTransport)) рублей на двоих, это абсолютнно не дорого. Сняли номер в
отеле "Apartament in Vitebsk Tower" за \(Int(costsHotel)) рублей. Далее пошли иследовать город,
осматривать спокойные и тихие улицы. Мы зашли поиграть в бильярд в развлекательный
центр "Город", сходили в "Витебский областной краеведческий музей" и в бассейн
"Витебскэнерго". Все мероприятия обошлись нам в \(Int(costsEvents)) рублей. После же мы решили
пойти в ресторан, так скажем вкуснотзавершить нашу большую поездку по городам! Мы
зашли в небольшое но довольно уютное заведение под названием "ZDOBA". Интересное
название, со Словенского оно переводится как красота. Мы посидели там с женой на
\(Int(costsFood)) рублей. Вот и подошла наша поездка к концу. Было очень классно, даже не 
передать словами и видео о впечатлениях от этой поездки! Ниже будет сделан подсчет
общей суммы которой мы потратили за месяц, будем надеятся что она более или менее
адекватна.\n
""")

// -- Глобальные параметры
allCostsHotel += costsHotel
allCostsEvents += costsEvents
allCostsFood += costsFood
allTravelDays += 1
allCostsTicketTransport += costsTicketTransport

// Блок 5. Подсчет и вывод в консоль расходов за поездку.
print("""
Мы приехали с женой домой и решили подсчитать наши расходы за \(allTravelDays) дней
в поездке. Сюдя по поездкам мы потратили довольно большую сумму, но сейчас все
разберем по деталям и посчитаем.

Расходы -
Расходы на отель: \(allCostsHotel)
Расходы на мероприятия: \(allCostsEvents)
Расходы на еду: \(allCostsFood)
Расходы на билеты общественного транспорта: \(allCostsTicketTransport)
Расходы на аренду машины: \(allCostsRentalCar)
Расходы на бензин: \(allCostsGasoline)
Расходы на такси: \(allCostsTaxi)
""")

PlaygroundPage.current.finishExecution()



