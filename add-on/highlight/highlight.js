// The highlights of function names and variables are still missing
window.addEventListener('DOMContentLoaded', LoadHighlight);
// Append the style sheet
document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/add-on/highlight/highlight.css" />';

function LoadHighlight()
{
	// Load the request
	var request = JSON.parse('{' + location.search.slice(1).replace(/([^&=]*)=([^&]*)/g, '"$1":"$2"').replace(/&/g, ',') + '}');
	if (!document.querySelector('code') || !request.oj || !request.pid)
		return;
	// Initialize the session storage value of soft tab
	sessionStorage.setItem('highlight.softTab', request.softTab || sessionStorage.getItem('highlight.softTab') || 'false');
	// Load and highlight the codes
	var ajax = new XMLHttpRequest();
	ajax.open('GET', '/codes/' + request.oj + '/' + request.pid + '.code', true);
	ajax.onreadystatechange = function ()
	{
		if (ajax.readyState != 4 || ajax.status != 200)
			return;
		for (let t = 0, code = document.querySelectorAll('code'), codeText = ajax.responseText.split('\n\n'); t < code.length; ++t)
		{
			// Highlight constants
			let source = codeText[t].replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/(\"[^\n]*?\"|\'[^\n]*?\')/g, '<span class="constant">$1</span>').replace(/\b([0-9][.0-9]*|maxint|maxlongint|true|false)\b/g, '<span class="constant">$1</span>');
			// High light comments
			if (code[t].lang == 'cpp')
				for (let i = 0; i < source.length - 1; ++i)
					if (source[i] == '/')
					{
						//Single line comment
						if (source[i + 1] == '/')
						{
							source = source.slice(0, i) + '<span class="comment">' + source.slice(i);
							for (; i < source.length && source[i] != '\n'; ++i);
							source = source.slice(0, i) + '</span>' + source.slice(i);
							continue;
						}
						//Block comment
						if (source[i + 1] == '*')
						{
							source = source.slice(0, i) + '<span class="comment">' + source.slice(i);
							for (i += 2; i < source.length && (source[i - 1] != '*' || source[i] != '/'); ++i);
							source = source.slice(0, i + 1) + '</span>' + source.slice(i + 1);
							continue;
						}
					}
			if (code[t].lang == 'pas')
				for (let i = 0; i < source.length - 1; ++i)
				{
					//Single line comment
					if (source[i] == '/' && source[i + 1] == '/')
					{
						source = source.slice(0, i) + '<span class="comment">' + source.slice(i);
						for (; i < source.length && source[i] != '\n'; ++i);
						source = source.slice(0, i) + '</span>' + source.slice(i);
						continue;
					}
					//Block comment
					if (source[i] == '{')
					{
						source = source.slice(0, i) + '<span class="comment">' + source.slice(i);
						for (i += 2; i < source.length && source[i] != '}'; ++i);
						source = source.slice(0, i + 1) + '</span>' + source.slice(i + 1);
						continue;
					}
				}
		// Highlight keywords
		if (code[t].lang == 'cpp')
			for (let keyword of ['asm', 'auto', 'bool', 'break', 'case', 'catch', 'char', 'const', 'continue', 'default', 'define', 'delete', 'do', 'double', 'else', 'enum', 'explicit', 'extern', 'float', 'for', 'friend', 'goto', 'if', 'include', 'inline', 'int', 'long', 'mutable', 'namespace', 'new', 'null', 'operator', 'private', 'protected', 'public', 'register', 'return', 'short', 'signed', 'sizeof', 'static', 'struct', 'switch', 'template', 'this', 'throw', 'try', 'typedef', 'union', 'unsigned', 'using', 'virtual', 'void', 'volatile', 'while'])
				source = source.replace(RegExp('\\b(' + keyword + ')\\b', 'g'), '<span class="keyword">$1</span>');
		if (code[t].lang == 'pas')
			for (let keyword of ['and', 'ansistring', 'array', 'asm', 'begin', 'boolean', 'break', 'case', 'char', 'const', 'continue', 'div', 'do', 'double', 'downto', 'else', 'end', 'file', 'float', 'for', 'function', 'goto', 'if', 'in', 'inline', 'int64', 'integer', 'label', 'longint', 'mod', 'nil', 'not', 'object', 'of', 'operator', 'or', 'procedure', 'program', 'record', 'repeat', 'set', 'shl', 'shr', 'single', 'string', 'then', 'to', 'type', 'unit', 'until', 'uses', 'var', 'while', 'with', 'xor'])
				source = source.replace(RegExp('\\b(' + keyword + ')\\b', 'g'), '<span class="keyword">$1</span>');
		// Highlight commas
		for (let i = 0; i < source.length; ++i)
		{
			for (let comma of ['!', '@', '#', '$', '%', '^', '+', '-', '*', '/', '(', ')', '=', '[', ']', '{', '}', '|', ',', '.', ';', ':', '\\', '?'])
				source = (source[i] == comma) ? source.slice(0, i) + '<span class="comma">' + comma + '</span>' + source.slice(i + 1) : source;
			// Skip tags
			if (source[i] == '<')
			{
				for (; i < source.length && source[i] != '>'; ++i);
				for (; i < source.length && source[i] != '<'; ++i);
				for (; i < source.length && source[i] != '>'; ++i);
			}
		}
		source = source.replace(/&(amp|lt|gt)<span class="comma">;<\/span>/g, '<span class="comma">&$1;</span>');
		// Set the soft tabs
		code[t].innerHTML = (sessionStorage.getItem('highlight.softTab') == 'true') ? source.replace(/\t/g, '&nbsp;&nbsp;&nbsp;&nbsp;') : source;
	}
	// Clear highlights in comments and constants
	for (let element of document.querySelectorAll('code span.comment, code span.constant'))
		element.innerHTML = element.innerHTML.replace(/<\/?span( class="[a-z]*")?>/g, '');
}
ajax.send();
}
