// b = sub; c = constant; f = fraction; i = inline block; l = line; m = matrix; o = operator; p = super; t = top line; v = variable
window.addEventListener('DOMContentLoaded', LoadMath);
// Append the style sheet
document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/add-on/math/math.css" />';

function LoadMath()
{
	// Load the request
	var request = JSON.parse('{' + location.search.slice(1).replace(/([^&=]*)=([^&]*)/g, '"$1":"$2"').replace(/&/g, ',') + '}');
	// Initialize the session storage value of large brackets
	sessionStorage.setItem('math.largeBrackets', request.largeBrackets || sessionStorage.getItem('math.largeBrackets') || 'false');
	// Load the expressions
	for (let data of document.querySelectorAll('data'))
		data.innerHTML = data.value.replace(/\\(.)/g, '$1\\').replace(/([a-z])\{(?!\\)/g, '<span class="$1">').replace(/\}(?!\\)/g, '</span>').replace(/(.)\\/g, '$1');
	// Scale the bracket beside the matrix
	if (sessionStorage.getItem('math.largeBrackets') == 'true')
		for (let data of document.querySelectorAll('data'))
			for (let matrix of data.querySelectorAll('span.m'))
			{
				if (matrix.nextSibling && matrix.nextSibling.innerText.match(/[\(\)\[\]\|]/))
					matrix.nextSibling.style.fontSize = String(matrix.querySelectorAll('span.l:empty').length + 1) + 'em';
				if (matrix.previousSibling && matrix.previousSibling.innerText.match(/[\(\)\[\]\|]/))
					matrix.previousSibling.style.fontSize = String(matrix.querySelectorAll('span.l:empty').length + 1) + 'em';
			}
}
