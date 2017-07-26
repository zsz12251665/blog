document.getElementById('music').innerHTML+='<audio id="audio" src="music.mp3"></audio>';
document.getElementById('music').innerHTML+='<img id="play" src="/posts/music/pause.svg"/>';
document.getElementById('music').innerHTML+='<span id="timeline">00:00/00:00</span>';
document.getElementById('music').innerHTML+='<img id="muted" src="/posts/music/unmuted.svg"/>';
document.getElementById('music').innerHTML+='<input id="volume" type="range"/>';
document.getElementById('music').innerHTML+='<img id="repeat" src="/posts/music/repeat.svg"/>';
var audio=document.getElementById('audio');
var volume=document.getElementById('volume');
var value=100;
document.getElementById('play').addEventListener('click',play);
document.getElementById('muted').addEventListener('click',mute);
document.getElementById('repeat').addEventListener('click',repeat);
volume.max=volume.value=100;
volume.min=0;
volume.step=1;
volume.addEventListener('input',ChangeVolume);
audio.autoplay=true;
audio.loop=true;
audio.addEventListener('loadedmetadata',ShowTime);
audio.addEventListener('timeupdate',ShowTime);
audio.addEventListener('ended',end);
function ChangeVolume()
{
	audio.volume=Number(volume.value)/100;
	if(volume.value==0)
		document.getElementById('muted').src='/posts/music/muted.svg';
	else
		document.getElementById('muted').src='/posts/music/unmuted.svg';
}
function ShowTime()
{
	var p=document.getElementById('timeline');
	p.innerHTML='';
	if(Math.floor(audio.currentTime/60)<10)
		p.innerHTML+='0';
	p.innerHTML+=String(Math.floor(audio.currentTime/60));
	p.innerHTML+=':';
	if((audio.currentTime%60)<10)
		p.innerHTML+='0';
	p.innerHTML+=String(Math.floor(audio.currentTime%60));
	p.innerHTML+='/';
	if(Math.floor(audio.duration/60)<10)
		p.innerHTML+='0';
	p.innerHTML+=String(Math.floor(audio.duration/60));
	p.innerHTML+=':';
	if((audio.duration%60)<10)
		p.innerHTML+='0';
	p.innerHTML+=String(Math.floor(audio.duration%60));
}
function play()
{
	if(audio.paused)
	{
		audio.play();
		document.getElementById('play').src='/posts/music/pause.svg';
	}
	else
	{
		audio.pause();
		document.getElementById('play').src='/posts/music/play.svg';
	}
}
function end()
{
	if(audio.loop)
		document.getElementById('play').src='/posts/music/pause.svg';
	else
		document.getElementById('play').src='/posts/music/play.svg';
}
function repeat()
{
	audio.loop=!(audio.loop);
	if(audio.loop)
		document.getElementById('repeat').src='/posts/music/repeat.svg';
	else
		document.getElementById('repeat').src='/posts/music/no-repeat.svg';
}
function mute()
{
	if(volume.value==0)
		if(value==0)
			volume.value=100;
		else
			volume.value=value;
	else
	{
		value=volume.value;
		volume.value=0;
	}
	ChangeVolume();
}
