// The highlights of function names and variables are still missing
window.addEventListener('DOMContentLoaded', LoadHighlight);
// Append the style sheet
document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/add-on/highlight/highlight.css" />';

function LoadHighlight() {
	// Load the request
	var request = JSON.parse('{' + location.search.slice(1).replace(/([^&=]*)=([^&]*)/g, '"$1":"$2"').replace(/&/g, ',') + '}');
	if ((!document.querySelector('code')) || (!request.oj) || (!request.pid))
		return;
	// Load and highlight the codes
	var ajax = new XMLHttpRequest();
	ajax.open('GET', '/codes/' + request.oj + '/' + request.pid + '.code', true);
	ajax.onreadystatechange = function () {
		if ((ajax.readyState != 4) || (ajax.status != 200))
			return;
		for (let t = 0, code = document.querySelectorAll('code'), codeText = ajax.responseText.split('\n\n'); t < code.length; t++) {
			// Highlight comments and constants
			let source = codeText[t].replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/(\"[^\n]*?\"|\'[^\n]*?\')/g, '<span class="constant">$1</span>').replace(/\b([0-9][.0-9]*|maxint|maxlongint|true|false)\b/g, '<span class="constant">$1</span>').replace(/(\/\/[^\n]*)/g, '<span class="comment">$1</span>');
			// Highlight keywords
			if (code[t].lang == 'cpp')
				var keywordList = ['asm', 'auto', 'bool', 'break', 'case', 'catch', 'char', 'const', 'continue', 'default', 'define', 'delete', 'do', 'double', 'else', 'enum', 'explicit', 'extern', 'float', 'for', 'friend', 'goto', 'if', 'include', 'inline', 'int', 'long', 'mutable', 'namespace', 'new', 'null', 'operator', 'private', 'protected', 'public', 'register', 'return', 'short', 'signed', 'sizeof', 'static', 'struct', 'switch', 'template', 'this', 'throw', 'try', 'typedef', 'union', 'unsigned', 'using', 'virtual', 'void', 'volatile', 'while'];
			if (code[t].lang == 'pas')
				var keywordList = ['and', 'ansistring', 'array', 'asm', 'begin', 'boolean', 'break', 'case', 'char', 'const', 'continue', 'div', 'do', 'double', 'downto', 'else', 'end', 'file', 'float', 'for', 'function', 'goto', 'if', 'in', 'inline', 'int64', 'integer', 'label', 'longint', 'mod', 'nil', 'not', 'object', 'of', 'operator', 'or', 'procedure', 'program', 'record', 'repeat', 'set', 'shl', 'shr', 'single', 'string', 'then', 'to', 'type', 'unit', 'until', 'uses', 'var', 'while', 'with', 'xor'];
			for (let keyword of keywordList)
				source = source.replace(RegExp('\\b(' + keyword + ')\\b', 'g'), '<span class="keyword">$1</span>');
			// Highlight commas
			for (let i = 0; i < source.length; i++) {
				for (let comma of ['!', '@', '#', '$', '%', '^', '+', '-', '*', '/', '(', ')', '=', '[', ']', '{', '}', '|', ',', '.', ';', ':', '\\', '?'])
					source = (source[i] == comma) ? source.slice(0, i) + '<span class="comma">' + comma + '</span>' + source.slice(i + 1) : source;
				// Skip tags
				if (source[i] == '<') {
					for (; (i < source.length) && (source[i] != '>'); i++);
					for (; (i < source.length) && (source[i] != '<'); i++);
					for (; (i < source.length) && (source[i] != '>'); i++);
				}
			}
			source = source.replace(/&(amp|lt|gt)<span class="comma">;<\/span>/g, '<span class="comma">&$1;</span>');
			code[t].innerHTML = source;
		}
		// Clear highlights in comments and constants
		for (let element of document.querySelectorAll('code span.comment, code span.constant'))
			element.innerHTML = element.innerHTML.replace(/<\/?span( class="[a-z]*")?>/g, '');
	}
	ajax.send();
	// Initialize the session storage value
	sessionStorage.setItem('softTab', request.softTab || sessionStorage.getItem('softTab') || 'false');
	// Append the soft tab panel
	var softTabPanel = document.createElement('div');
	softTabPanel.innerHTML = '<input type="checkbox" />Soft Tab (replace tabs with 4 spaces)';
	document.querySelector('nav').appendChild(softTabPanel);
	var softTab = softTabPanel.querySelector('input');
	softTab.checked = String(sessionStorage.getItem('softTab')) == 'true';
	// Set the soft tab panel function
	softTab.onclick = function () {
		sessionStorage.setItem('softTab', String(softTab.checked));
		for (let code of document.querySelectorAll('code'))
			code.innerHTML = softTab.checked ? code.innerHTML.replace(/\t/g, '&nbsp;&nbsp;&nbsp;&nbsp;') : code.innerHTML.replace(/(&nbsp;){4}/g, '\t');
	};
	// Initialize soft tab
	softTab.onclick();
}
