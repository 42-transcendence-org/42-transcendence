window.game_session = null;

export const BOARD_WIDTH = document.getElementById("game-canvas").width;
export const BOARD_HEIGHT = document.getElementById("game-canvas").height;

/* INPUTS */
export const INPUT_LEFT = 0;
export const INPUT_RIGHT = 1;
export const INPUT_SPACE = 2;
export const INPUT_NEUTRAL = 3;
export const INPUT_QUIT = 4;

/* STATUSES */
export const STATUS_WAITING = 0;
export const STATUS_ACTIVE = 1;
export const STATUS_ENDED_1 = 2;
export const STATUS_ENDED_2 = 3;
export const STATUS_PAUSED = 4;
export const STATUS_QUIT = 5;

/* GAME TYPES */
export const TYPE_REMOTE = 0;
export const TYPE_LOCAL = 1;
export const TYPE_AI = 2;

/* PLAYERS' IDS */
export const ID_PLAYER1 = 0;
export const ID_PLAYER2 = 1;

export const MARGIN = 16;
export const CORRIDOR = 2 * MARGIN;

export const BALL_SIDE = 16;
export const BALL_SPEED_MIN = (BOARD_HEIGHT / 2) - MARGIN;
export const BALL_SPEED_MAX = BALL_SPEED_MIN * 2.0;

export const PADDLE_WIDTH = 64;
export const PADDLE_SPEED = BOARD_WIDTH - (2 * CORRIDOR);

export const POINTS_TO_WIN = 1;

export const MAX_ANGLE = Math.PI / 6;
