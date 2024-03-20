const music = new Audio(window.ASSETS_URL + "glitchstairs.ogg");
const victory = new Audio(window.ASSETS_URL + "victory.wav");
const hit_sound = new Audio(window.ASSETS_URL + "hit.wav");
const score_sound = new Audio(window.ASSETS_URL + "explosion.wav");

export let sound_off = false;

export class SoundManager {
	constructor() {
		this.music = music;
		this.victory = victory;
		this.hit_sound = hit_sound;
		this.score_sound = score_sound;
	}

	play_hit_sound() {
		this.hit_sound.play().catch(error => {
			console.warn("Audio play failed:", error);
		});
	}

	play_score_sound() {
		this.score_sound.play().catch(error => {
			console.warn("Audio play failed:", error);
		});
	}

	play_victory_sound() {
		this.victory.play().catch(error => {
			console.warn("Audio play failed:", error);
		});
	}

	play_music() {
		this.music.loop = true;
		this.music.play().catch(error => {
			console.warn("Audio play failed:", error);
		});
	}

	stop_music() {
		this.music.pause();
		this.music.currentTime = 0;
	}
}

export function mute_music() {
	sound_off = true;
	music.muted = sound_off;
	victory.muted = sound_off;
	hit_sound.muted = sound_off;
	score_sound.muted = sound_off;
	document.getElementById('sound-button').textContent = "Unmute";
}

export function mute_sounds () {
	sound_off = (sound_off) ? false : true;
	music.muted = sound_off;
	victory.muted = sound_off;
	hit_sound.muted = sound_off;
	score_sound.muted = sound_off;
	document.getElementById('sound-button').textContent = sound_off ? "Unmute" : "Mute";
}
