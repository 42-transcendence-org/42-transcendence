import * as g from './global.js';

// const music = new Audio(window.ASSETS_URL + "jul.ogg");
const music = new Audio(window.ASSETS_URL + "glitchstairs.ogg");
const victory = new Audio(window.ASSETS_URL + "victory.wav");
const hit_sound = new Audio(window.ASSETS_URL + "hit.wav");
const score_sound = new Audio(window.ASSETS_URL + "explosion.wav");
// const music=null;
// const victory=null;
// const hit_sound=null;
// const score_sound=null;

export let sound_off = false;
class SoundEvent {
	constructor(tick, sound) {
		this.tick = tick;
		this.sound = sound;
		this.played = false;
	}
}

export class SoundManager {
	constructor() {
		this.events = [];
		this.music = music;
		this.victory = victory;
		this.hit_sound = hit_sound;
		this.score_sound = score_sound;
	}

	create_sound_events(arr, len) {
		for (let i = 0; i < len; i++) {
			this.events.push(new SoundEvent(arr[i][0], arr[i][1]));
		}
	}

	process_sound_events(tick) {
		this.events = this.events.filter(event => event.played === false);

		for (let i = 0; i < this.events.length; i++) {
			if (tick >= this.events[i].tick) {

				switch (this.events[i].sound) {
					case g.SOUND_HIT:
						this.play_hit_sound();
						break;
					case g.SOUND_SCORE:
						this.play_score_sound();
						break;
					case g.SOUND_VICTORY:
						this.play_victory_sound();
						break;
				}
				this.events[i].played = true;
			}
		}
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
	// return ;
	music.muted = sound_off;
	victory.muted = sound_off;
	hit_sound.muted = sound_off;
	score_sound.muted = sound_off;
	document.getElementById('sound-button').textContent = "Unmute";
}

export function mute_sounds () {
	sound_off = (sound_off) ? false : true;
	// returb ;
	music.muted = sound_off;
	victory.muted = sound_off;
	hit_sound.muted = sound_off;
	score_sound.muted = sound_off;
	document.getElementById('sound-button').textContent = sound_off ? "Unmute" : "Mute";
}
