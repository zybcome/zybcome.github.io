var videoUrl;
$("#jiexi").on("click", function () {
    $.ajax(
        {
            // url: "http://192.168.20.36:6688/system/tiktok",
            url: "http://39.105.43.110:304/system/tiktok",
            type: "get",
            dataType: "json",
            data: {
                url: $("#tiktok_url").val()
            },
            success: function (data) {
                if(data.code==200){
                    videoUrl = data.msg;
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