window.addEventListener('load', LoadMusic);

function LoadMusic() {
	// Set up the stylesheet
	document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/add-on/music/music.css" />';
	// Enumerate all audio elements
	for (let audio of document.querySelectorAll('article audio')) {
		// Set up the user interface
		var music = document.createElement('div');
		music.className = 'music';
		music.innerHTML += '<b class="play">&#9205;</b><span class="time">00:00/00:00</span><b class="repeat">&#128257;</b><span class="range"><span></span></span><b class="mute">&#128266;</b>';
		audio.parentElement.insertBefore(music, audio);
		// Initialize values
		var mute = music.querySelector('b.mute'),
			play = music.querySelector('b.play'),
			volume = music.querySelector('span.range>span');
		audio.loop = true;
		// Set up event functions
		audio.ontimeupdate = audio.ondurationchange = function () {
			music.querySelector('span.time').innerText = ((audio.currentTime < 600) ? '0' : '') + String(Math.floor(audio.currentTime / 60)) + ((audio.currentTime % 60 < 10) ? ':0' : ':') + String(Math.floor(audio.currentTime % 60)) + ((audio.duration < 600) ? '/0' : '/') + String(Math.floor(audio.duration / 60)) + ((audio.duration % 60 < 10) ? ':0' : ':') + String(Math.floor(audio.duration % 60));
		};
		audio.onended = function () {
			play.innerHTML = (audio.loop) ? '&#9208;' : '&#9205;';
		};
		audio.onpause = audio.onplay = function () {
			play.innerHTML = (audio.paused) ? '&#9205;' : '&#9208;';
		};
		audio.onvolumechange = function () {
			volume.style.width = (audio.muted) ? '0%' : (String(audio.volume * 100) + '%');
		};
		music.querySelector('b.repeat').onclick = function (e) {
			e.target.innerHTML = (audio.loop = !audio.loop) ? '&#128257;' : '&#128256;';
		};
		mute.onclick = function () {
			mute.innerHTML = (audio.muted = !audio.muted) ? '&#128264;' : '&#128266;';
		};
		play.onclick = function () {
			audio.paused ? audio.play() : audio.pause();
		};
		volume.parentElement.onclick = function (e) {
			audio.volume = (!Number(e.offsetX / e.target.offsetWidth)) ? 1 : Number(e.offsetX / e.target.offsetWidth);
			if (audio.muted ^ (!Number(e.offsetX / e.target.offsetWidth)))
				mute.click();
		};
		// Initialize the time
		audio.ontimeupdate();
	}
}
