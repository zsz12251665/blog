var player=document.getElementById('audio');
player.autoplay=true;
player.loop=true;
function play_pause(b)
{
    if(b)
        document.getElementById('but_play').src='/posts/music/play.svg';
    else
        document.getElementById('but_play').src='/posts/music/pause.svg';
}
function click_play()
{
    if(player.paused)
		player.play();
	else
		player.pause();
	play_pause(player.paused);
}
function show_time(i)
{
	if(i==0)
		player.currentTime=document.getElementById('rng_timeline').value;
	if(i==1)
		document.getElementById('rng_timeline').value=player.currentTime;
    var p=document.getElementById('p_timeline');
    p.innerHTML='';
    if(Math.floor(player.currentTime/60)<10)
        p.innerHTML+='0';
    p.innerHTML+=String(Math.floor(player.currentTime/60));
    p.innerHTML+=':';
    if((player.currentTime%60)<10)
        p.innerHTML+='0';
    p.innerHTML+=String(Math.floor(player.currentTime%60));
    p.innerHTML+='/';
    if(Math.floor(player.duration/60)<10)
        p.innerHTML+='0';
    p.innerHTML+=String(Math.floor(player.duration/60));
    p.innerHTML+=':';
    if((player.duration%60)<10)
        p.innerHTML+='0';
    p.innerHTML+=String(Math.floor(player.duration%60));
}
function click_repeat()
{
    player.loop=!(player.loop);
    if(player.loop)
        document.getElementById('but_repeat').src='/posts/music/repeat.svg';
    else
        document.getElementById('but_repeat').src='/posts/music/no-repeat.svg';
}
function change_volume()
{
    document.getElementById('p_volume').innerHTML='Volume: '+document.getElementById('rng_volume').value;
    player.volume=Number(document.getElementById('rng_volume').value)/100;
    if(document.getElementById('rng_volume').value==0)
        document.getElementById('but_muted').src='/posts/music/muted.svg';
    else
        document.getElementById('but_muted').src='/posts/music/unmuted.svg';
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
    show_time(-1);
}
