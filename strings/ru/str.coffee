module.exports =
  application:
    newversion: "Приложение обновлено. Перезагрузить сейчас?"

  # Flash messages
  flash:
    serviceDown: "Служба недоступна. Повторите попытку в ближайшее время."
    invalidLogin: "Неверное имя пользователя или пароль."
    sessionCompleted: "Вы закончили работу. Заходите завтра!"
    infoMissing: "Часть информации в форме неверна или отсутствует."
    userSuspended: "Работа этого пользователя приостановлена. Обратитесь за помощью к вашему администратору."
    sessionExpired: "Время сеанса истекло. Выполните вход еще раз."
    lockedOut: "Вы заблокированы. Попробуйте снова через 15 минут."
    noInternet: "Нет подключения к Интернету."

  login:
    username: "Имя пользователя"
    password: "Пароль"
    greeting: "Привет,"
    loginbtn: "Войти"
    forgotpassword: "Забыли пароль?"
    signin: "Выполните вход, чтобы начать работу"
    disclaimer: ""
    resetapp: "Изменить код активации"
    invalidCredentials: "Неверное имя пользователя или пароль."

  metrics:
    graduates:
      title: 'Выпускники'
      meta: 'За последние 7 дней'
      graduated: 'Пройденное'
      congratulations:
        error: 'Ошибка при отправке поздравления пользователю! Повторите попытку.'
        success: 'Поздравление отправлено!'
    knowledgeGrowth:
      title: 'Описание темы'
      meta: 'Развитие знаний'
    needsCoaching:
      title: 'Требуется обучение'
      meta: 'Постоянно менее 50%'
      list:
        meta: ' темы'
      profile:
        topHeader: 'Требуется обучение'
        restHeader: 'Темы'
    nonParticipants:
      title: 'Не участвующие'
      meta: 'За последние 7 дней'
      list:
        metaDayCount: '<%- dayCount %> дней'
        metaNeverLoggedIn: 'Не зарегистрирован'
    prizeWinners:
      title: 'Призеры'
      meta: 'За последние 7 дней'
      bought: 'Куплено'
      won: 'Выиграно'
      congratulations:
        error: 'Ошибка при отправке поздравления пользователю. Повторите попытку.'
        success: 'Поздравление отправлено!'
    teamAverage:
      title: "Средний командный балл"
    topicExperts:
      title: 'Эксперты'
      meta: 'Прошедшие тему с результатом выше 90%, высокий уровень знаний'
      list:
        meta:' темы'
      profile:
        topHeader: 'Темы для экспертов'
        restHeader: 'Темы'
    topPerformers:
      title: 'Лучшие игроки'
      meta: 'Большинство бонусные очки заработал в прошлом 30 дней'
    teamSize:
      title: 'Pазмер Команд:'

  models:
    filter:
      all: "Моя команда"

  messages:
    toGroupHeaderTitle: "Сообщение для команды"
    toGroupLabel: "Кому:"
    toUserHeaderTitle: "Сообщение"
    toUserLabel: "Кому:"
    defaultFilter: "Моя команда"
    camera: "камера"
    album: "альбом"
    fieldsEmpty: "Выберите изображение или напишите текст."
    selectFilterTitle: "Фильтры"
    messagePlaceHolder: "Напечатать сообщение здесь..."
    messageSent: 'Сообщение отправлено!'
    send: "Отправить"
    cancel: "Отмена"
    error:
      fileUpload: "Ошибка при загрузке файла"
      fileTooBig: "Ошибка: Слишком большой размер файла.  Размер файла не должен превышать 5 МБ."
      sendMessage: "Ошибка при отправке сообщения"
    templates:
      userKnowledgeMessageTemplate: "Молодец!"
      userGraduated: """
        Привет, <%= name %>,

        Тема успешно завершена! <%- topicName %>!

        Отличная работа!
        <%= managerName %>
      """
      userWonPrize: """
        Hey <%= name %>,

        Поздравляем! Вы выиграли <%= prizeName %>

        Отличная работа!
        <%= managerName %>
      """

  menu:
    metrics: "Показатели"
    teamMessage: "Сообщение для команды"
    people: "Люди"
    logout: "Выйти из системы"

  mixins:
    loadingrow: "Идет загрузка..."
    emptyrow: "Нет данных"

  people:
    list:
      searchplaceholder: "Найти человека"
    profile:
      baselineseries: "Базовая отметка"
      currentseries: "Текущий"
      baselineavg: "Средняя базовая отметка"
      currentavg: "Текущий средний балл"
      topicItem:
        nameLevel: " - Уровень "
      topicsHeader: "Темы"

  search:
    closex: 'X'

  knowledgeGaugeChart:
    loadingData: 'Загрузка данных...'
