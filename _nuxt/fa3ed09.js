(window.webpackJsonp=window.webpackJsonp||[]).push([[9],{425:function(t,e,o){var content=o(451);content.__esModule&&(content=content.default),"string"==typeof content&&(content=[[t.i,content,""]]),content.locals&&(t.exports=content.locals);(0,o(7).default)("6db294a9",content,!0,{sourceMap:!1})},450:function(t,e,o){"use strict";o(425)},451:function(t,e,o){var n=o(6)(!1);n.push([t.i,".whois_all[data-v-08008ec0]{position:relative}.num-embellish[data-v-08008ec0]{position:absolute;left:0;top:0;z-index:-1}.num-embellish i[data-v-08008ec0]{display:inline-block;width:42px;height:70px}.num-embellish .num-0[data-v-08008ec0]{background-position:0 0}.num-embellish .num-1[data-v-08008ec0]{background-position:0 -101px}.num-embellish .num-2[data-v-08008ec0]{background-position:0 -200px}.num-embellish .num-3[data-v-08008ec0]{background-position:0 -300px}.num-embellish .num-4[data-v-08008ec0]{background-position:0 -400px}.num-embellish .num-5[data-v-08008ec0]{background-position:0 -500px}.num-embellish .num-6[data-v-08008ec0]{background-position:0 -600px}.num-embellish .num-7[data-v-08008ec0]{background-position:0 -700px}.num-embellish .num-8[data-v-08008ec0]{background-position:0 -800px}.num-embellish .num-9[data-v-08008ec0]{background-position:0 -900px}@media (min-width:993px){.whois_search[data-v-08008ec0]{width:100%;height:180px;background-size:cover;position:relative}.whois_search_position[data-v-08008ec0]{position:absolute;left:50%;top:50%;transform:translate(-50%,-50%);text-align:center;width:740px}.whois_search_title[data-v-08008ec0]{font-size:58px;color:#ffc62f}.whois_search_p[data-v-08008ec0]{font-size:16px;color:#333}.whois_search_div[data-v-08008ec0]{width:100%;margin:0 auto;overflow:hidden;border-radius:5px}.whois_search_input[data-v-08008ec0]{padding:.375rem 1.75rem;float:left;width:70%;height:50px;line-height:50px;font-size:16px;box-shadow:inset 0 2px 3px rgba(0,0,0,.08);border-radius:0}.whois_search_button[data-v-08008ec0]{float:left;width:30%;height:50px;line-height:46px;border-radius:0;background:#506cd2;color:#fff;border:none;font-size:20px;cursor:pointer}.whois_search_button[data-v-08008ec0]:hover{background:#5971c7}.whois-box[data-v-08008ec0]{max-width:1380px;margin:0 auto;padding:80px 0 260px}.whois-introduce[data-v-08008ec0]{overflow:hidden}.whois-width[data-v-08008ec0]{width:330px;margin:0 auto;position:relative}.whois-width p[data-v-08008ec0]{color:#535353}.whois-introduce li[data-v-08008ec0]{position:relative;float:left;width:33.333%;margin:20px 0}.whois-introduce li h3[data-v-08008ec0]{font-size:22px;position:relative;z-index:1;padding-top:40px;font-weight:700}.whois-introduce li p[data-v-08008ec0]{width:330px;font-size:14px;color:#666;position:relative;z-index:1}}@media (max-width:992px){.whois_search[data-v-08008ec0]{height:180px;background-size:cover;position:relative;width:100%}.whois_search_position[data-v-08008ec0]{position:absolute;left:50%;top:55%;transform:translate(-50%,-50%);text-align:center;width:90%;margin:0 auto}.whois_search_title[data-v-08008ec0]{font-size:24px;color:#ffc62f}.whois_search_p[data-v-08008ec0]{font-size:14px;color:#333}.whois_search_div[data-v-08008ec0]{width:80vw;margin:0 auto;overflow:hidden}.whois_search_input[data-v-08008ec0]{padding:.375rem 1.75rem;float:left;width:100%;height:40px;line-height:50px;font-size:16px;box-shadow:inset 0 2px 3px rgba(0,0,0,.08);border-radius:5px}.whois_search_button[data-v-08008ec0]{width:36%;height:40px;line-height:36px;border-radius:0;background:#506cd2;color:#fff;border:none;font-size:14px;cursor:pointer;margin:20px auto 0;border-radius:5px}.whois_search_button[data-v-08008ec0]:hover{background:#5971c7}.whois-box[data-v-08008ec0]{padding:60px 0 22vh}.whois-introduce[data-v-08008ec0]{overflow:hidden}.whois-width[data-v-08008ec0]{width:330px;margin:0 auto;position:relative}.whois-width p[data-v-08008ec0]{color:#535353}.whois-introduce li[data-v-08008ec0]{width:100%;margin:0;font-size:14px;padding-bottom:20px}.whois-introduce li h3[data-v-08008ec0]{font-size:18px;padding:0}.whois-introduce li p[data-v-08008ec0]{font-size:14px;width:100%}}",""]),t.exports=n},475:function(t,e,o){"use strict";o.r(e);o(171),o(8);var n=o(88),r=o.n(n),c=(o(11),o(27),o(33),o(264),o(42)),d={components:{},data:function(){return{tiktokText:"",videoUrl:"",xiazaiStatus:!1,yulanStatus:!1,dialogVideoStatus:!1,videoStatus:!1,xiazaiBtnStatus:!1,closeMesssage:""}},head:{meta:[{name:"referrer",content:"never"}]},computed:{},mounted:function(){},methods:{getCurrentTime:function(){var t=new Date;return t.getFullYear()+"-"+this.repair(t.getMonth()+1)+"-"+this.repair(t.getDate())+"-"+this.repair(t.getHours())+"-"+this.repair(t.getMinutes())+"-"+this.repair(t.getSeconds())},repair:function(i){return i>=0&&i<=9?"0"+i:i},yulan:function(){this.videoStatus=!0,this.dialogVideoStatus=!0},xiazai:function(){this.start_download(this.videoUrl)},getTiktokLink:function(){var t=this;this.xiazaiStatus=!1,this.yulanStatus=!1,this.videoStatus=!1,this.tiktokText?c.a.getPipixia(this.tiktokText).then((function(e){200==e.code&&(t.videoUrl=e.videoUrl,t.xiazaiStatus=!0,t.yulanStatus=!0,r()({type:"success",message:"解析成功",showClose:!0}),t.tiktokText="")})):r()({type:"error",message:"解析地址不能为空！",showClose:!0})},download:function(data){var t=new Blob([data],{type:"video/mp4"}),e=window.URL&&URL.createObjectURL.bind(URL)||window.webkitURL&&webkitURL.createObjectURL.bind(webkitURL)||window.createObjectURL,a=document.createElement("a");a.href=e(t),a.setAttribute("download",this.getCurrentTime()+".mp4"),a.click()},start_download:function(t){this.closeMesssage=r()({type:"success",message:"开始下载，请稍等",duration:0,showClose:!0}),this.xiazaiBtnStatus=!0;var e=this,o=new XMLHttpRequest;o.open("GET",t),o.responseType="blob",o.onprogress=function(t){if(t.lengthComputable){var o=parseInt(t.loaded/t.total*100)+"%";e.closeMesssage.message="正在下载："+o}},o.onreadystatechange=function(){4==o.readyState&&200==o.status&&(e.closeMesssage.close(),r()({type:"success",message:"已下载完成，请保存到本地",showClose:!0}),e.download(o.response),e.xiazaiBtnStatus=!1)},o.send(null)}}},l=(o(450),o(26)),component=Object(l.a)(d,(function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"whois_all"},[t._m(0),t._v(" "),o("div",{staticClass:"whois_search"},[o("div",{staticClass:"whois_search_position"},[o("p",{staticClass:"whois_search_p"},[t._v("\n        复制皮皮虾视频分享链接到下面输入框进行解析\n      ")]),t._v(" "),o("div",{staticClass:"whois_search_div"},[o("input",{directives:[{name:"model",rawName:"v-model",value:t.tiktokText,expression:"tiktokText"}],staticClass:"form-control whois_search_input",attrs:{type:"text"},domProps:{value:t.tiktokText},on:{input:function(e){e.target.composing||(t.tiktokText=e.target.value)}}}),t._v(" "),o("button",{staticClass:"whois_search_button",on:{click:function(e){return t.getTiktokLink()}}},[o("i",{staticClass:"iconfont icon-sousuo"}),t._v(" "),o("span",[t._v("\n            解析\n          ")])])])])]),t._v(" "),o("div",{staticClass:"whois-box"},[o("div",{staticClass:"whois-introduce"},[o("section",[o("div",{staticClass:"container"},[o("div",{staticStyle:{"text-align":"center"}},[t.yulanStatus?o("button",{staticClass:"btn btn-sm btn-outline-primary",attrs:{type:"button"},on:{click:function(e){return t.yulan()}}},[t._v("预览")]):t._e(),t._v(" "),t.xiazaiStatus?o("button",{staticClass:"btn btn-sm btn-outline-success",attrs:{type:"button",disabled:t.xiazaiBtnStatus},on:{click:function(e){return t.xiazai()}}},[t._v("下载")]):t._e()])])])])]),t._v(" "),o("el-dialog",{attrs:{title:"预览",visible:t.dialogVideoStatus,width:"300px","destroy-on-close":!0},on:{"update:visible":function(e){t.dialogVideoStatus=e}}},[t.videoStatus?o("video",{attrs:{controls:"controls",width:"100%",height:"100%",volume:"1",id:"myVideo",loop:"loop"}},[o("source",{attrs:{id:"media_src",src:t.videoUrl,type:"video/mp4"}})]):t._e(),t._v(" "),o("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[o("el-button",{on:{click:function(e){t.dialogVideoStatus=!1}}},[t._v("取 消")]),t._v(" "),o("el-button",{attrs:{type:"primary",disabled:t.xiazaiBtnStatus},on:{click:function(e){return t.xiazai()}}},[t._v("下 载")])],1)])],1)}),[function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("section",{staticClass:"banner-area relative",attrs:{id:"home"}},[o("div",{staticClass:"overlay overlay-bg"}),t._v(" "),o("div",{staticClass:"container"},[o("div",{staticClass:"row d-flex align-items-center justify-content-center"},[o("div",{staticClass:"about-content col-lg-12"},[o("h1",{staticClass:"text-white"},[t._v("\n            皮皮虾去水印解析\n          ")]),t._v(" "),o("p",{staticClass:"text-white link-nav"},[o("a",{attrs:{href:"/"}},[t._v("首页 ")]),t._v(" "),o("span",{staticClass:"lnr lnr-arrow-right"}),t._v(" "),o("a",{attrs:{href:""}},[t._v(" 皮皮虾去水印解析")])])])])])])}],!1,null,"08008ec0",null);e.default=component.exports}}]);