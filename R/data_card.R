# Загружаем библиотеки
library(rym)
library(tidyr)
library(dplyr)
library(googlesheets4)
library(readr)

# Авторизуемся
rym_auth(login = "sobyaninks@yandex.ru", token.path = "TOKEN_YANDEX_METRIKA")
startDate <- "2024-03-01"
finishDate <- "yesterday"

# Выгружаем кол-во посетителей для десктопной версии
desktop_user <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/pm.ru/|/krasnodar.pm.ru/|/tula.pm.ru/
  |/kaluga.pm.ru/|/ryazan.pm.ru|/nn.pm.ru|/voronezh.pm.ru|/tver.pm.ru|/yaroslavl.pm.ru|
  /vladimir.pm.ru|/kostroma.pm.ru|/lipetsk.pm.ru|/ivanovo.pm.ru|
  /novorossiysk.pm.ru|/rostov-na-donu.pm.ru' 
  OR ym:s:deviceCategory=='desktop')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей просмотревших карточку товара для десктопной версии
desktop_prouduct <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/pm.ru/|/krasnodar.pm.ru/|/tula.pm.ru/
  |/kaluga.pm.ru/|/ryazan.pm.ru|/nn.pm.ru|/voronezh.pm.ru|/tver.pm.ru|/yaroslavl.pm.ru|
  /vladimir.pm.ru|/kostroma.pm.ru|/lipetsk.pm.ru|/ivanovo.pm.ru|
  /novorossiysk.pm.ru|/rostov-na-donu.pm.ru' 
  OR ym:s:deviceCategory=='desktop')
  AND (ym:pv:URL=~'goods' OR ym:pv:URL=~'/product/')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей добавивших товар в корзину для десктопной версии
desktop_add_cart <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:productBasketsUniq",
  filters="(ym:s:startURLPathLevel1=~'/pm.ru/|/krasnodar.pm.ru/|/tula.pm.ru/
  |/kaluga.pm.ru/|/ryazan.pm.ru|/nn.pm.ru|/voronezh.pm.ru|/tver.pm.ru|/yaroslavl.pm.ru|
  /vladimir.pm.ru|/kostroma.pm.ru|/lipetsk.pm.ru|/ivanovo.pm.ru|
  /novorossiysk.pm.ru|/rostov-na-donu.pm.ru' 
  OR ym:s:deviceCategory=='desktop')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей перешедших в корзину для десктопной версии
desktop_visit_cart <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/pm.ru/|/krasnodar.pm.ru/|/tula.pm.ru/
  |/kaluga.pm.ru/|/ryazan.pm.ru|/nn.pm.ru|/voronezh.pm.ru|/tver.pm.ru|/yaroslavl.pm.ru|
  /vladimir.pm.ru|/kostroma.pm.ru|/lipetsk.pm.ru|/ivanovo.pm.ru|
  /novorossiysk.pm.ru|/rostov-na-donu.pm.ru' 
  OR ym:s:deviceCategory=='desktop')
  AND (ym:pv:URL=~'/cart/')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей перешедших в checkout для десктопной версии
desktop_checkout <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/pm.ru/|/krasnodar.pm.ru/|/tula.pm.ru/
  |/kaluga.pm.ru/|/ryazan.pm.ru|/nn.pm.ru|/voronezh.pm.ru|/tver.pm.ru|/yaroslavl.pm.ru|
  /vladimir.pm.ru|/kostroma.pm.ru|/lipetsk.pm.ru|/ivanovo.pm.ru|
  /novorossiysk.pm.ru|/rostov-na-donu.pm.ru' 
  OR ym:s:deviceCategory=='desktop')
  AND (ym:pv:URL=~'/checkout/')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей начавших заполнять форму для десктопной версии
