module.exports =
  application:
    newversion: "La aplicación ha sido actualizada. ¿Le gustaría volver a cargarla ahora?¨"

  # Flash messages
  flash:
    serviceDown: "El servicio no funciona. Vuelva a intentarlo más tarde."
    invalidLogin: "Nombre de usuario o contraseña no válidos."
    sessionCompleted: "Usted ha terminado sus actividades. ¡Vuelva a comprobar mañana!"
    infoMissing: "Falta parte de la información en el formulario o no es correcta."
    userSuspended: "El usuario está suspendido de momento. Por favor, contacte a su administrador para recibir ayuda."
    sessionExpired: "Su sesión ha expirado. Por favor, vuelva a iniciar sesión."
    lockedOut: "Usted ha sido bloqueado. Favor de intentarlo nuevamente en 15 minutos."
    noInternet: "No hay conexión a Internet."

  login:
    username: "Nombre de usuario"
    password: "Contraseña"
    greeting: "Hola:"
    loginbtn: "Iniciar sesión"
    forgotpassword: "¿Olvidó su contraseña?"
    signin: "Iniciar sesión para comenzar"
    disclaimer: ""
    resetapp: "Cambiar código de activación"
    invalidCredentials: "Nombre de usuario o contraseña no válidos."

  metrics:
    graduates:
      title: 'Graduados'
      meta: 'Últimos 7 días'
      graduated: 'Graduado'
      congratulations:
        error: '¡Error al enviar las felicitaciones al usuario! ¡Intente de nuevo!'
        success: '¡Felicitaciones enviadas!'
    knowledgeGrowth:
      title: 'Resumen de temas'
      meta: 'Crecimiento del conocimiento'
    needsCoaching:
      title: 'Necesita entrenamiento'
      meta: 'Habitualmente es inferior al 50%'
      list:
        meta: ' temas'
      profile:
        topHeader: 'Necesita entrenamiento'
        restHeader: 'Temas'
    nonParticipants:
      title: 'Sin participantes'
      meta: 'Últimos 7 días'
      list:
        metaDayCount: '<%- dayCount %> días'
        metaNeverLoggedIn: 'Nunca inició sesión'
    prizeWinners:
      title: 'Ganadores del premio'
      meta: 'Últimos 7 días'
      bought: 'Adquirió'
      won: 'Ganó'
      congratulations:
        error: 'Error al enviar las felicitaciones al usuario. Intente de nuevo.'
        success: '¡Felicitaciones enviadas!'
    teamAverage:
      title: 'Promedio del equipo'
    topicExperts:
      title: 'Expertos'
      meta: 'Se gradúa más del 90%, alta confianza'
      list:
        meta:' temas'
      profile:
        topHeader: 'Temas de expertos'
        restHeader: 'Temas'
    topPerformers:
      title: 'Mejores resultados'
      meta: 'La mayoría de los puntos de recompensa ganados en los últimos 30 días'
    teamSize:
      title: 'Tamaño del equipo:'


  models:
    filter:
      all: "Mi equipo"

  messages:
    toGroupHeaderTitle: "Mensaje del equipo"
    toGroupLabel: "Para:"
    toUserHeaderTitle: "Mensaje"
    toUserLabel: "Para:"
    defaultFilter: "Mi equipo"
    camera: "cámara"
    album: "álbum"
    fieldsEmpty: "Seleccione una imagen o escriba algún texto."
    selectFilterTitle: "Filtros"
    messagePlaceHolder: "Comience a escribir su mensaje aquí..."
    messageSent: "Mensaje enviado"
    send: "Enviar"
    cancel: "Cancelar"
    error:
      fileUpload: "Error al cargar el archivo"
      fileTooBig: "Error: ¡El tamaño del archivo es muy grande!  Debe ser menos de 5MB."
      sendMessage: "Error al enviar el mensaje"
    templates:
      userKnowledgeMessageTemplate: "¡Siga así!"
      userGraduated: """
        Oye <%= name %>,

        Gran trabajo al graduarse <%- topicName %>!

        Buen trabajo,
        <%= managerName %>
      """
      userWonPrize: """
        Oye <%= name %>,

        Felicidades por ganar el <%= prizeName %>

        Buen trabajo,
        <%= managerName %>
      """
  menu:
    metrics: "Criterios de medición"
    teamMessage: "Mensaje del equipo"
    people: "Personas"
    logout: "Cierre de sesión"

  mixins:
    loadingrow: "Cargando..."
    emptyrow: "No hay datos disponibles"

  people:
    list:
      searchplaceholder: "Encontrar una persona"
    profile:
      baselineseries: "Línea de base"
      currentseries: "Actual"
      baselineavg: "Promedio de la línea de base"
      currentavg: "Promedio actual"
      topicItem:
        nameLevel: " - Nivel "
      topicsHeader: "Temas"

  search:
    closex: 'X'

  knowledgeGaugeChart:
    loadingData: 'Cargando datos...'
