import { Client } from './client.js';

document.addEventListener('DOMContentLoaded', () => {
    window.client = new Client();
    window.client.init();
});
