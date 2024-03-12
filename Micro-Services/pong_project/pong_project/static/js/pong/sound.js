export class SoundManager {
	constructor() {
		this.music = new Audio(window.ASSETS_URL + "glitchstairs.ogg");
		this.victory = new Audio(window.ASSETS_URL + "victory.wav");
		this.hit_sound = new Audio(window.ASSETS_URL + "hit.wav");
		this.score_sound = new Audio(window.ASSETS_URL + "explosion.wav");
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
