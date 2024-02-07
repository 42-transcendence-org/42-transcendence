const music = new Audio(ASSETS_URL + "glitchstairs.ogg");
const victory = new Audio(ASSETS_URL + "victory.wav");
const hit_sound = new Audio(ASSETS_URL + "hit.wav");
const score_sound = new Audio(ASSETS_URL + "explosion.wav");

music.loop = true;

export function play_hit_sound() {
	hit_sound.play().catch(error => {
		console.warn("Audio play failed:", error);
	});
}

export function play_explosion_sound() {
	score_sound.play().catch(error => {
		console.warn("Audio play failed:", error);
	});
}

export function play_victory_sound() {
	victory.play().catch(error => {
		console.warn("Audio play failed:", error);
	});
}

export function play_music() {
	if (music) {
		music.play().catch(error => {
			console.warn("Audio play failed:", error);
		});
	}
}

export function stop_music() {
	if (music) {
		music.pause();
		music.currentTime = 0;
	}
}
