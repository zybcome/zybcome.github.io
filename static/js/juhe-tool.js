var videoUrl;
$("#jiexi").on("click", function () {
    $.ajax(
        {
            url: "https://v2.alapi.cn/api/video/url",
            type: "get",
            dataType: "json",
            data: {
                url: $("#tiktok_url").val(),
                token:"n54vd28zkTDwvsgQ5LMH"
            },
            success: function (data) {
                if(data.code==200){
                    videoUrl = data.data.video_url;
                    $("#yulan").show();
                    $("#xiazai").show();
                }else{
                    alert("解析失败")
                }
            },
        });
})

function download(data) {
    let blob = new Blob([data], {
        type: 'video/mp4'
    })
    let a = document.createElement("a");
    a.href = getBlobURL(blob);
    a.setAttribute("download", 'xxx.mp4');
    a.click();
}

var getBlobURL = (window.URL && URL.createObjectURL.bind(URL)) ||
    (window.webkitURL && webkitURL.createObjectURL.bind(webkitURL)) ||
    window.createObjectURL;

function start_download(url) {
    xhr = new XMLHttpRequest()
    xhr.open('GET', url);
    xhr.responseType = "blob"
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            download(xhr.response)
        }
    }
    xhr.send(null)
}
$("#yulan").on("click", function () {
    $(".shipin").append(`<video controls="controls" width="100%" height="100%" autoplay="autoplay"  volume="1" id="myVideo"  loop="loop">
    <source id="media_src" src="`+ videoUrl + `" type="video/mp4"/>
</video>`)
    // $("#shipin").show();
})
$("#xiazai").on("click", function () {
    start_download(videoUrl)
})