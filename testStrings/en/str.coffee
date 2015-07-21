module.exports =
  application:
    newversion: "The application has been updated. Would you like to reload now?"

  # Flash messages
  flash:
    serviceDown: "Service is down. Try again shortly."
    invalidLogin: "Invalid username or password."
    sessionCompleted: "You have completed your activities. Check back tomorrow!"
    infoMissing: "Some information in the form is missing or incorrect."
    userSuspended: "The user is currently suspended. Please contact your administrator for assistance."
    sessionExpired: "Your session has expired. Please log in again."
    lockedOut: "You have been locked out. Please try again in 15 minutes."
    noInternet: "No Internet connection."
    could_not_open_popup: "The app could not open a pop up with the screenshot, most likely because pop ups have been blocked by the browser. Please disable pop up blocking to retrieve your screenshot."

  layout:
    poweredby: "Powered by: Axonify"

  filter:
    public: "Public Filters"
    mine: "My Filters"
    group: "Group Filters"

  login:
    username: "Username"
    password: "Password"
    greeting: "Hi there,"
    loginmsg: "Log in to check your team's progress"
    loginbtn: "Login"
    forgotpassword: "Forgot your password?"
    signin: "Sign In to Start"
    disclaimer: ""
    resetapp: "Change Activation Code"
    invalidCredentials: "Invalid username or password."
    withOAuthProvider: "Login with <%- oauthProvider %>"
    helpEmailAndPhone: "For support contact <%= helpEmail %> or <%= helpPhone %>"
    helpEmailOrPhone: "For support contact <%= helpEmailOrPhone %>"

  loginError:
    code:
      9005: 'Your username was not found in the system. Please contact your administrator for help.'
      9006: 'The system received an unknown response. Please report this error to your administrator.'
    genericError: 'The system encountered a communication error. Please report this error to your administrator.'
    header: 'Oops...'
    reloadButton: 'Reload the page'

  metrics:
    valueOfCount: "<%- value %><span> of </span><%- count %>"
    sortableHeaders:
      user: 'User'
      average: 'Average'
      topic: 'Topic'
      knowledgeGrowth: 'Knowledge Growth'
      lastLogin: 'Last Login'
      rewardPoints: 'Reward Points'
      topics: 'Topics'
      userCount: 'User Count'
    graduates:
      title: 'Graduates'
      meta: 'Last 7 Days'
      graduated: 'Graduated'
      listTitle:
        noUsers: 'There have been no graduates in the last 7 days'
        oneUser: "<%- value %> graduate in the last 7 days"
        multipleUsers: "<%- value %> graduates in the last 7 days"
      congratulations:
        error: 'Error sending congratulations to user! Try again!'
        success: 'Congratulations sent!'
    knowledgeGrowth:
      title: 'Topic Performance'
      meta: 'Knowledge Growth'
    needsCoaching:
      title: 'Needs Coaching'
      meta: 'Users Consistently Under 50%'
      list:
        plural: '<%- count %> topics'
        single: '<%- count %> topic'
      profile:
        topHeader: 'Needs Coaching'
        restHeader: 'Topics'
      listTitle:
        noUsers: 'No users need coaching.'
        oneUser: 'There is 1 of <%- count %> users that need coaching.'
        multipleUsers: 'There are <%- value %> of <%- count %> users that needs coaching.'
    overconfident:
      title: 'Overconfident'
      meta: 'Users Under 40%, High Confidence'
      list:
        plural: '<%- count %> topics'
        single: '<%- count %> topic'
      profile:
        topHeader: 'Overconfident'
      listTitle:
        noUsers: 'No overconfident users.'
        oneUser: 'There is 1 of <%- count %> users that are overconfident.'
        multipleUsers: 'There are <%- value %> of <%- count %> overconfident users.'
    underconfident:
      title: 'Underconfident'
      meta: 'Users Over 90%, Low Confidence'
      list:
        plural: '<%- count %> topics'
        single: '<%- count %> topic'
      profile:
        topHeader: 'Underconfident'
      listTitle:
        noUsers: 'No underconfident users.'
        oneUser: 'There is 1 of <%- count %> users that are underconfident.'
        multipleUsers: 'There are <%- value %> of <%- count %> underconfident users.'
    nonParticipants:
      title: 'Non-Participants'
      meta: 'Last 7 Days'
      list:
        metaDayCount: '<%- dayCount %> days'
        metaNeverLoggedIn: 'Never signed-in'
      listTitle:
        noUsers: 'All users have participated in the last 7 days.'
        oneUser: 'There is 1 of <%- count %> users that have not participated in the last 7 days.'
        multipleUsers: 'There are <%- value %> of <%- count %> users that have not participated in the last 7 days.'
    prizeWinners:
      title: 'Prize Winners'
      meta: 'Last 7 Days'
      bought: 'Bought'
      won: 'Won'
      countEmpty: 'There have been no prize winners in the last 7 days'
      count: "<%- value %> prize winners in the last 7 days"
      congratulations:
        error: 'Error sending congratulations to user. Try again.'
        success: 'Congratulations sent!'
    teamAverage:
      title: 'Team Average'
    topicExperts:
      title: 'Experts'
      meta: 'Graduates Over 90%, High Confidence'
      list:
        plural:'<%- count %> topics'
        single: '<%- count %> topic'
      profile:
        topHeader: 'Expert Topics'
        restHeader: 'Topics'
      listTitle:
        noUsers: 'All users are topic experts.'
        oneUser: 'There is 1 of <%- count %> user that is a topic expert.'
        multipleUsers: 'There are <%- value %> of <%- count %> users that are topic experts.'
    topPerformers:
      title: 'Top Performers'
      meta: 'Most Reward Points Earned Last 30 Days'
    overdueCertifications:
      title: 'Overdue Certifications'
      meta: 'Users Past Due'
      profile:
        topHeader: 'Overdue Certifications'
        restHeader: 'Topics'
      topics:
        listTitle:
          noUsers: 'No certification topics are overdue'
          oneUser: '1 certification topic is overdue'
          multipleUsers: '<%- value %> certification topics are overdue'
      topicUsers:
        listTitle:
          noUsers: 'No users have overdue certification'
          oneUser: '1 user has overdue certification'
          multipleUsers: '<%- value %> users have overdue certification'
    dueCertifications:
      title: 'Due Certifications'
      meta: 'Users Due This month'
      profile:
        topHeader: 'Due Certifications'
        restHeader: 'Topics'
      topics:
        listTitle:
          noUsers: 'No certification topics are due'
          oneUser: '1 certification topic is due'
          multipleUsers: '<%- value %> certification topics are due'
      topicUsers:
        listTitle:
          noUsers: 'No users have due certification'
          oneUser: '1 user has due certification'
          multipleUsers: '<%- value %> users have due certification'
    teamSize:
      title: 'Team Size:'
      meta: ''

  models:
    filter:
      all: "My Team"

  messages:
    toGroupHeaderTitle: "Team Message"
    toGroupLabel: "To:"
    toUserHeaderTitle: "Message"
    toUserLabel: "To:"
    defaultFilter: "My Team"
    camera: "camera"
    album: "album"
    fieldsEmpty: "Please select an image or write some text."
    selectFilterTitle: "Filters"
    messagePlaceHolder: "Start typing your message here..."
    messageSent: "Message Sent"
    send: "Send"
    cancel: "Cancel"
    error:
      fileUpload: "Error Uploading File"
      fileTooBig: "Error: File Size too Big!  It must less than 5MB."
      sendMessage: "Error Sending Message"
    templates:
      userGraduated: """
        Hey <%= name %>,

        Great work on graduating <%- topicName %>!

        Nice work,
        <%= managerName %>
      """
      userWonPrize: """
        Hey <%= name %>,

        Congratulations on winning the <%= prizeName %>

        Nice work,
        <%= managerName %>
      """

  menu:
    metrics: "Metrics"
    teamLink: 'TeamLink'
    teamMessage: "Team Message"
    people: "People"
    observations: 'Behaviors'
    training: "Training"
    admin: "Admin Console"
    reports: 'Reports'
    infoLink: "InfoLink"
    logout: "Logout"

  answer:
    title: 'Answer History for <%- topicName %> - <%- topicLevel %>'
    countSingle: "<%- answerCount %> answer"
    countMultiple: "<%- answerCount %> answers"
    correct: "Correct <%- answerDate %>"
    incorrect: "Incorrect <%- answerDate %>"

  mixins:
    loadingrow: "Loading..."
    emptyrow: "No data available"

  people:
    list:
      searchplaceholder: "Find a Person"
    profile:
      baselineseries: "Baseline"
      currentseries: "Current"
      baselineavg: "Baseline Average"
      currentavg: "Current Average"
      topicItem:
        certification:
          certified: 'Certified'
          due: 'Due'
          overdue: 'Overdue'
        nameLevel: "<%- topicName %> - Level <%- questionLevel %>"
      topicsHeader: "Topics"
      knowledgeMapChart:
        loadingData: 'Loading Data...'
        empty: 'There are no topics for this User'
        labels:
          currentAverage: 'Current Average (%)'
          confidence: 'Confidence'
          high: 'High'
          med: 'Med'
          low: 'Low'
        tooltip:
          level: 'Level <%- level %>'
          currentAverage: 'Current Average: <%- average %>%'
          confidenceIndex: 'Confidence Index: <%- confidence %>'
        series:
          beginner: 'Beginner'
          expert: 'Expert'
          graduated: 'Graduated'
          intermediate: 'Intermediate'
          needsCoaching: 'Needs Coaching'
          notStarted: 'Not Started'
          overconfident: 'Overconfident'
          underconfident: 'Underconfident'

  buttons:
    print: 'Print'
    export: 'Export'
    back: 'Back'

  search:
    closex: 'X'

  observations:
    title: 'Behaviors'
    defaultName: 'N/A'
    selectTeam: 'Select Team'
    buttons:
      new: 'New'
      print: 'Print Form'
      done: 'Done'
      cancel: 'Cancel'
    labels:
      observationForm: 'Behavior Form:'
      observer: 'Observer:'
      date: 'Date:'
      team: 'Team:'
      department: 'Department:'
      lineOfBusiness: 'Line of Business:'
      jobTitle: 'Job Title:'
    sortableHeaders:
      observedBehaviours: 'Observed Behaviors'
      total: 'Total'
      comments: 'Comments'
    comment:
      placeholder: 'Start typing comment here...'
    formValidations:
      typeRequired: 'Behavior Form required! They can be created in the Admin Console under Settings -> Behavior Forms.'
      observerRequired: 'Observer required!'
      locationRequired: 'Team required!'
    formComplete:
      success: 'Form Completed!'
      errors:
        3008: 'The form has been deleted in another browser instance, please create a new one.'
        3052: 'The form has already been completed, please create a new one.'
        3053: 'A form was already in progress, loading...'

  knowledgeGaugeChart:
    loadingData: 'Loading Data...'

  filterableSelector:
    emptyText: 'No options available'

  input:
    optional: '(Optional)'
