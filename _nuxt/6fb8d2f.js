(window.webpackJsonp=window.webpackJsonp||[]).push([[15],{431:function(t,e,o){var content=o(464);content.__esModule&&(content=content.default),"string"==typeof content&&(content=[[t.i,content,""]]),content.locals&&(t.exports=content.locals);(0,o(7).default)("833986ca",content,!0,{sourceMap:!1})},462:function(t,e,o){"use strict";e.__esModule=!0;var n=o(44);var d=function(){function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t)}return t.prototype.beforeEnter=function(t){(0,n.addClass)(t,"collapse-transition"),t.dataset||(t.dataset={}),t.dataset.oldPaddingTop=t.style.paddingTop,t.dataset.oldPaddingBottom=t.style.paddingBottom,t.style.height="0",t.style.paddingTop=0,t.style.paddingBottom=0},t.prototype.enter=function(t){t.dataset.oldOverflow=t.style.overflow,0!==t.scrollHeight?(t.style.height=t.scrollHeight+"px",t.style.paddingTop=t.dataset.oldPaddingTop,t.style.paddingBottom=t.dataset.oldPaddingBottom):(t.style.height="",t.style.paddingTop=t.dataset.oldPaddingTop,t.style.paddingBottom=t.dataset.oldPaddingBottom),t.style.overflow="hidden"},t.prototype.afterEnter=function(t){(0,n.removeClass)(t,"collapse-transition"),t.style.height="",t.style.overflow=t.dataset.oldOverflow},t.prototype.beforeLeave=function(t){t.dataset||(t.dataset={}),t.dataset.oldPaddingTop=t.style.paddingTop,t.dataset.oldPaddingBottom=t.style.paddingBottom,t.dataset.oldOverflow=t.style.overflow,t.style.height=t.scrollHeight+"px",t.style.overflow="hidden"},t.prototype.leave=function(t){0!==t.scrollHeight&&((0,n.addClass)(t,"collapse-transition"),t.style.height=0,t.style.paddingTop=0,t.style.paddingBottom=0)},t.prototype.afterLeave=function(t){(0,n.removeClass)(t,"collapse-transition"),t.style.height="",t.style.overflow=t.dataset.oldOverflow,t.style.paddingTop=t.dataset.oldPaddingTop,t.style.paddingBottom=t.dataset.oldPaddingBottom},t}();e.default={name:"ElCollapseTransition",functional:!0,render:function(t,e){var o=e.children;return t("transition",{on:new d},o)}}},463:function(t,e,o){"use strict";o(431)},464:function(t,e,o){var n=o(6),d=o(172),r=o(465),l=n(!1),c=d(r);l.push([t.i,".whois_all[data-v-be213924]{position:relative}.num-embellish[data-v-be213924]{position:absolute;left:0;top:0;z-index:-1}.num-embellish i[data-v-be213924]{display:inline-block;width:42px;height:70px}.num-embellish .num-0[data-v-be213924]{background-position:0 0}.num-embellish .num-1[data-v-be213924]{background-position:0 -101px}.num-embellish .num-2[data-v-be213924]{background-position:0 -200px}.num-embellish .num-3[data-v-be213924]{background-position:0 -300px}.num-embellish .num-4[data-v-be213924]{background-position:0 -400px}.num-embellish .num-5[data-v-be213924]{background-position:0 -500px}.num-embellish .num-6[data-v-be213924]{background-position:0 -600px}.num-embellish .num-7[data-v-be213924]{background-position:0 -700px}.num-embellish .num-8[data-v-be213924]{background-position:0 -800px}.num-embellish .num-9[data-v-be213924]{background-position:0 -900px}@media (min-width:993px){.whois_search[data-v-be213924]{width:100%;height:180px;background-size:cover;position:relative}.whois_search_position[data-v-be213924]{position:absolute;left:50%;top:50%;transform:translate(-50%,-50%);text-align:center;width:740px}.whois_search_title[data-v-be213924]{font-size:58px;color:#ffc62f}.whois_search_p[data-v-be213924]{font-size:16px;color:#333}.whois_search_div[data-v-be213924]{width:100%;margin:0 auto;overflow:hidden;border-radius:5px}.whois_search_input[data-v-be213924]{padding:.375rem 1.75rem;float:left;width:70%;height:50px;line-height:50px;font-size:16px;box-shadow:inset 0 2px 3px rgba(0,0,0,.08);border-radius:0}.whois_search_button[data-v-be213924]{float:left;width:30%;height:50px;line-height:46px;border-radius:0;background:#506cd2;color:#fff;border:none;font-size:20px;cursor:pointer}.whois_search_button[data-v-be213924]:hover{background:#5971c7}.whois-box[data-v-be213924]{max-width:1380px;margin:0 auto;padding:80px 0 260px}.whois-introduce[data-v-be213924]{overflow:hidden}.whois-width[data-v-be213924]{width:330px;margin:0 auto;position:relative}.whois-width p[data-v-be213924]{color:#535353}.whois-introduce li[data-v-be213924]{position:relative;float:left;width:33.333%;margin:20px 0}.whois-introduce li h3[data-v-be213924]{font-size:22px;position:relative;z-index:1;padding-top:40px;font-weight:700}.whois-introduce li p[data-v-be213924]{width:330px;font-size:14px;color:#666;position:relative;z-index:1}}@media (max-width:992px){.whois_search[data-v-be213924]{height:180px;background-size:cover;position:relative;width:100%}.whois_search_position[data-v-be213924]{position:absolute;left:50%;top:55%;transform:translate(-50%,-50%);text-align:center;width:90%;margin:0 auto}.whois_search_title[data-v-be213924]{font-size:24px;color:#ffc62f}.whois_search_p[data-v-be213924]{font-size:14px;color:#333}.whois_search_div[data-v-be213924]{width:80vw;margin:0 auto;overflow:hidden}.whois_search_input[data-v-be213924]{padding:.375rem 1.75rem;float:left;width:100%;height:40px;line-height:50px;font-size:16px;box-shadow:inset 0 2px 3px rgba(0,0,0,.08);border-radius:5px}.whois_search_button[data-v-be213924]{width:36%;height:40px;line-height:36px;border-radius:0;background:#506cd2;color:#fff;border:none;font-size:14px;cursor:pointer;margin:20px auto 0;border-radius:5px}.whois_search_button[data-v-be213924]:hover{background:#5971c7}.whois-box[data-v-be213924]{padding:60px 0 22vh}.whois-introduce[data-v-be213924]{overflow:hidden}.whois-width[data-v-be213924]{width:330px;margin:0 auto;position:relative}.whois-width p[data-v-be213924]{color:#535353}.whois-introduce li[data-v-be213924]{width:100%;margin:0;font-size:14px;padding-bottom:20px}.whois-introduce li h3[data-v-be213924]{font-size:18px;padding:0}.whois-introduce li p[data-v-be213924]{font-size:14px;width:100%}}.wrap_touzi[data-v-be213924]{width:320px;margin:0 auto;padding:10px;position:relative;display:flex;align-items:center;justify-content:center;flex-wrap:wrap}.dice[data-v-be213924]{margin:5px;width:90px;height:90px;background:url("+c+") no-repeat;cursor:pointer}.dice_1[data-v-be213924]{background-position:-5px -4px}.dice_2[data-v-be213924]{background-position:-5px -107px}.dice_3[data-v-be213924]{background-position:-5px -212px}.dice_4[data-v-be213924]{background-position:-5px -317px}.dice_5[data-v-be213924]{background-position:-5px -427px}.dice_6[data-v-be213924]{background-position:-5px -535px}.dice_t[data-v-be213924]{background-position:-5px -651px}.dice_s[data-v-be213924]{background-position:-5px -763px}.dice_e[data-v-be213924]{background-position:-5px -876px}p#result[data-v-be213924]{text-align:center;font-size:16px}p#result span[data-v-be213924]{font-weight:700;color:#f30;margin:6px}#dice_mask[data-v-be213924]{display:flex;align-items:center;justify-content:center;width:100%;height:100%;background:#fff;opacity:.98;position:absolute;top:0;left:0;z-index:999;border-bottom:1px solid #333}",""]),t.exports=l},465:function(t,e,o){t.exports=o.p+"img/dice.3f569d7.png"},481:function(t,e,o){"use strict";o.r(e);o(171),o(8);var n=o(88),d=o.n(n),r=(o(17),o(462)),l=o.n(r);o(0).default.component(l.a.name,l.a);var c={components:{},data:function(){return{touziNumber:"",touziNumberArray:[{label:"5个",value:5},{label:"6个",value:6},{label:"7个",value:7},{label:"8个",value:8},{label:"9个",value:9}],showMsak:!0,openDialog:!1,touziArray:[],showMsakText:"随机"}},computed:{},mounted:function(){},methods:{openMask:function(){this.showMsak=!1},closeMask:function(){this.showMsak=!0},startGame:function(t){if(t<=9&&t>=5){this.touziArray=[];for(var i=0;i<t;i++)this.touziArray.push(i);this.openDialog=!0}else d.a.error("错了哦")},ckickSuiji:function(){this.showMsak=!0,this.showMsakText="随机";for(var i=0;i<this.touziNumber;i++)this.touziSelect(i,0)},ckickDuoyi:function(){this.showMsak=!0,this.showMsakText="多一";for(var i=0;i<this.touziNumber;i++)this.touziSelect(i,1)},touziSelect:function(i,t){var e=$("#dice"+i);e.attr("class","dice");var o=Math.floor(6*Math.random()+1);1==t&&i<this.touziNumber/2&&(o=1),e.animate({left:"+2px"},100,(function(){e.addClass("dice_t")})).delay(200).animate({top:"-2px"},100,(function(){e.removeClass("dice_t").addClass("dice_s")})).delay(200).animate({opacity:"show"},600,(function(){e.removeClass("dice_s").addClass("dice_e")})).delay(100).animate({left:"-2px",top:"2px"},100,(function(){e.removeClass("dice_e").addClass("dice_"+o)}))}}},h=(o(463),o(26)),component=Object(h.a)(c,(function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"whois_all"},[t._m(0),t._v(" "),o("div",{staticClass:"whois_search"},[o("div",{staticClass:"whois_search_position"},[o("p",{staticClass:"whois_search_p"},[t._v("\n        骰子数量\n      ")]),t._v(" "),o("div",{staticClass:"whois_search_div"},[o("el-select",{attrs:{placeholder:"请选择骰子数量"},model:{value:t.touziNumber,callback:function(e){t.touziNumber=e},expression:"touziNumber"}},t._l(t.touziNumberArray,(function(t){return o("el-option",{key:t.value,attrs:{label:t.label,value:t.value}})})),1),t._v(" "),o("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.startGame(t.touziNumber)}}},[t._v("开始游戏")])],1)])]),t._v(" "),o("el-dialog",{attrs:{title:"骰子游戏",visible:t.openDialog,fullscreen:!0,center:!0},on:{"update:visible":function(e){t.openDialog=e}}},[o("div",{staticClass:"wrap_touzi"},[o("el-collapse-transition",[o("div",{directives:[{name:"show",rawName:"v-show",value:t.showMsak,expression:"showMsak"}],attrs:{id:"dice_mask"}},[o("el-tag",{directives:[{name:"show",rawName:"v-show",value:t.showMsak,expression:"showMsak"}]},[t._v(t._s(t.showMsakText))])],1)]),t._v(" "),t._l(t.touziArray,(function(t){return o("div",{class:"dice dice_"+(t+1),attrs:{id:"dice"+t}})}))],2),t._v(" "),o("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[o("el-button",{attrs:{type:"primary",round:""},on:{click:function(e){return t.ckickSuiji()}}},[t._v("随机")]),t._v(" "),t.showMsak?o("el-button",{attrs:{type:"success",circle:""},on:{click:function(e){return t.openMask()}}},[t._v("开")]):t._e(),t._v(" "),t.showMsak?t._e():o("el-button",{attrs:{type:"warning",circle:""},on:{click:function(e){return t.closeMask()}}},[t._v("关")]),t._v(" "),o("el-button",{attrs:{type:"danger",round:""},on:{click:function(e){return t.ckickDuoyi()}}},[t._v("多一")])],1)])],1)}),[function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("section",{staticClass:"banner-area relative",attrs:{id:"home"}},[o("div",{staticClass:"overlay overlay-bg"}),t._v(" "),o("div",{staticClass:"container"},[o("div",{staticClass:"row d-flex align-items-center justify-content-center"},[o("div",{staticClass:"about-content col-lg-12"},[o("h1",{staticClass:"text-white"},[t._v("\n            骰子游戏\n          ")]),t._v(" "),o("p",{staticClass:"text-white link-nav"},[o("a",{attrs:{href:"/"}},[t._v("首页 ")]),t._v(" "),o("span",{staticClass:"lnr lnr-arrow-right"}),t._v(" "),o("a",{attrs:{href:""}})])])])])])}],!1,null,"be213924",null);e.default=component.exports}}]);