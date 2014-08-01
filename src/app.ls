{ div, textarea, h1, h3, button } = React.DOM


Header = React.createClass do
  displayName: 'Header',
  render: -> h1 {}, '正元體產生器'

Converter = React.createClass do
  displayName: 'Content'
  getInitialState: ->
    value = '前途一片光明，我允許你走進我的世界，女孩富著養，沒有錢，生，在於蠢的無怨無悔，時間久了才能讓人看出來。腸胃炎變多，水手官網專訪，連假濕冷相隨，聯想控股董事長柳傳志，賈欣惠400萬婚宴，捐發票做公益，馬英九金門路跑，蔡英文未來動向，全國政協十一屆五次會議開幕，Jeremy爆冷奪冠，捐發票做公益，系列手機，一日3杯咖啡，胖不是福！流感病毒攻心，新人娶諧音2014520，趙啟正：深化改革的時機到了，租車旅遊被撞該誰賠？比例非常高，就要找一群人去寫，也不論是科技、內需或傳統，它是中央主管機關，你仔細看未來的發展就知道了，您真的深入到深山裡頭非常偏遠、非常辛苦的地方，也要有人把關，中華民國是我們的國家，原本不應由中央付錢，生物科技、觀光旅遊、醫療照護、綠色能源……現在重新思考過以後，這也不對！你天天換，誠信絕對不是一種銷售，可能一個人說你不服氣，承擔責任的時候，一個成功的創業者，跟60年代的人競爭，沒有一個良好的過程，不是所有，以後是想得可以很大，永遠把別人對你的批評記在心裡，這世界上沒有優秀的理念，可能一個人說你不服氣，是制度，創業要找最適合的人，什麼是團隊呢？你應該做的不是去挑戰它，沒有業務稱為小白兔，小公司的戰略就是兩個詞：活下來，要找風險投資的時候，做戰略最忌諱的是面面俱到，結果還很遙遠，眼光、胸懷和實力。'
    return do
      normalValue: value
      cyValue: @convertToCYstyle value
  convertToCYstyle: ->
    value = it
    #value .= replace /說/g, (,word) -> "#{word}："
    value .= replace /，/g, '\n'
    value .= replace /(：)/g, (,symbol) -> "#{symbol}\n\n"
    value .= replace /[。|！|？]/g, '\n\n'
  convertFromCYstyle: ->
    value = it
    value .= replace /(說)\n/g, (,word)-> "#{word}：\n"
    value .= replace /(！|？|：|。|，|!)\n+/g, (,symbol) -> symbol
    value .= replace /\n\n/g, '。'
    value .= replace /\n/g, '，'
    value += '。' if !value.match /[！|？|。]$/
    value
  handleChange: (event) ->
    normal = document.getElementById 'normalStyle'
    cy = document.getElementById 'cyStyle'
    if event.target is normal
      @setState normalValue: normal.value
      @setState cyValue: @convertToCYstyle normal.value
    else
      @setState normalValue: @convertFromCYstyle cy.value
      @setState cyValue: cy.value
  render: -> div {className: 'wrapper'},
    div {className: 'left-panel'}, h3({}, '普通體'),
    textarea { id: 'normalStyle', value: @state.normalValue, onChange: @handleChange }
    div {className: 'right-panel'}, h3({}, '正元體'),
    textarea { id: 'cyStyle', value: @state.cyValue, onChange: @handleChange  }

App = React.createClass do
  displayName: 'App'
  render: -> div {}, Header!, Converter!

React.renderComponent App!, document.body