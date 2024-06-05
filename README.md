# Image Feed

# Ссылки

- [Unsplash API](https://unsplash.com/documentation)

# Назначение и цели приложения

Многостраничное приложение предназначено для просмотра изображений через API Unsplash.

Цели приложения:

- Просмотр бесконечной ленты картинок из Unsplash Editorial.
- Просмотр краткой информации из профиля пользователя.

# Краткое описание приложения

- В приложении обязательна авторизация через OAuth Unsplash.
- Главный экран состоит из ленты с изображениями. Пользователь может просматривать ее, добавлять и удалять изображения из избранного.
- Пользователи могут просматривать каждое изображение отдельно и делиться ссылкой на них за пределами приложения.
- У пользователя есть профиль с избранными изображениями и краткой информацией о пользователе.
- У приложения есть две версии: расширенная и базовая. В расширенной версии добавляется механика избранного и возможность лайкать фотографии при просмотре изображения на весь экран.

# Нефункциональные требования

## Технические требования

1. Авторизация работает через OAuth Unsplash и POST запрос для получения Auth Token.
2. Лента реализована с помощью UITableView.
3. В приложении использованы UImageView, UIButton, UILabel, TabBarController, NavigationController, NavigationBar, UITableView, UITableViewCell.
4. Приложение должно поддерживать устройства iPhone с iOS 13 или выше, предусмотрен только портретный режим.
5. Все шрифты в приложении — системные, не нужно их скачивать; в Interface Builder это шрифт «System» в выпадающем списке, а при вёрстке из кода — [`systemFont(ofSize:weight:)`](https://developer.apple.com/documentation/uikit/uifont/1619027-systemfont). В текущих версиях iOS (13—16) системный шрифт — это шрифт `SF Pro`, но в будущих версиях он может поменяться.

# Функциональные требования

# Авторизация через OAuth

Для входа в приложение пользователь должен авторизоваться через OAuth.

**Экран авторизации содержит:**

1. Логотип приложения
2. Кнопку «Войти»

**Алгоритмы и доступные действия:**

1. При входе в приложение пользователь видит splash-screen;
2. После загрузки приложения открывается экран с возможностью авторизации;
    1. При нажатии на кнопку «Войти» открывается браузер на странице авторизации Unsplash;
        1. При нажатии на кнопку «Login» браузер закрывается. В приложении появляется экран загрузки;
        2. Если авторизация через OAuth Unsplash не настроена, по нажатию на кнопку логина ничего не происходит;
        3. Если авторизация через OAuth Unsplash настроена не корректно — пользователь не сможет войти в приложение;
        4. При неудачной попытке входа всплывает модальное окно с ошибкой;
            1. При нажатии на «ОК» пользователь переходит обратно на экран авторизации;
        5. Если авторизация прошла успешно, то браузер закрывается. В приложении открывается экран с лентой.

## Просмотр ленты

В ленте пользователь может просматривать изображения в ленте, переходить к просмотру отдельного изображения и добавлять их в избранное.

**Экран ленты содержит:**

1. Карточку с изображением;
    1. Кнопку Лайк;
    2. Дата загрузки фотографии;
2. Таб бар для навигации между лентой и профилем.

**Алгоритмы и доступные действия:**

1. Экран с лентой открывается по умолчанию после входа в приложение;
2. Лента содержит изображения из Unsplash Editorial;
3. При скролле вниз и вверх пользователь может просматривать ленту;
    1. Если изображение не успело загрузиться, то пользователю отображается системный лоадер;
    2. Если изображение невозможно загрузить – пользователь видит плэйсхолдер вместо изображения;
4. При нажатии на кнопку Лайк (серое сердечко) пользователь может лайнкуть изображение. После нажатия отображается лоадер:
    1. Если запрос успешный, то лоадер пропадает, иконка меняет состояние на Кнопку Красный Лайк (красное сердечко).
    2. Если запрос не успешный, то всплывает модальное окно с ошибкой «попробуйте еще раз»
5. Пользователь может убрать лайк, повторно нажав на кнопку Лайк (красное сердечко). После нажатия отображается лоадер:
    1. Если запрос успешный, то лоадер пропадает, иконка меняет состояние на серое сердечко.
    2. Если запрос не успешный, то всплывает модальное окно с ошибкой «попробуйте еще раз»;
6. При нажатии на карточку с изображением оно увеличится до границ телефона и пользователь перейдет на экран просмотра изображения (раздел «Просмотр изображения на весь экран»);
7. При нажатии на иконку профиля пользователь может перейти в профиль;
8. Пользователь может переключаться между экранами ленты и профиля с помощью таб бара.

## Просмотр изображения на весь экран

Из ленты пользователь может перейти к просмотру изображения на весь экран и поделиться им.

**Экран содержит:**

1. Увеличенное изображение до границ телефона;
2. Кнопку возврата на предыдущий экран;
3. Кнопку для загрузки изображения и с возможностью им поделиться.

**Алгоритмы и доступные действия:**

1. При открытии изображения на весь экран пользователь видит растянутое изображение до границ экрана. Изображение выровнено по центру;
    1. Если изображение невозможно загрузить и показать – пользователь видит плэйсхолдер;
    2. Если ответ на запрос не получен — появляется системный алерт с ошибкой;
2. При нажатии на кнопку Назад пользователь может вернуться на экран просмотра ленты;
3. При помощи жестов пользователь может перемещаться по растянутому изображению, зумировать и поворачивать изображение. Изображение фиксируется в выбранном положении;
    1. Если не настроены жесты для увеличения или поворота изображения — эти действия будут не доступны;
4. При нажатии на кнопку кнопку Поделиться всплывает системное меню, в котором пользователь может загрузить изображение или поделиться им;
    1. После совершения действия меню скрывается;
    2. Пользователь может закрыть меню свайпом вниз или при нажатии на крестик;
    3. Если открытие системного меню при нажатии на кнопку “загрузить или поделиться изображением” не настроено — оно не будет показываться;

## Просмотр профиля пользователя

Пользователь может перейти в свой профиль, чтобы посмотреть данные профиля или выйти из него.

**Экран профиля содержит:**

1. Данные профиля;
    1. Фотографию пользователя;
    2. Имя и username пользователя;
    3. Информация о себе;
2. Кнопку выхода из профиля;
3. Таб бар;

**Алгоритмы и доступные действия:**

1. Данные профиля загружаются из профиля в Unsplash. Данные профиля нельзя изменить в приложении;
    1. Если данные профиля не подтянулись из Unsplash, то пользователь видит плэйсхолдер вместо аватрки. Username и имя не отображаются;
2. При нажатии на кнопку выхода из профиля (логаут) пользователь может выйти из приложения. Всплывает системный алерт с подтверждением выхода;
    1. Если пользователь нажимает «Да», то он разлогинивается и открывается экран авторизации;
        1. Если не настроены или настроены неправильно действия с кнопкой «Да», то при нажатии пользователя не разлогинивается и попадает на экран авторизации;
    2. Если пользователь нажимает «Нет», то он возвращается на экран профиля;
    3. Если алерт не настроен, то при нажатии на кнопку выходы ничего не происходит, пользователь не может разлогиниться;
3. Пользователь может переключаться между экранами ленты и профиля с помощью таб бара.

# Скрины

# Экран авторизации 

<img width="514" alt="Снимок экрана 2024-05-15 в 14 28 13" src="https://github.com/ospanovadinara/ImageFeed/assets/136311088/b255062e-84cf-4660-a076-e3cf004d9eb1">

<img width="514" alt="Снимок экрана 2024-05-15 в 14 28 19" src="https://github.com/ospanovadinara/ImageFeed/assets/136311088/ef03e4d6-46d5-47ca-bf10-92eb30870496">

# Экран ленты

<img width="514" alt="Снимок экрана 2024-05-15 в 14 27 25" src="https://github.com/ospanovadinara/ImageFeed/assets/136311088/8f50c810-760c-43cf-90fb-e96754485652">

# Экран просмотра изображения на весь экран

<img width="514" alt="Снимок экрана 2024-05-15 в 14 27 42" src="https://github.com/ospanovadinara/ImageFeed/assets/136311088/54ba014d-39de-44c9-a157-347596cd9ba2">

<img width="514" alt="Снимок экрана 2024-05-15 в 14 27 52" src="https://github.com/ospanovadinara/ImageFeed/assets/136311088/eea3c561-7f35-4c9d-a621-2dec81ba7e62">

# Экран Профиля 







