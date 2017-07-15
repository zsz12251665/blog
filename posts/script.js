if(location.href.indexOf('?title=')!=-1)
	load(location.href.split('?title=')[1].split('&')[0]);
function load(title)
{
	for(var i=0;i<title.length;i++)
		if(title[i]=='_')
			title[i]=' ';
	var request=new XMLHttpRequest();
	request.open('GET','/posts/'+title+'/text.xml',false);
	request.send();
	if(request.status!=200)
		return;
	var XMLDoc=request.responseXML;
	request.open('GET','/posts/teplate.xsl',false);
	request.send();
	var XSLDoc=request.responseXML;
	var processer=new XSLTProcessor();
	processer.importStyleSheet(XSLDoc);
	document.getElementById('text').innerHTML=processer.transformToDocument(XMLDoc).innerHTML;
}
