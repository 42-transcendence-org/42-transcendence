window.game_session = null;
window.request_id = null;
window.event_source = null;
window.server_data = null;
window.alias = null;

export const canvas = document.getElementById("game-canvas");
export const ctx = canvas.getContext("2d");

/* BOARD */
export const BOARD_WIDTH = canvas.width;
export const BOARD_HEIGHT = canvas.height;
export const BOARD_MARGIN = 16;
export const BOARD_CORRIDOR = 2 * BOARD_MARGIN + 10;

/* COLORS */
export const PALETTE = {
	C1: "#2B2A4C", /* purple */
	C2: "#B31312", /* red */ /* FIXME: Change this color */
	C3: "#EA906C", /* flesh */
	C4: "#EEE2DE", /* light grey */
}

/* SHADOWS */
export const SHADOW_COLOR = "#252442";
export const SHADOW_OFFSET_X = 5;
export const SHADOW_OFFSET_Y = 5;

/* FONTS */
export const FSIZE = 24;
export const DOUBLE_FSIZE = 48;

/* INPUTS */
export const INPUT_LEFT = 0;
export const INPUT_RIGHT = 1;
export const INPUT_SPACE = 2;
export const INPUT_NEUTRAL = 3;
export const INPUT_QUIT = 4;

/* STATUSES */
export const STATUS_READY = 0; /* game is about to begin, press a key to start */
export const STATUS_ACTIVE = 1; /* game in progress */
export const STATUS_ENDED = 2; /* game over, ask for retry */
export const STATUS_PAUSED = 3; /* game is paused */
export const STATUS_QUIT = 4; /* game is over, retry did not happen */
export const STATUS_SCORE = 5; /* a point has been scored */
export const STATUS_WAITING = 6; /* waiting for a second player */

/* UPDATE TYPES */
export const UPD_SESSION = 0;
export const UPD_STATE = 1;

/* GAME TYPES */
export const TYPE_REMOTE = 0;
export const TYPE_LOCAL = 1;
export const TYPE_AI = 2;

/* PLAYERS' IDS */
export const ID_PLAYER1 = 0;
export const ID_PLAYER2 = 1;

/* BALL */
export const BALL_SIDE = 16;
export const BALL_SPEED_MIN = (BOARD_HEIGHT / 2) - BOARD_MARGIN;
export const BALL_SPEED_MAX = BALL_SPEED_MIN * 2.0;
export const BALL_MAX_ANGLE = Math.PI / 6;

/* PADDLE */
export const PADDLE_WIDTH = 64;
export const PADDLE_SPEED = BOARD_WIDTH - (2 * BOARD_CORRIDOR);

export const POINTS_TO_WIN = 3;