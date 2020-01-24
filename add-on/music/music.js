window.addEventListener('load', LoadMusic);
// Append the style sheet
document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/add-on/music/music.css" />';

function LoadMusic()
{
	// Enumerate audio elements
	for (let audio of document.querySelectorAll('main audio'))
	{
		// Append the user interface
		var music = document.createElement('aside');
		music.className = 'music';
		music.innerHTML = '<b class="icon play"></b><span class="time">00:00/00:00</span><b class="icon repeat"></b><span class="range"><span></span></span><b class="icon volume-up"></b>';
		audio.parentElement.insertBefore(music, audio);
		// Initialize values
		var mute = music.querySelector('b.icon.volume-up'),
			play = music.querySelector('b.icon.play'),
			repeat = music.querySelector('b.icon.repeat'),
			volume = music.querySelector('span.range>span');
		audio.loop = true;
		// Set ending events
		audio.onended = function ()
		{
			play.className = 'icon ' + (audio.loop ? 'pause' : 'play');
		};
		// Set play and pause events
		audio.onpause = audio.onplay = function ()
		{
			play.className = 'icon ' + (audio.paused ? 'play' : 'pause');
		};
		repeat.onclick = function ()
		{
			repeat.className = 'icon ' + ((audio.loop = !audio.loop) ? 'repeat' : 'random');
		};
		play.onclick = function ()
		{
			audio.paused ? audio.play() : audio.pause();
		};
		// Set time panel events
		audio.ondurationchange = audio.ontimeupdate = function ()
		{
			function TimeToString(a)
			{
				return ((a < 600) ? '0' : '') + String(Math.floor(a / 60)) + ((a % 60 < 10) ? ':0' : ':') + String(Math.floor(a % 60));
			}
			music.querySelector('span.time').innerText = TimeToString(audio.currentTime) + '/' + TimeToString(audio.duration);
		};
		//Set volume events
		audio.onvolumechange = function ()
		{
			volume.style.width = audio.muted ? '0%' : String(audio.volume * 100) + '%';
		};
		mute.onclick = function ()
		{
			mute.className = 'icon ' + ((audio.muted = !audio.muted) ? 'volume-off' : 'volume-up');
		};
		volume.parentElement.onclick = function (e)
		{
			audio.volume = !Number(e.offsetX / e.target.offsetWidth) ? 1 : Number(e.offsetX / e.target.offsetWidth);
			if (audio.muted ^ !Number(e.offsetX / e.target.offsetWidth))
				mute.click();
		};
		// Initialize the time panel
		audio.ontimeupdate();
	}
}
