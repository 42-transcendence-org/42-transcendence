class mon_button extends HTMLElement {
    constructor() {
        super();
        var shadow = this.attachShadow({ mode: "open" });
    }

    connectedCallback() {
        const button = document.createElement('button');
        button.textContent = "Text de mon button";
        this.shadowRoot.appendChild(button);
    }

    disconnectedCallback() {
    }
}

customElements.define('my-button', mon_button);

class mon_footer extends HTMLElement {
    constructor() {
        super();
        var shadow = this.attachShadow({ mode: "open" });
    }

    connectedCallback() {
        const span = document.createElement('my-button');
        this.shadowRoot.appendChild(span);
    }

    disconnectedCallback() {
    }
}

customElements.define('mon-elem', mon_footer);

class connectionPage extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode: "open" });
    }

    connectedCallback() {
        const template = document.getElementById('connection-page-t');
        const clone = template.content.cloneNode(true);
        this.shadowRoot.appendChild(clone);
    }
}

customElements.define('connection-page', connectionPage);

function getCookie(name) {
    let cookieValue = null;
    const cookies = document.cookie.split(';');
    console.log(cookies);
    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i].trim();
        if (cookie.substring(0, name.length + 1) === (name + '=')) {
            cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
            break;
        }
    }
    return cookieValue;
}

class originalDiv extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode: "open" });
    }

    connectedCallback() {
        const csrftoken = getCookie('csrftoken');
        console.log(csrftoken);
        fetch('http://localhost:8002/check-test/', {
            headers: {
                'X-CSRFToken': csrftoken,
            },
                credentials: 'include'
        })
        .then(response => response.json())
        .then(data => {
            console.log(data.name);
            this.innerText = data.name;
        });
    }
}

customElements.define('original-div', originalDiv);
