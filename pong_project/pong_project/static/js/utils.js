export function get_cookie(name) {
	let cookie_value = null;
	if (document.cookie && document.cookie !== '') {
		const cookies = document.cookie.split(';');
		for (let i = 0; i < cookies.length; i++) {
			const cookie = cookies[i].trim();
			if (cookie.substring(0, name.length + 1) === (name + '=')) {
				cookie_value = decodeURIComponent(cookie.substring(name.length + 1));
				break;
			}
		}
	}
	return cookie_value;
}

export function div_handler(div_to_show) {
	const all_divs = document.querySelectorAll('div');

	all_divs.forEach(div => {
		if (div.id === div_to_show) {
			div.style.display = 'block';
		} else {
			div.style.display = 'none';
		}
	});
}
