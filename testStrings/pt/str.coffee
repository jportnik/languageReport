module.exports =
  application:
    newversion: "O aplicativo foi atualizado. Deseja recarregá-lo agora?"

  # Flash messages
  flash:
    serviceDown: "Fora de serviço. Tente novamente em breve."
    invalidLogin: "Nome de usuário ou senha inválidos."
    sessionCompleted: "Você completou suas atividades. Verifique novamente amanhã!"
    infoMissing: "Informação no formulário faltando ou incorreta."
    userSuspended: "Usuário suspenso no momento. Favor contatar seu administrador para assistência."
    sessionExpired: "Sessão expirada. Faça o login novamente."
    lockedOut: "Você foi bloqueado. tente novamente em 15 minutos"
    noInternet: "Sem conexão de internet."

  login:
    username: "Nome do usuário"
    password: "Senha"
    greeting: "Olá,"
    loginbtn: "Login"
    forgotpassword: "Esqueceu sua senha?"
    signin: "Acesse para iniciar"
    disclaimer: ""
    resetapp: "Altere o código de ativação"
    invalidCredentials: "Nome de usuário ou senha inválidos."

  metrics:
    graduates:
      title: "Graduados"
      meta: "Últimos sete dias"
      graduated: "Graduado"
      congratulations:
        error: "Erro ao enviar mensagem de felicitações ao usuário! Tente novamente!"
        success: "Mensagem de felicitações enviada!"
    knowledgeGrowth:
      title: "Resumo do tópico"
      meta: "Aumento do conhecimento"
    needsCoaching:
      title: "Precisa de treinamento"
      meta: "Constantemente abaixo de 50%"
      list:
        meta: " tópicos"
      profile:
        topHeader: "Precisa de treinamento"
        restHeader: "Tópicos"
    nonParticipants:
      title: "Não participantes"
      meta: "Últimos sete dias"
      list:
        metaDayCount: "<%- dayCount %> dias"
        metaNeverLoggedIn: "Nunca se conectou"
    prizeWinners:
      title: "Vencedores do prêmio"
      meta: "Últimos sete dias"
      bought: "Comprado"
      won: "Vencido"
      congratulations:
        error: "Erro ao enviar mensagem de felicitações ao usuário. Tente novamente."
        success: "Mensagem de felicitações enviada!"
    teamAverage:
      title: "Média da equipe"
    topicExperts:
      title: "Especialistas"
      meta: "Graduados com mais de 90%, confiança elevada"
      list:
        meta:" tópicos"
      profile:
        topHeader: "Tópicos de especialistas"
        restHeader: "Tópicos"
    topPerformers:
      title: 'Melhores colocados'
      meta: 'A maioria dos pontos de recompensa ganhou dos últimos 30 dias'
    teamSize:
      title: 'Tamanho da equipe:'

  models:
    filter:
      all: "Minha equipe"

  messages:
    toGroupHeaderTitle: "Mensagem da equipe"
    toGroupLabel: "Para:"
    toUserHeaderTitle: "Mensagem"
    toUserLabel: "Para:"
    defaultFilter: "Minha equipe"
    camera: "câmera"
    album: "álbum"
    fieldsEmpty: "Selecione uma imagem ou digite um texto."
    selectFilterTitle: "Filtros"
    messagePlaceHolder: "Comece a digitar seu texto aqui..."
    messageSent: "Mensagem enviada"
    send: "Enviar"
    cancel: "Cancelar"
    error:
      fileUpload: "Erro ao carregar o arquivo"
      fileTooBig: "Erro: O arquivo é muito grande!  Ele deve ter menos de 5 MB."
      sendMessage: "Erro ao enviar mensagem"
    templates:
      userKnowledgeMessageTemplate: "Continue assim!"
      userGraduated: """
        Olá <%= name %>,

        Parabéns por se graduar <%- topicName %>!

        Bom trabalho,
        <%= managerName %>
      """
      userWonPrize: """
        Olá <%= name %>,

        Parabéns por ganhar o <%= prizeName %>

        Bom trabalho,
        <%= managerName %>
      """

  menu:
    metrics: "Métricas"
    teamMessage: "Mensagem da equipe"
    people: "Pessoas"
    logout: "Sair"

  mixins:
    loadingrow: "Carregando..."
    emptyrow: "Não há dados disponíveis"

  people:
    list:
      searchplaceholder: "Procurar uma pessoa"
    profile:
      baselineseries: "Parâmetro"
      currentseries: "Atual"
      baselineavg: "Média de parâmetro"
      currentavg: "Média atual"
      topicItem:
        nameLevel: " - Nível "
      topicsHeader: "Tópicos"

  search:
    closex: "X"

  knowledgeGaugeChart:
    loadingData: "Carregando dados..."
