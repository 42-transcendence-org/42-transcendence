let hit_sound = new Audio('./assets/hit.wav');
let score_sound = new Audio('./assets/explosion.wav');
let music = new Audio('./assets/glitchstairs.ogg');
music.loop = true;
let victory = new Audio('./assets/victory.wav');

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
	music.play().catch(error => {
		console.warn("Audio play failed:", error);
	});
}
