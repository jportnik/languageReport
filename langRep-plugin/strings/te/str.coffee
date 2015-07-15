module.exports =
  application:
    newversion: "దరఖాస్తు నవీకరించబడింది. ఇప్పుడు మీరు రీలోడ్ చేయదలిచారా?"

  # Flash messages
  flash:
    serviceDown: "సేవ అందుబాటులో లేదు. కొద్దిసేపట్లో మళ్ళీ ప్రయత్నించండి."
    invalidLogin: "చెల్లని యూజర్నేమ్ లేదా పాస్వర్డ్."
    sessionCompleted: "మీ కార్యకలాపాలను మీరు పూర్తిచేశారు. రేపు మరలా సరిచూసుకోండి!"
    infoMissing: "పత్రములోని కొంత సమాచారము కనిపించడంలేదు లేదా తప్పుగా ఉంది."
    userSuspended: "వినియోగదారుడు ప్రస్తుతము తొలగించబడినారు (తాత్కాలికంగా). సహాయం కోసం దయచేసి మీ పరిపాలనాధికారిని సంప్రదించండి."
    sessionExpired: "మీ సమావే కాలము గడువు తీరింది. దయచేసి మళ్ళీ లాగ్ ఇన్ కండి."
    lockedOut: " మీ ఖాతా మూసివేయబడినది దయచేసి మళ్ళీ15 నిమిషాలలో ప్రయత్నించండి ."
    noInternet: "అంతర్జాలం సందానించబడి లేదు."

  login:
    username: "యూజర్నేమ్"
    password: "పాస్వర్డ్"
    greeting: "హాయ్ ఎవరక్కడ,"
    loginbtn: "లాగ్ అవండి "
    forgotpassword: "మీ పాస్వర్డ్ మర్చిపోయారా?"
    signin: "ప్రారంభించేందుకు సైన్ ఇన్ చేయండి"
    disclaimer: ""
    resetapp: "యాక్టివేషన్ కోడ్ను మార్చండి"
    invalidCredentials: "చెల్లని యూజర్నేమ్ లేదా పాస్వర్డ్."

  metrics:
    graduates:
      title: 'పట్టభద్రులు'
      meta: 'చివరి 7 రోజులు'
      graduated: 'పట్టభద్రులైన'
      congratulations:
        error: 'వినియోగదారునకు శుభాకాంక్షలు పంపడంలో పొరపాటు! మళ్ళీ ప్రయత్నించండి!'
        success: 'శుభాకాంక్షలు పంపబడినాయి!'
    knowledgeGrowth:
      title: 'విషయ సారాంశము'
      meta: 'జ్ఞానము పెరుగుదల'
    needsCoaching:
      title: 'శిక్షణ అవసరము'
      meta: '50% లోపల నిలకడగా'
      list:
        meta: ' విషయములు'
      profile:
        topHeader: 'శిక్షణ అవసరము'
        restHeader: 'విషయములు'
    nonParticipants:
      title: 'పాల్గొనని-వ్యక్తులు'
      meta: 'చివరి 7 రోజులు'
      list:
        metaDayCount: '<%- dayCount %> రోజులు'
        metaNeverLoggedIn: 'ఎన్నడూ సైన్-ఇన్ చేయలేదు'
    prizeWinners:
      title: 'బహుమతి విజేతలు'
      meta: 'చివరి 7 రోజులు'
      bought: 'కొన్నారు'
      won: 'గెలిచారు'
      congratulations:
        error: 'వినియోగదారునకు శుభాకాంక్షలు పంపడంలో పొరపాటు. మళ్ళీ ప్రయత్నించండి.'
        success: 'శుభాకాంక్షలు పంపబడినాయి!'
    teamAverage:
      title: 'బృందము సగటు'
    topicExperts:
      title: 'నిపుణులు'
      meta: '90% పైన పట్టభద్రులు, అధిక ఆత్మవిశ్వాసము'
      list:
        meta:' విషయములు'
      profile:
        topHeader: 'నైపుణ్య విషయములు'
        restHeader: 'విషయములు'
    topPerformers:
      title: 'అత్యుత్తమంగా చేసినవారు'
      meta: 'చాలా బహుమతి పాయింట్లు 30 రోజులు సంపాదించారు'
    teamSize:
      title: 'బృందం పరిమాణాన్ని:'

  models:
    filter:
      all: "నా బృందము"

  messages:
    toGroupHeaderTitle: "బృందము సందేశము"
    toGroupLabel: "కు:"
    toUserHeaderTitle: "సందేశము"
    toUserLabel: "కు:"
    defaultFilter: "నా బృందము"
    camera: " ఛాయా గ్రాహకం "
    album: " సేకరణ పుస్తకం"
    fieldsEmpty: "దయచేసి ఒక చిత్రమును ఎంచుకోండి లేదా కొంత టెక్స్ట్ను వ్రాయండి."
    selectFilterTitle: " సమాచార వడపోతలు"
    messagePlaceHolder: "మీ సందేశమును ఇక్కడ ముద్రించడం ప్రారంభించండి..."
    messageSent: "సందేశము పంపబడింది"
    send: "పంపండి"
    cancel: "రద్దు"
    error:
      fileUpload: "ఫైలు అప్లోడింగ్ పొరపాటు"
      fileTooBig: "పొరపాటు: ఫైలు పరిమాణము చాలా పెద్దది!  అది 5యంబి కంటే తక్కువ ఉండి తీరాలి."
      sendMessage: "సందేశము పంపడంలో పొరపాటు"
    templates:
      userKnowledgeMessageTemplate: "బాగుంది కొనసాగించు!"
      userGraduated: """
        ఏయ్ <%= name %>,

        గొప్ప పని ఉత్తీర్నుడు అయినప్పుడు <%- topicName %>!

        మంచి పని,
        <%= managerName %>
      """
      userWonPrize: """
        ఏయ్ <%= name %>,

        గెల్చినందుకు శుభాకాంక్షలు <%= prizeName %>

        మంచి పని,
        <%= managerName %>
      """

  menu:
    metrics: "కొలమానాలు"
    teamMessage: "బృందము సందేశము"
    people: "ప్రజలు"
    logout: "లాగౌట్"

  mixins:
    loadingrow: "లోడింగ్..."
    emptyrow: "ఏ డేటా అందుబాటులో లేదు"

  people:
    list:
      searchplaceholder: "వ్యక్తిని కనుగొను"
    profile:
      baselineseries: "ఆధారరేఖ"
      currentseries: "ప్రస్తుత"
      baselineavg: "ఆధారరేఖ సగటు"
      currentavg: "ప్రస్తుత సగటు"
      topicItem:
        nameLevel: " - స్థాయి "
      topicsHeader: "విషయములు"

  search:
    closex: 'ఎక్స్'

  knowledgeGaugeChart:
    loadingData: 'డేటా లోడింగ్...'
