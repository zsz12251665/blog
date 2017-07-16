<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
				<link rel="shortcut icon" href="/blog.png"/>
				<title><xsl:value-of select="/page/title"/> - &#169;zsz12251665's Blog</title>
				<link rel="stylesheet" type="text/css" href="/style.css"/>
			</head>
			<body>
				<div id="mainframe">
					<h1>zsz12251665's blog</h1>
					<p>Hello, welcome to zsz12251665's blog. </p>
					<hr/>
					<table width="100%">
						<td valign="top" id="bar"><div id="menu"></div></td>
						<td valign="top" id="text"><xsl:copy-of select="/page/html"/></td>
					</table>
					<center><var>&#169; 2017 zsz12251665. Powered by zsz12251665. Theme by zsz12251665. </var></center>
				</div>
				<script type="text/javascript" src="/menu.js"></script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>