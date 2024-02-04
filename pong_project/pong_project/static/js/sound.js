let music = new Audio(assets_url + "glitchstairs.ogg");
let victory = new Audio(assets_url + "victory.wav");
let hit_sound = new Audio(assets_url + "hit.wav");
let score_sound = new Audio(assets_url + "explosion.wav");

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
	music.play().catch(error => {
		console.warn("Audio play failed:", error);
	});
}
