module.exports =
  application:
    newversion:"应用程序已更新。是否立即重新加载？"

  # Flash messages
  flash:
    serviceDown:"服务中止。请稍后重试。"
    invalidLogin:"用户名或密码无效。"
    sessionCompleted:"您已经完成活动。明天回来检查！"
    infoMissing:"表格中有些信息缺少或不正确。"
    userSuspended:"该用户目前被暂停。请联系管理员获得帮助。"
    sessionExpired:"您的会话已经过期。请重新登录。"
    lockedOut:"您已经被锁定。请在15分钟内重试."
    noInternet:"无网络连接。"

  login:
    username:"用户名"
    password:"密码"
    greeting:"您好，"
    loginbtn:"登录"
    forgotpassword:"忘记密码？"
    signin:"登录开始"
    disclaimer: ""
    resetapp:"更改激活码"
    invalidCredentials:"用户名或密码无效。"

  metrics:
    graduates:
      title:'毕业生'
      meta:'最后7天'
      graduated:'已毕业'
      congratulations:
        error:'发送恭喜至用户错误！请重试！'
        success:'恭喜已发送！'
    knowledgeGrowth:
      title:'科目总结'
      meta:'知识增长'
    needsCoaching:
      title:'需要指导'
      meta:'一直在50%以下'
      list:
        meta: '科目'
      profile:
        topHeader:'需要指导'
        restHeader:'科目'
    nonParticipants:
      title:'非参与者'
      meta:'最后7天'
      list:
        metaDayCount: '<%- dayCount %> 天'
        metaNeverLoggedIn:'从未登录'
    prizeWinners:
      title:'获奖者'
      meta:'最后7天'
      bought:'已购'
      won:'赢得'
      congratulations:
        error:'发送恭喜至用户错误！请重试！'
        success:'恭喜已发送！'
    teamAverage:
      title:'团队平均'
    topicExperts:
      title:'专家'
      meta:'毕业生超过90％，高可信度'
      list:
        meta:'科目'
      profile:
        topHeader:'专家科目'
        restHeader:'科目'
    topPerformers:
      title: '成绩最佳者'
      meta: '大多数的奖励积分赚最近30天'
    teamSize:
      title: '团队规模:'

  models:
    filter:
      all:'我的团队'

  messages:
    toGroupHeaderTitle:"团队信息"
    toGroupLabel:"收件人："
    toUserHeaderTitle:"信息"
    toUserLabel:"收件人："
    defaultFilter:'我的团队'
    camera: "相机"
    album: "相册"
    fieldsEmpty:"请选择一个图像或写一些文字。"
    selectFilterTitle:"过滤器"
    messagePlaceHolder:"在此开始输入信息..."
    messageSent:"信息已发送"
    send:"发送"
    cancel:"取消"
    error:
      fileUpload:"上传文件错误"
      fileTooBig:"错误：文件太大！必须小于5MB。"
      sendMessage:"发送信息错误"
    templates:
      userKnowledgeMessageTemplate:"坚持"
      userGraduated: """
        嘿<%= name %>,

        <%- topicName %>过关，干得好!

        干的漂亮,
        <%= managerName %>
      """
      userWonPrize: """
        嘿 <%= name %>,

        恭喜赢得 <%= prizeName %>

        干得漂亮,
        <%= managerName %>
      """

  menu:
    metrics:"指标"
    teamMessage:"团队信息"
    people:"人员"
    logout:"注销"

  mixins:
    loadingrow:"正在加载..."
    emptyrow:"无可用数据"

  people:
    list:
      searchplaceholder:"找到一人"
    profile:
      baselineseries:"基线"
      currentseries:"目前"
      baselineavg:"基线平均"
      currentavg:"目前平均"
      topicItem:
        nameLevel: " – 级别"
      topicsHeader:"科目"

  search:
    closex:'X'

  knowledgeGaugeChart:
    loadingData:'正在加载数据...'
