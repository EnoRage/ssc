/*
    Примечания:
        1) Pure означает, что функция не будет считывать или записывать данные.
        2) Библиотека SafeMath предназначена для того, чтобы исключить перегрузку переменных.
        3) Internal - означает, что функция может вызываться только внутри контракта или в контрактах, унаследованных от данного.
        4) В Solidity деление на 0 автоматически выдаёт ошибку.
*/

/* 
    1. Реализовать интерфейс стандарта токена ERC20Basic.
        Что должен включать в себя стандарт ERC20Basic?
            1) Общее предложение токенов.
            2) Функция получения баланса счёта конкреткого участника сети.
            3) Функция передачи токенов другому лицу.
            4) Событие передачи токенов другому лицу.
    2. Реализовать интерфейс стандарта токена ERC20.
        ERC20 - это ERC20Basic + возможность доверять свои токены другому адресу сети.
        Что должени включать в себя стандарт ERC20Basic?
            1) Функция, которая предоставляет право пользоваться определённым количеством средств чужому счёту.
            2) Функция, которая позволяет проверить сколько средств предоставлено другому адресу сети.
            3) Функция для осуществления транзакций с доверенных адресов.
            4) Событие предоставления права пользования средствами чужого счёта.
    3. Написать библиотеку безопасной матиматики.
        Когда переменная перегружается - она начинает отсчёт сначала.
        1) Функция, перемножающая числа a и b.
            a) Всё работает хорошо, если c/a=b или если a=0.
        2) Функция, делющая a на b. В любом случае число будет меньше и переменная не перегрузится.
            a) Деление на 0. Проверяется автоматически EVM.
        3) Функция, вычитающа b из a.
            a) Всё работает хорошо, если a<=b.
        4) Функция, складывающая a и b.
            a) Всё работет хорошо, если c>=a
    4. Создать контракт токена по стандарту ERC20.
        1) Использовать библиотеку SafeMath.
        2) Реализовать стандарт токена ERC20Basic.
            a) Определить переменную балансов.
            б) Реализовать интерфейс ERC20Basic.
                1. Функция для того, чтобы узнать баланс.
                    1.1. Возвращает баланс.
                2. Функция передачи токенов.
                    2.1. Сделать проверку на пустой адрес.
                    2.2. Проверка на наличие средств на кошельке.
                    2.3. Отнимаем средства у отправителя и добавляем получателю.
                    2.4. Добавляем событие трансфера.
                    2.5. Возвращаем true.
        3) Реализовать стандарт токена ERC20
            а) Определить переменную доступа.
            б) Реализовать интерфейс ERC20.
                1. Функция разрешения использования определённого кол-ва средств на аккаунте чужому адресу.
                    1.1. Записываем в переменную доступа нужную сумму.
                    1.2. Записываем сообытие доступа.
                    1.3. Возвращаем полученное значение.
                2. Функции добавления (вычитания) доступных средств дял использования чужому аккаунту.
                    2.1. Добавляем (вычитаем) средства, использую SafeMath.
                    2.2. В вычитании прописать условие при b>a, которое гласит: сумма станет 0.
                    2.3. Добавляем событие доступа.
                    2.4. Возвращаем успех.
                3. Функция проверки доступной суммы для использования с чужого адреса.
                    3.1.Возвратить переменную доступа.
    5. Создать контракт на проверку владельца.
        5.1. Создать переменную владельца.
        5.2. Создать конструктор для владельца.
        5.3. Создать функцию только для владельца.
        5.4. Создать событие передачи прав владения контрактом.
        5.5. Создать функцию изменения владельца.
            5.5.1. Проверка на пустой адрес.
            5.5.2. Создание события передачи прав.
            5.5.3. Передача прав.
    6. Создать контракт для чеканки токена с правами owner'a.
        6.1. Создание событие чеканки.
        6.2. Общее предложение добавляем.
        6.3. К балансу добавляем.
        6.4. Событие чеканки.
        6.5. Вощвращаем true.
    7. Создать контракт наименования токена.
        7.1. Имя. Сокращённое название. Кол-во знаков после запятой.
    8. Создать контракт распродажи токенов.
        8.1. Переменная владельца.
        8.2. Создаём публичный объект токена.
        8.3. Создаём переменные текущей даты и периода.
        8.3. Создаём конструктор. Там пишем owner'a.
        8.4. Пишем функцию payable. 
            8.4.1. Проверка на дату.
            8.4.2. owner.transfer(msg.value) - отправляем криптвалюту владельцу смартконтракта.
            8.4.2. token.mint(msg.sender, msg.value) - производим чеканку токенов 
*/
