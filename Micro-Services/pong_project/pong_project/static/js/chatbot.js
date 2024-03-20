import { poster } from "./Oauth.js";

export class Chatbot {
	constructor() {}

	eventlisteners() {
		document.getElementById('chatbot-button').addEventListener('click', () => window.client.nextPage("chatbot"));
		document.getElementById('OPENai').addEventListener('submit', (event) => this.chatgpt(event));
	}
	
	async chatgpt(event) { //checks the state gotten from the redirection post login on 42 website
		event.preventDefault();
		const url = 'https://localhost:8443/auth/chatgpt/';
		const data = {
			'question': document.getElementById('OpenAIquestion').value,
		};
		document.getElementById('OpenAIquestion').value = '';

		const response = await poster(url, data);
		if (response.error) {
			return ;
		}

		document.getElementById('chatgpt-response').textContent = response.response;
	}
}