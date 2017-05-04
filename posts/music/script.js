var playing=0;
var repeat=1;
var player=document.getElementById('audio');
function change_audio()
{
    document.getElementById('rng_timeline').value=player.currentTime;
    show_time();
}
function play_pause()
{
    if(playing==0)
    {
        player.pause();
        document.getElementById('but_play').src='http://blog.zsz12251665.cf/posts/music/play.svg';
    }
    else
    {
        player.play();
        document.getElementById('but_play').src='http://blog.zsz12251665.cf/posts/music/pause.svg';
    }
}
function click_play()
{
    playing=1-playing;
	play_pause();
}
function end()
{
	playing=repeat;
	play_pause();
}
function show_time()
{
    var p=document.getElementById('p_timeline');
    p.innerHTML='';
    if(parseInt(player.currentTime/60)<10)
        p.innerHTML+='0';
    p.innerHTML+=String(parseInt(player.currentTime/60));
    p.innerHTML+=':';
    if((player.currentTime%60)<10)
        p.innerHTML+='0';
    p.innerHTML+=String(parseInt(player.currentTime%60));
    p.innerHTML+='/';
    if(parseInt(player.duration/60)<10)
        p.innerHTML+='0';
    p.innerHTML+=String(parseInt(player.duration/60));
    p.innerHTML+=':';
    if((player.duration%60)<10)
        p.innerHTML+='0';
    p.innerHTML+=String(parseInt(player.duration%60));
}
function change_timeline()
{
	playing=0;
	play_pause();
    player.currentTime=document.getElementById('rng_timeline').value;
    show_time();
	playing=1;
	play_pause();
}
function click_repeat()
{
    repeat=1-repeat;
    if(repeat==0)
        document.getElementById('but_repeat').src='http://blog.zsz12251665.cf/posts/music/no-repeat.svg';
    else
        document.getElementById('but_repeat').src='http://blog.zsz12251665.cf/posts/music/repeat.svg';
}
function change_volume()
{
    document.getElementById('p_volume').innerHTML='Volume: '+document.getElementById('rng_volume').value;
    player.volume=Number(document.getElementById('rng_volume').value)/100;
    if(document.getElementById('rng_volume').value==0)
        document.getElementById('but_muted').src='http://blog.zsz12251665.cf/posts/music/muted.svg';
    else
        document.getElementById('but_muted').src='http://blog.zsz12251665.cf/posts/music/unmuted.svg';
}
function click_muted()
{
    if(document.getElementById('rng_volume').value==0)
        document.getElementById('rng_volume').value=100;
    else
        document.getElementById('rng_volume').value=0;
    change_volume();
}
function format()
{
    document.getElementById('rng_timeline').max=player.duration;
    show_time();
}
