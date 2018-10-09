window.addEventListener('load',LoadMusic);
function LoadMusic()
{
	//Insert the innerHTML of user interface
	document.getElementById('music').innerHTML+='<audio id="audio" src="music.mp3" preload="auto"></audio>';
	document.getElementById('music').innerHTML+='<span id="play" class="button">&#9205;</span>';
	document.getElementById('music').innerHTML+='<span id="time">00:00/00:00</span>';
	document.getElementById('music').innerHTML+='<span id="repeat" class="button">&#128257;</span>';
	document.getElementById('music').innerHTML+='<span class="range"><span id="volume"></span></span>';
	document.getElementById('music').innerHTML+='<span id="mute" class="button">&#128266;</span>';
	//Set up the stylesheet
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/music/music.css"/>';
	//Format values
	var audio=document.getElementById('audio');
	var play=document.getElementById('play');
	var time=document.getElementById('time');
	var mute=document.getElementById('mute');
	var volume=document.getElementById('volume');
	var repeat=document.getElementById('repeat');
	audio.loop=true;
	audio.autoplay=true;
	//Add event listeners
	audio.addEventListener('durationchange',ShowTime);
	audio.addEventListener('timeupdate',ShowTime);
	audio.addEventListener('ended',Replay);
	audio.addEventListener('pause',function(){play.innerHTML='&#9205;';});
	audio.addEventListener('play',function(){play.innerHTML='&#9208;';});
	mute.addEventListener('click',SetMuted);
	play.addEventListener('click',ClickPlay);
	repeat.addEventListener('click',RepeatGo);
	volume.parentElement.addEventListener('click',ChangeVolume);
}
//Load functions
function ChangeVolume(e)
{
	audio.muted=false;
	audio.volume=Number(e.offsetX/volume.parentElement.offsetWidth);
	if(audio.volume==0)
	{
		audio.volume=1;
		SetMuted();
	}
	else
	{
		volume.style.width=String(audio.volume*100)+'%';
		mute.innerHTML='&#128266;';
	}
}
function ClickPlay()
{
	if(audio.paused)
		audio.play();
	else
		audio.pause();
}
function RepeatGo()
{
	audio.loop=!(audio.loop);
	if(audio.loop)
		repeat.innerHTML='&#128257;';
	else
		repeat.innerHTML='&#128256;';
}
function Replay()
{
	if(audio.loop)
		play.innerHTML='&#9208;';
	else
		play.innerHTML='&#9205;';
}
function SetMuted()
{
	audio.muted=!audio.muted;
	if(audio.muted)
	{
		mute.innerHTML='&#128264;';
		volume.style.width='0%';
	}
	else
	{
		mute.innerHTML='&#128266;';
		volume.style.width=String(audio.volume*100)+'%';
	}
}
function ShowTime()
{
	time.innerHTML='';
	if(Math.floor(audio.currentTime/60)<10)
		time.innerHTML+='0';
	time.innerHTML+=String(Math.floor(audio.currentTime/60));
	time.innerHTML+=':';
	if((audio.currentTime%60)<10)
		time.innerHTML+='0';
	time.innerHTML+=String(Math.floor(audio.currentTime%60));
	time.innerHTML+='/';
	if(Math.floor(audio.duration/60)<10)
		time.innerHTML+='0';
	time.innerHTML+=String(Math.floor(audio.duration/60));
	time.innerHTML+=':';
	if((audio.duration%60)<10)
		time.innerHTML+='0';
	time.innerHTML+=String(Math.floor(audio.duration%60));
}
