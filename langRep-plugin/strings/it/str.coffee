module.exports =
  application:
    newversion: "L'applicazione è stata aggiornata. Desideri riavviarla subito?"

  # Flash messages
  flash:
    serviceDown: "Il servizio non è al momento raggiungibile. Riprova tra poco."
    invalidLogin: "Nome utente o password non validi."
    sessionCompleted: "Hai completato le tue attività. Torna a trovarci domani!"
    infoMissing: "Alcuni dati del modulo sono mancanti o incorretti."
    userSuspended: "L'utente è attualmente sospeso. Contatta l'amministratore per ricevere assistenza."
    sessionExpired: "La sessione è scaduta. Esegui nuovamente l'accesso."
    lockedOut: "Sei stato/a bloccato/a. Riprova fra 15 minuti."
    noInternet: "Nessuna connessione a internet."

  login:
    username: "Nome utente"
    password: "Password"
    greeting: "Salve,"
    loginbtn: "Entra"
    forgotpassword: "Hai dimenticato la password?"
    signin: "Esegui l'accesso per iniziare"
    disclaimer: ""
    resetapp: "Cambia codice di attivazione"
    invalidCredentials: "Nome utente o password non validi."

  metrics:
    graduates:
      title: 'Diplomati'
      meta: 'Ultimi 7 giorni'
      graduated: 'Diplomati'
      congratulations:
        error: "Errore durante l'invio dei complimenti all'utente. Riprova."
        success: 'Complimenti inviati'
    knowledgeGrowth:
      title: 'Riepilogo argomenti'
      meta: 'Crescita della conoscenza'
    needsCoaching:
      title: 'Richiede esercizio'
      meta: 'Costantemente al di sotto del 50%'
      list:
        meta: ' argomenti'
      profile:
        topHeader: 'Richiede esercizio'
        restHeader: 'Argomenti'
    nonParticipants:
      title: 'Non partecipanti'
      meta: 'Ultimi 7 giorni'
      list:
        metaDayCount: '<%- dayCount %> giorni'
        metaNeverLoggedIn: 'Mai effettuata la registrazione'
    prizeWinners:
      title: 'Vincitori di premi'
      meta: 'Ultimi 7 giorni'
      bought: 'Acquistato'
      won: 'Vinto'
      congratulations:
        error: "Errore durante l'invio dei complimenti all'utente. Riprova."
        success: 'Complimenti inviati'
    teamAverage:
      title: 'Media del team'
    topicExperts:
      title: 'Esperti'
      meta: 'Diplomati oltre il 90%, sicurezza elevata'
      list:
        meta:' argomenti'
      profile:
        topHeader: 'Argomenti esperti'
        restHeader: 'Argomenti'
    topPerformers:
      title: 'Migliori giocatori'
      meta: 'La maggior parte dei punti premio accumulati negli ultimi 30 giorni'
    teamSize:
      title: 'Dimensione squadra:'

  models:
    filter:
      all: "Il mio team"

  messages:
    toGroupHeaderTitle: "Messaggio team"
    toGroupLabel: "A:"
    toUserHeaderTitle: "Messaggio"
    toUserLabel: "A:"
    defaultFilter: "Il mio team"
    camera: "fotocamera"
    album: "album"
    fieldsEmpty: "Seleziona un'immagine o scrivi il testo desiderato."
    selectFilterTitle: "Filtri"
    messagePlaceHolder: "Digita qui il tuo messaggio..."
    messageSent: "Messaggio inviato"
    send: "Invia"
    cancel: "Annulla"
    error:
      fileUpload: "Errore durante il caricamento del file"
      fileTooBig: "Errore: file troppo grande.  La dimensione dev'essere inferiore a 5 MB."
      sendMessage: "Errore durante l'invio del messaggio"
    templates:
      userKnowledgeMessageTemplate: "Continua così!"
      userGraduated: """
        Salve <%= name %>,

        Complimenti per il diploma in <%- topicName %>!

        Ottimo lavoro,
        <%= managerName %>
      """
      userWonPrize: """
        Salve <%= name %>,

        Complimenti per aver vinto il <%= prizeName %>

        Ottimo lavoro,
        <%= managerName %>
      """

  menu:
    metrics: "Metriche"
    teamMessage: "Messaggio team"
    people: "Persone"
    logout: "Esci"

  mixins:
    loadingrow: "Caricamento..."
    emptyrow: "Nessun dato disponibile"

  people:
    list:
      searchplaceholder: "Trova una persona"
    profile:
      baselineseries: "Di base"
      currentseries: "Corrente"
      baselineavg: "Media di base"
      currentavg: "Media corrente"
      topicItem:
        nameLevel: " - Livello "
      topicsHeader: "Argomenti"

  search:
    closex: 'X'

  knowledgeGaugeChart:
    loadingData: "Caricamento dati..."
