(window.webpackJsonp=window.webpackJsonp||[]).push([[13],{392:function(t,o,e){t.exports=e.p+"img/num-embellish.909a95f.png"},410:function(t,o,e){var content=e(437);content.__esModule&&(content=content.default),"string"==typeof content&&(content=[[t.i,content,""]]),content.locals&&(t.exports=content.locals);(0,e(7).default)("a189b842",content,!0,{sourceMap:!1})},436:function(t,o,e){"use strict";e(410)},437:function(t,o,e){var n=e(6),r=e(169),d=e(392),l=n(!1),c=r(d);l.push([t.i,".whois_all[data-v-131a7818]{position:relative}.num-embellish[data-v-131a7818]{position:absolute;left:0;top:0;z-index:-1}.num-embellish i[data-v-131a7818]{background:url("+c+") no-repeat;display:inline-block;width:42px;height:70px}.num-embellish .num-0[data-v-131a7818]{background-position:0 0}.num-embellish .num-1[data-v-131a7818]{background-position:0 -101px}.num-embellish .num-2[data-v-131a7818]{background-position:0 -200px}.num-embellish .num-3[data-v-131a7818]{background-position:0 -300px}.num-embellish .num-4[data-v-131a7818]{background-position:0 -400px}.num-embellish .num-5[data-v-131a7818]{background-position:0 -500px}.num-embellish .num-6[data-v-131a7818]{background-position:0 -600px}.num-embellish .num-7[data-v-131a7818]{background-position:0 -700px}.num-embellish .num-8[data-v-131a7818]{background-position:0 -800px}.num-embellish .num-9[data-v-131a7818]{background-position:0 -900px}@media (min-width:993px){.whois_search[data-v-131a7818]{width:100%;height:180px;background-size:cover;position:relative}.whois_search_position[data-v-131a7818]{position:absolute;left:50%;top:50%;transform:translate(-50%,-50%);text-align:center;width:740px}.whois_search_title[data-v-131a7818]{font-size:58px;color:#ffc62f}.whois_search_p[data-v-131a7818]{font-size:16px;color:#333}.whois_search_div[data-v-131a7818]{width:100%;margin:0 auto;overflow:hidden;border-radius:5px}.whois_search_input[data-v-131a7818]{padding:.375rem 1.75rem;float:left;width:70%;height:50px;line-height:50px;font-size:16px;box-shadow:inset 0 2px 3px rgba(0,0,0,.08);border-radius:0}.whois_search_button[data-v-131a7818]{float:left;width:30%;height:50px;line-height:46px;border-radius:0;background:#506cd2;color:#fff;border:none;font-size:20px;cursor:pointer}.whois_search_button[data-v-131a7818]:hover{background:#5971c7}.whois-box[data-v-131a7818]{max-width:1380px;margin:0 auto;padding:80px 0 260px}.whois-introduce[data-v-131a7818]{overflow:hidden}.whois-width[data-v-131a7818]{width:330px;margin:0 auto;position:relative}.whois-width p[data-v-131a7818]{color:#535353}.whois-introduce li[data-v-131a7818]{position:relative;float:left;width:33.333%;margin:20px 0}.whois-introduce li h3[data-v-131a7818]{font-size:22px;position:relative;z-index:1;padding-top:40px;font-weight:700}.whois-introduce li p[data-v-131a7818]{width:330px;font-size:14px;color:#666;position:relative;z-index:1}}@media (max-width:992px){.whois_search[data-v-131a7818]{height:180px;background-size:cover;position:relative;width:100%}.whois_search_position[data-v-131a7818]{position:absolute;left:50%;top:55%;transform:translate(-50%,-50%);text-align:center;width:90%;margin:0 auto}.whois_search_title[data-v-131a7818]{font-size:24px;color:#ffc62f}.whois_search_p[data-v-131a7818]{font-size:14px;color:#333}.whois_search_div[data-v-131a7818]{width:80vw;margin:0 auto;overflow:hidden}.whois_search_input[data-v-131a7818]{padding:.375rem 1.75rem;float:left;width:100%;height:40px;line-height:50px;font-size:16px;box-shadow:inset 0 2px 3px rgba(0,0,0,.08);border-radius:5px}.whois_search_button[data-v-131a7818]{width:36%;height:40px;line-height:36px;border-radius:0;background:#506cd2;color:#fff;border:none;font-size:14px;cursor:pointer;margin:20px auto 0;border-radius:5px}.whois_search_button[data-v-131a7818]:hover{background:#5971c7}.whois-box[data-v-131a7818]{padding:60px 0 22vh}.whois-introduce[data-v-131a7818]{overflow:hidden}.whois-width[data-v-131a7818]{width:330px;margin:0 auto;position:relative}.whois-width p[data-v-131a7818]{color:#535353}.whois-introduce li[data-v-131a7818]{width:100%;margin:0;font-size:14px;padding-bottom:20px}.whois-introduce li h3[data-v-131a7818]{font-size:18px;padding:0}.whois-introduce li p[data-v-131a7818]{font-size:14px;width:100%}}",""]),t.exports=l},453:function(t,o,e){"use strict";e.r(o);e(170),e(13);var n=e(87),r=e.n(n),d=(e(10),e(27),e(32),e(253),e(40)),l={components:{},data:function(){return{tiktokText:"",videoUrl:"",xiazaiStatus:!1,yulanStatus:!1,dialogVideoStatus:!1}},head:{meta:[{name:"referrer",content:"never"}]},computed:{},mounted:function(){},methods:{yulan:function(){this.dialogVideoStatus=!0},xiazai:function(){this.start_download(this.videoUrl)},getTiktokLink:function(){var t=this;this.tiktokText?d.a.getTiktok(this.tiktokText).then((function(o){200==o.code&&(t.videoUrl=o.videoUrl,t.xiazaiStatus=!0,t.yulanStatus=!0)})):r()({type:"error",message:"解析地址不能为空！"})},download:function(data){var t=new Blob([data],{type:"video/mp4"}),o=window.URL&&URL.createObjectURL.bind(URL)||window.webkitURL&&webkitURL.createObjectURL.bind(webkitURL)||window.createObjectURL,a=document.createElement("a");a.href=o(t),a.setAttribute("download","xxx.mp4"),a.click()},start_download:function(t){var o=this,e=new XMLHttpRequest;e.open("GET",t),e.responseType="blob",e.onreadystatechange=function(){4==e.readyState&&200==e.status&&o.download(e.response)},e.send(null)}}},c=(e(436),e(26)),component=Object(c.a)(l,(function(){var t=this,o=t.$createElement,e=t._self._c||o;return e("div",{staticClass:"whois_all"},[t._m(0),t._v(" "),e("div",{staticClass:"whois_search"},[e("div",{staticClass:"whois_search_position"},[e("p",{staticClass:"whois_search_p"},[t._v("\n        复制抖音视频分享链接到下面输入框进行解析\n      ")]),t._v(" "),e("div",{staticClass:"whois_search_div"},[e("input",{directives:[{name:"model",rawName:"v-model",value:t.tiktokText,expression:"tiktokText"}],staticClass:"form-control whois_search_input",attrs:{type:"text"},domProps:{value:t.tiktokText},on:{input:function(o){o.target.composing||(t.tiktokText=o.target.value)}}}),t._v(" "),e("button",{staticClass:"whois_search_button",on:{click:function(o){return t.getTiktokLink()}}},[e("i",{staticClass:"iconfont icon-sousuo"}),t._v(" "),e("span",[t._v("\n            解析\n          ")])])])])]),t._v(" "),e("div",{staticClass:"whois-box"},[e("div",{staticClass:"whois-introduce"},[e("section",[e("div",{staticClass:"container"},[e("div",{staticStyle:{"text-align":"center"}},[t.yulanStatus?e("button",{staticClass:"btn btn-primary",attrs:{type:"button"},on:{click:function(o){return t.yulan()}}},[t._v("预览")]):t._e(),t._v(" "),t.xiazaiStatus?e("button",{staticClass:"btn btn-primary",attrs:{type:"button"},on:{click:function(o){return t.xiazai()}}},[t._v("下载")]):t._e()])])])])]),t._v(" "),e("el-dialog",{attrs:{title:"预览",visible:t.dialogVideoStatus,width:"300px"},on:{"update:visible":function(o){t.dialogVideoStatus=o}}},[e("video",{attrs:{controls:"controls",width:"100%",height:"100%",autoplay:"autoplay",volume:"1",id:"myVideo",loop:"loop"}},[e("source",{attrs:{id:"media_src",src:t.videoUrl,type:"video/mp4"}})]),t._v(" "),e("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[e("el-button",{on:{click:function(o){t.dialogVideoStatus=!1}}},[t._v("取 消")]),t._v(" "),e("el-button",{attrs:{type:"primary"},on:{click:function(o){return t.xiazai()}}},[t._v("下 载")])],1)])],1)}),[function(){var t=this,o=t.$createElement,e=t._self._c||o;return e("section",{staticClass:"banner-area relative",attrs:{id:"home"}},[e("div",{staticClass:"overlay overlay-bg"}),t._v(" "),e("div",{staticClass:"container"},[e("div",{staticClass:"row d-flex align-items-center justify-content-center"},[e("div",{staticClass:"about-content col-lg-12"},[e("h1",{staticClass:"text-white"},[t._v("\n            抖音去水印解析\n          ")]),t._v(" "),e("p",{staticClass:"text-white link-nav"},[e("a",{attrs:{href:"/"}},[t._v("首页 ")]),t._v(" "),e("span",{staticClass:"lnr lnr-arrow-right"}),t._v(" "),e("a",{attrs:{href:""}},[t._v(" 抖音去水印解析")])])])])])])}],!1,null,"131a7818",null);o.default=component.exports}}]);