desktop_user_fill_form_fields <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:goal332287627users",
  filters="(ym:s:startURLPathLevel1=~'/pm.ru/|/krasnodar.pm.ru/|/tula.pm.ru/
  |/kaluga.pm.ru/|/ryazan.pm.ru|/nn.pm.ru|/voronezh.pm.ru|/tver.pm.ru|/yaroslavl.pm.ru|
  /vladimir.pm.ru|/kostroma.pm.ru|/lipetsk.pm.ru|/ivanovo.pm.ru|
  /novorossiysk.pm.ru|/rostov-na-donu.pm.ru' 
  OR ym:s:deviceCategory=='desktop')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей совершивших покупку для десктопной версии
desktop_order_cart <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:productPurchasedUniq",
  filters="(ym:s:startURLPathLevel1=~'/pm.ru/|/krasnodar.pm.ru/|/tula.pm.ru/
  |/kaluga.pm.ru/|/ryazan.pm.ru|/nn.pm.ru|/voronezh.pm.ru|/tver.pm.ru|/yaroslavl.pm.ru|
  /vladimir.pm.ru|/kostroma.pm.ru|/lipetsk.pm.ru|/ivanovo.pm.ru|
  /novorossiysk.pm.ru|/rostov-na-donu.pm.ru' 
  OR ym:s:deviceCategory=='desktop')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Связываем показатели (метрики) и переименовываем их в общей таблице для десктопной версии
desktopAllOrder <- full_join(desktop_user, desktop_prouduct,by="Дата визита")  %>%
  full_join(desktop_add_cart,by="Дата визита") %>%
  full_join(desktop_visit_cart,by="Дата визита") %>%
  full_join(desktop_checkout,by="Дата визита") %>%
  full_join(desktop_user_fill_form_fields,by="Дата визита") %>%
  full_join(desktop_order_cart,by="Дата визита") %>%
  rename("Посетители"="Посетители.x","Карточка"="Посетители.y",
         "Добавление в корзину"="Количество посетителей, добавивших товар в корзину",
         "Посещение корзины"="Посетители.x.x",
         "Переход в checkout"="Посетители.y.y",
         "Заполнение полей"="Целевые посетители (Events.Desktop.Cart.Click (заполнение полей))",
         "Заказ через корзину"="Количество посетителей, купивших товар"
  )

# Выгружаем данные в Google Sheets для десктопной версии
write_sheet(desktopAllOrder, "ss = https://docs.google.com/spreadsheets/d/1klydS8YZEg8rBM1KEZ6ynHAg0QwjF8o443KMirfhtjs/edit?usp=sharing", sheet = "DESKTOP корзина")

# Выгружаем кол-во посетителей для mobile версии
mobile_user <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru/|/app.pm.ru/' 
  OR ym:s:deviceCategory=='mobile')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей просмотревших карточку товара для mobile версии
mobile_prouduct <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru|/app.pm.ru' 
  OR ym:s:deviceCategory=='mobile')
  AND (ym:pv:URL=~'goods' OR ym:pv:URL=~'/product/')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей добавивших товар в корзину для mobile версии
mobile_add_cart <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:productBasketsUniq",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru/|/app.pm.ru/' 
  OR ym:s:deviceCategory=='mobile')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей перешедших в корзину для mobile версии
mobile_visit_cart <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru/|/app.pm.ru/' 
  OR ym:s:deviceCategory=='mobile')
  AND (ym:pv:URL=~'/cart/')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей начавших заполнять форму для mobile версии
mobile_fill_form_fields <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:goal332290171users",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru/|/app.pm.ru/' 
  OR ym:s:deviceCategory=='mobile')
  AND (ym:pv:URL=~'/cart/')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей совершивших покупку для mobile версии
mobile_order_cart <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:productPurchasedUniq",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru/|/app.pm.ru/' 
  OR ym:s:deviceCategory=='mobile')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Связываем показатели (метрики) и переименовываем их в общей таблице для mobile версии
