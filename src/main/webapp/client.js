
//changing body background for different pages
let paths = window.location.href.split('/');
if (paths[paths.length - 1] === 'signup' || paths[paths.length - 1] === 'login') {
	document.body.style.background = "linear-gradient(to bottom, #0f0c29, #302b63, #24243e)";
	document.body.style.minHeight = "100vh";
	document.title = paths[paths.length - 1];
}

const host = window.location.protocol + '//' + window.location.host;
// function that is executed on submitting signup form
async function SignupSubmit() {

	document.getElementById('loader').style.display = 'block';
	document.getElementById('verifybtn').style.display = 'none';

	const form = document.getElementById('signupform');
	const email = form.elements['email'].value;
	const password = form.elements['password'].value;
	const uname = form.elements['name'].value;

	//fetching response with entered details
	const response = await fetch(`${host}/auth/register`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({ uname, email, password })
	});

	let json = await response.json();

	if (json.success) {
		localStorage.setItem('token', json.token);
		document.getElementById('errormsg').innerHTML = " ";
		document.getElementById('errormsg').style.color = "rgb(9 241 0)";
		window.location.replace(`${host}`);

	} else {
		document.getElementById('verifybtn').style.display = 'block';
		document.getElementById('loader').style.display = "none";
		document.getElementById('errormsg').innerHTML = "User Already Exists";
	}
}

async function LoginSubmit() {

	document.getElementById('loader').style.display = 'block';
	document.getElementById('verifybtn').style.display = 'none';

	const form = document.getElementById('loginform');
	const email = form.elements['email'].value;
	const password = form.elements['password'].value;

	const response = await fetch(`${host}/auth/authenticate`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({ email, password })
	});
	console.log(response)
	let json = await response.json();
	console.log(json);
	if (json.success) {
		localStorage.setItem('token', json.token);
		document.getElementById('errormsg').innerHTML = "";
		document.getElementById('errormsg').style.color = "rgb(9 241 0)";
		window.location.replace(`${host}`);
	}
	else {
		document.getElementById('verifybtn').style.display = 'block';
		document.getElementById('loader').style.display = "none";
		document.getElementById('errormsg').innerHTML = "Invalid Credentials";
	}
}

// function for creating a blog
async function CreateBlog() {
	start();
	// getting form and authtoken
	const form = document.getElementById('createform');
	const authtoken = localStorage.getItem('token');

	// getting user id through fetch
	let response = await fetch(`${host}/auth/getuserid`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'Authorization': 'Bearer ' + authtoken
		}
	});
	console.log(response);
	let json = await response.json();

	if (json.success) {
		// appending userID to form and submitting
		const ID = document.createElement('input');
		const AUTHOR = document.createElement('input');
		ID.setAttribute('type', 'text');
		AUTHOR.setAttribute('type', 'text');
		ID.setAttribute('value', json.id);
		AUTHOR.setAttribute('value', json.author);
		ID.style.display = "none";
		AUTHOR.style.display = "none";
		ID.setAttribute('name', 'id');
		AUTHOR.setAttribute('name', 'author');
		form.appendChild(ID);
		form.appendChild(AUTHOR);
 		var xhr = new XMLHttpRequest();
		xhr.open("POST", `${host}/create`);
		xhr.onload = function(event) {
			        window.location.replace(`${host}`);
		};
		var formData = new FormData(form);
		xhr.send(formData);
	}
}

// function for creating a blog
async function UpdateBlog() {
 	// getting form and authtoken
	const form = document.getElementById('myUpdateform');
  
 		var xhr = new XMLHttpRequest();
		xhr.open("POST", `${host}/updateblog`);
		xhr.onload = function(event) {
			        window.location.replace(`${host}`);
		};
		var formData = new FormData(form);
		xhr.send(formData);

}

// function to show preive image in forms
function showimage(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('imgupload').setAttribute('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
function makeprogress() {
	const myel = document.getElementById('cprogress-done');
	var width = 0;
	const prog = setInterval(move, 8);
	function move() {
		if (width == 100) {
			clearInterval(prog);
		}
		else {
			width++;
			myel.style.width = width + "%";
			myel.textContent = width + "%";
		}
	}
}
function start() {
	let myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {});
	myModal.show();
	makeprogress();
}
 