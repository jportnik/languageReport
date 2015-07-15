module.exports =
  application:
    newversion: "Cette application a été mise à jour. Désirez-vous relancer l'application maintenant?"

  # Flash messages
  flash:
    serviceDown: "Temporairement hors service. Veuillez réessayer sous peu."
    invalidLogin: "Nom d'utilisateur ou mot de passe invalide."
    sessionCompleted: "Vous avez complété vos activités. À demain!"
    infoMissing: "Certaines informations du formulaire sont manquantes ou incorrectes."
    userSuspended: "Cet utilisateur a été suspendu. Veuillez communiquer avec votre administrateur."
    sessionExpired: "Votre session est expirée. Veuillez ouvrir une nouvelle session."
    lockedOut: "Votre compte a été verrouillé. Veuillez essayer à nouveau dans 15 minutes."
    noInternet: "Pas de connexion Internet."

  login:
    username: "Nom d'utilisateur"
    password: "Mot de passe"
    greeting: "Bonjour!"
    loginbtn: "Ouvrir une session"
    forgotpassword: "Mot de passe oublié?"
    signin: "Ouvrez une session pour commencer"
    disclaimer: ""
    resetapp: "Changer le code d'activation"
    invalidCredentials: "Nom d'utilisateur ou mot de passe invalide."

  metrics:
    graduates:
      title: "Diplômés"
      meta: "7 derniers jours"
      graduated: "Réussi"
      congratulations:
        error: "Une erreur est survenue lors de l'envoi des félicitations à l'utilisateur! Veuillez réessayer!"
        success: "Félicitations envoyées!"
    knowledgeGrowth:
      title: "Sommaire des matières"
      meta: "Accroissement des connaissances"
    needsCoaching:
      title: "Besoin d'encadrement"
      meta: "Toujours sous la barre des 50%"
      list:
        meta: "matières"
      profile:
        topHeader: "Besoin d'encadrement"
        restHeader: "Matières"
    nonParticipants:
      title: "Non-participants"
      meta: "7 derniers jours"
      list:
        metaDayCount: '<%- dayCount %> jour(s)'
        metaNeverLoggedIn: "Jamais inscrit"
    prizeWinners:
      title: "Gagnants de prix"
      meta: "7 derniers jours"
      bought: "Acheté"
      won: "Gagné"
      congratulations:
        error: "Une erreur est survenue lors de l'envoi des félicitations à l'utilisateur. Veuillez réessayer."
        success: "Félicitations envoyées!"
    teamAverage:
      title: "Moyenne de l'équipe"
    topicExperts:
      title: "Experts"
      meta: "Diplômé avec plus de 90%, haut degré de confiance"
      list:
        meta:"matières"
      profile:
        topHeader: "Expert dans ces matières"
        restHeader: "Matières"
    topPerformers:
      title: 'Meilleurs résultats'
      meta: 'La plupart des points de récompense accumulés dernière 30 jours'
    teamSize:
      title: 'Taille de l\'équipe:'

  models:
    filter:
      all: "Mon équipe"

  messages:
    toGroupHeaderTitle: "Message à l'équipe"
    toGroupLabel: "À :"
    toUserHeaderTitle: "Message"
    toUserLabel: "À :"
    defaultFilter: "Mon équipe"
    camera:"appareil photo"
    album:"album"
    fieldsEmpty: "Veuillez sélectionner une image ou écrire du texte."
    selectFilterTitle: "Filtres"
    messagePlaceHolder: "Tapez votre message ici..."
    messageSent: "Message envoyé"
    send: "Envoyer"
    cancel: "Annuler"
    error:
      fileUpload: "Erreur lors du téléchargement du fichier"
      fileTooBig: "Erreur : Taille de fichier trop grande!  La taille du fichier doit être inférieure à 5 Mo."
      sendMessage: "Erreur lors de l'envoi du message"
    templates:
      userKnowledgeMessageTemplate: "Continuez!"
      userGraduated: """
        Bonjour <%= name %>,

        Excellent travail, vous êtes diplômé en <%- topicName %>!

        Beau travail,
        <%= managerName %>
      """
      userWonPrize: """
        Bonjour <%= name %>,

        Bravo, vous avez remporté le <%= prizeName %>

        Beau travail,
        <%= managerName %>
      """

  menu:
    metrics: "Paramètres"
    teamMessage: "Message à l'équipe"
    people: "Participants"
    logout: "Fermer la session"


  mixins:
    loadingrow: "Téléchargement en cours..."
    emptyrow: "Aucune donnée disponible"

  people:
    list:
      searchplaceholder: "Trouver une personne"
    profile:
      baselineseries: "Référence"
      currentseries: "Actuelle"
      baselineavg: "Référence moyenne"
      currentavg: "Moyenne actuelle"
      topicItem:
        nameLevel: " - Niveau"
      topicsHeader: "Matières"

  search:
    closex: "X"

  knowledgeGaugeChart:
    loadingData: "Téléchargement des données..."