mobileAllOrder <- full_join(mobile_user, mobile_prouduct,by="Дата визита")  %>%
  full_join(mobile_add_cart,by="Дата визита") %>%
  full_join(mobile_visit_cart,by="Дата визита") %>%
  full_join(mobile_fill_form_fields,by="Дата визита") %>%
  full_join(mobile_order_cart,by="Дата визита") %>%
  rename("Посетители"="Посетители.x","Карточка"="Посетители.y",
         "Добавление в корзину"="Количество посетителей, добавивших товар в корзину",
         "Посещение корзины"="Посетители",
         "Заполнение полей"="Целевые посетители (All_VPages.Mobile.Cart (заполнение полей формы))",
         "Заказ через корзину"="Количество посетителей, купивших товар"
  )
# Выгружаем данные в Google Sheets для mobile версии
write_sheet(mobileAllOrder, "ss = https://docs.google.com/spreadsheets/d/1klydS8YZEg8rBM1KEZ6ynHAg0QwjF8o443KMirfhtjs/edit?usp=sharing", sheet = "MOBILE корзина")

# Выгружаем кол-во посетителей для mobile быстрый заказ
mobile_buy_in_one_click_user <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru/|/app.pm.ru/' 
  OR ym:s:deviceCategory=='mobile')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей просмотревших карточку товара для mobile быстрый заказ
mobile_buy_in_one_click_prouduct <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru|/app.pm.ru' 
  OR ym:s:deviceCategory=='mobile')
  AND (ym:pv:URL=~'goods' OR ym:pv:URL=~'/product/')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей перешедших на форму "Быстрый заказ" для mobile быстрый заказ
mobile_buy_in_one_click_form <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:goal332201915users",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru/|/app.pm.ru/' 
  OR ym:s:deviceCategory=='mobile')
  
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей начавших заполнение полей 
# формa "Быстрый заказ" для mobile быстрый заказ
mobile_buy_in_one_click_form_field <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:goal332284778users",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru/|/app.pm.ru/' 
  OR ym:s:deviceCategory=='mobile')
  
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Выгружаем кол-во посетителей совершивших покупку для mobile быстрый заказ
mobile_buy_in_one_click_order_cart <- rym_get_data (
  counters = "314597",
  date.from = startDate, 
  date.to = finishDate,
  dimensions = "ym:s:date",
  metrics = "ym:s:users",
  filters="(ym:s:startURLPathLevel1=~'/m.pm.ru/|/app.pm.ru/' 
  OR ym:s:deviceCategory=='mobile')
  AND (ym:pv:URL=~'method=mobile.buy_in_one_click')
  AND (ym:s:lastsignUTMCampaign!='5722557__0_Konkurentyi_poisk_msk')
 ",
  sort = "-ym:s:date",
  login="sobyaninks@yandex.ru", 
  token.path="metrika_token",
  lang ="ru")

# Связываем показатели (метрики) и переименовываем их в общей таблице для mobile быстрый заказ
mobile_buy_in_one_click_AllOrder <- 
  full_join(mobile_buy_in_one_click_user, mobile_buy_in_one_click_prouduct,by="Дата визита")  %>%
  full_join(mobile_buy_in_one_click_form,by="Дата визита") %>%
  full_join(mobile_buy_in_one_click_form_field,by="Дата визита") %>%
  full_join(mobile_buy_in_one_click_order_cart,by="Дата визита") %>%
  rename("Посетители"="Посетители.x","Карточка"="Посетители.y",
         "Форма Быстрый заказ"='Целевые посетители (Переход форма "Быстрый заказ" mobile)',
         "Заполнение полей"='Целевые посетители ([Form_Buy1click_Mobile] Начали заполнять форму)',
         "Быстрый заказ"="Посетители",
  )

# Выгружаем данные в Google Sheets mobile быстрый заказ
write_sheet(mobile_buy_in_one_click_AllOrder, "ss = https://docs.google.com/spreadsheets/d/1klydS8YZEg8rBM1KEZ6ynHAg0QwjF8o443KMirfhtjs/edit?usp=sharing", sheet = "MOBILE быстрый заказ")



