<h1>CF 1326D2</h1>
<p><time>2020-03-26 15:37</time> by zsz12251665</p>
<section>
	<h2>Problem</h2>
	<ul class="buttonList">
		<a target="_blank" href="https://vjudge.net/problem/CodeForces-1326D2"><li>Virtual Judge</li></a>
		<a target="_blank" href="https://www.luogu.com.cn/problem/CF1326D2"><li>Luogu</li></a>
		<a target="_blank" href="https://codeforces.com/problemset/problem/1326/D2"><li>Codeforces</li></a>
	</ul>
</section>
<section>
	<h2>Solution</h2>
	<p>Since <data value="o{|}v{s}o{|}o{&le;}c{10}p{c{6}}"></data> now, we cannot use the <data value="o{O}o{(}o{|}v{s}o{|}p{c{2}}o{)}"></data> algorithm in <a href="/codes/?oj=CF&pid=1326D1">CF 1326D1</a> or you will get a <abbr title="Time Limit Exceeded">TLE</abbr>. </p>
	<p>Just like we did in the easy version, we find the longest prefix which is symmetric to the suffix of the same length and the longest palindrome which is a prefix or suffix of the remained part. To find the palindrome in <data value="o{O}o{(}o{|}v{s}o{|}o{)}"></data>, we need the Manacher's algorithm. </p>
	<p>First of all, the algorithm add a place holder, such as "#", at the both end and between each letters. This is to transform all the palindromes to palindromes with odd number of characters so that all of them has a centre character. For example, "ABBA" becomes "#A#B#B#A#" and "ABCBA" becomes "#A#B#C#B#A#". Let's call the new string <data value="v{t}"></data>. </p>
	<p>Secondly we need another array <data value="v{r}"></data>, which <data value="v{r}b{v{i}}"></data> is the "radius" of the longest palindrome with its centre at <data value="v{t}b{v{i}}"></data> (In fact, it also equals to 1 plus the length of the corresponding palindrome in the original string). So if the original string is "AABACCA", we will have the following table: </p>
	<table style="margin: auto; text-align: center;">
		<tbody>
			<tr>
				<th><data value="v{t}"></data></th>
				<td>#</td>
				<td>A</td>
				<td>#</td>
				<td>A</td>
				<td>#</td>
				<td>B</td>
				<td>#</td>
				<td>A</td>
				<td>#</td>
				<td>C</td>
				<td>#</td>
				<td>C</td>
				<td>#</td>
				<td>A</td>
				<td>#</td>
			</tr>
			<tr>
				<th><data value="v{r}"></data></th>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>4</td>
				<td>1</td>
				<td>2</td>
				<td>1</td>
				<td>2</td>
				<td>5</td>
				<td>2</td>
				<td>1</td>
				<td>2</td>
				<td>1</td>
			</tr>
		</tbody>
	</table>
	<p>But how to calculate <data value="v{r}b{v{i}}"></data>? Of course you can try it one by one, but it will make the algorithm become <data value="o{O}o{(}o{|}v{s}o{|}p{c{2}}o{)}"></data>. We need some optimization here. We will have to define another two variables <data value="v{mx}"></data> and <data value="v{ce}"></data>. <data value="v{mx}"></data> is the position of the next character of the rightmost character in all the palindrome we have found. In another word, it is next to the rightmost character which has been compared with the previous characters while finding palindromes. And <data value="v{ce}"></data> is the centre of the (longest) palindrome which ends at <data value="v{mx}"></data>. So <data value="v{mx}o{=}v{ce}o{+}v{r}b{v{ce}}"></data>. When we are calculating <data value="v{r}b{v{i}}"></data>, check whether <data value="v{i}o{&lt;}v{mx}"></data>. If do, we can save some time by getting some information from its symmetric point <data value="o{(}c{2}o{}v{ce}o{-}v{i}o{)}"></data>, which means we can start from <data value="o{min}o{(}v{mx}o{-}v{i}o{,}v{r}b{c{2}o{}v{ce}o{-}v{i}}o{)}"></data> (in case that the symmetric palindrome include some part more than the palindrome centred in <data value="v{ce}"></data>, we need to limit it within <data value="o{(}v{mx}o{-}v{i}o{)}"></data>). Otherwise we still need to start from <data value="c{1}"></data>. In this way, we save a large amount of work so that we could calculate all the <data value="v{r}b{v{i}}"></data> in <data value="o{O}o{(}o{|}v{t}o{|}o{)}"></data>. Then we can find the longest palindrome which is a prefix or suffix of <data value="v{t}"></data> by enumerating the centre position in another <data value="o{O}o{(}o{|}v{t}o{|}o{)}"></data>. </p>
</section>
<section>
	<h2>Code</h2>
	<section>
		<h3>Pascal</h3>
		<code lang="pas"></code>
	</section>
	<section>
		<h3>C++</h3>
		<code lang="cpp"></code>
	</section>
</section>
