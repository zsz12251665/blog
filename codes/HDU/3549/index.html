<h1>HDU 3549</h1>
<p><time>2020-01-25 13:26</time> by zsz12251665</p>
<section>
	<h2>Problem</h2>
	<ul class="buttonList">
		<a target="_blank" href="https://vjudge.net/problem/HDU-3549"><li>Virtual Judge</li></a>
		<a target="_blank" href="http://acm.hdu.edu.cn/showproblem.php?pid=3549"><li>HDU</li></a>
	</ul>
</section>
<section>
	<h2>Solution</h2>
	<p>As the title describes, this problem is a template of the maximum flow in a network. There are 4 types of algorithm to solve this problem, which are improved step by step. </p>
	<p>The first one is <a href="javascript:void(0);" onclick="window.scrollTo(document.querySelector('section#FF').offsetLeft,document.querySelector('section#FF').offsetTop);">the Ford-Fulkerson algorithm</a>. Ford-Fulkerson is based on an idea that we can keep adding new flows until there is no flow available. The following code provided is using <abbr title="Depth-First Search">DFS</abbr> as the searching function. Sometimes the flow you find might be different from the maximum flow so we might need to revert some flows (or part of them). So we build inverse edges to revert the flow. Different from the normal edges, the capacity of the inverse edges is set to 0 by default. When you find a flow, subtract it from the capacity of the edges it passed and add it to the ones of their inverse edges in order to make sure the sum of their capacity is the same. </p>
	<p>P. S. Using DFS directly is certainly not a good idea here. The DFS version of Ford-Fulkerson is the only one which failed to pass this problem. It got a <abbr title="Time Limit Exceeded">TLE</abbr>. </p>
	<p>The second one is <a href="javascript:void(0);" onclick="window.scrollTo(document.querySelector('section#EK').offsetLeft,document.querySelector('section#EK').offsetTop);">the Edmonds-Karp algorithm</a>. Edmonds-Karp shares the same idea with Ford-Fulkerson (In fact, Ford-Fulkerson is a method rather than an algorithm). The only improvement is that Edmonds-Karp uses <abbr title="Breadth-First Search">BFS</abbr> as the searching function. However, since BFS has a more stable time complexity as well as a non-recursive procedure, it is a much better idea than using DFS. The time complexity of Edmonds-Karp is <data value="o{O}o{(}v{n}o{}v{m}p{c{2}}o{)}"></data>, which <data value="v{n}"></data> is the number of the points and <data value="v{m}"></data> is the number of edges (These definitions will be applied to the following algorithm as well). Every time you run a BFS, at least one edge should be exhausted. So a BFS with in <data value="o{O}o{(}v{n}o{}v{m}o{)}"></data> could be executed at most <data value="o{O}o{(}v{m}o{)}"></data> times. </p>
	<p>The third one is <a href="javascript:void(0);" onclick="window.scrollTo(document.querySelector('section#Dinic').offsetLeft,document.querySelector('section#Dinic').offsetTop);">the Dinic's algorithm</a>. Dinic is more effective with a <data value="o{O}o{(}v{n}p{c{2}}o{}v{m}o{)}"></data> time complexity. We know that some flows might be independent to each other. So instead of searching for only one augment path in a BFS, Dinic finds multi augment paths within one BFS. It uses a BFS from the end point to split the network into several levels. And then a DFS is used to search augment paths by jumping from high levels to low levels. However, the level of a point might change after some edges exhausted. So when DFS cannot find a new augment path to enlarge the flow, we will renew the levels by running another BFS until we cannot reach the start point from the end point with edges not exhausted anymore. </p>
	<p>I suppose there is another way to understand Dinic. It improved the way how DFS searches in Ford-Fulkerson. Instead of searching blindly, the BFS from the end point splits the network into several levels which show the shortest distance from any point to the ending point so that we can use it as a compass when running DFS. Both the DFS and BFS part take <data value="o{O}o{(}v{n}o{}v{m}o{)}"></data> to run. And every time we cannot find a new augment path it means all the edges connected to a certain point or more has been exhausted. There are <data value="v{n}"></data> points in the graph, so the time complexity should be <data value="o{O}o{(}v{n}p{c{2}}o{}v{m}o{)}"></data>. </p>
	<p>There is an optimization to Dinic, called current edge optimization (or cur optimization for short). When you have found an augment path with DFS and start a new DFS, you don't have to start from the very beginning. You can start with the previous augment path by recording the latest edge you visit from every point. Or you can continue to search the other edges with the remain flow rather end the DFS and return the current flow. </p>
	<p>The last one is <a href="javascript:void(0);" onclick="window.scrollTo(document.querySelector('section#ISAP').offsetLeft,document.querySelector('section#ISAP').offsetTop);">the ISAP Algorithm</a>. <abbr title="Improved Shortest Augment Path">ISAP</abbr> has the same time complexity as Dinic (just like improvement from Bellman-Ford to <abbr title="Shortest Path Faster Algorithm">SPFA</abbr>), but saves the time running BFS. In fact, the only a few points change their levels when a new BFS is executed in Dinic. And they managed to make the changes in DFS part so that BFS just need to run once to initialize the levels. And the following is how they change the level of point in a DFS: When you reach a point and find that there are no new augment paths through this point anymore, it is time to update its level. According to the second way to understand Dinic, we know that the level shows the distance from the point to the end point. So we just enumerate all the points beside it (directly connected to it) and update its level with the minimum level of those points plus 1. </p>
	<p>There is also an optimization to ISAP, which is called the gap optimization. Because ISAP update the levels when running DFS, there might be some situations that there is no augment path anymore but ISAP has not noticed that the end point is unreachable from the start point yet until the start point has a big enough level. So we record the number of the points on each level and when a gap is found (a level has no points left), we know that the start point and the end point is no longer connected. This is because for while updating, the level of a point must be increasing. </p>
</section>
<section>
	<h2>Code</h2>
	<section id="FF">
		<h3>Ford-Fulkerson</h3>
		<section>
			<h4>Pascal</h4>
			<code lang="pas"></code>
		</section>
		<section>
			<h4>C++</h4>
			<code lang="cpp"></code>
		</section>
	</section>
	<section id="EK">
		<h3>Edmonds-Karp</h3>
		<section>
			<h4>Pascal</h4>
			<code lang="pas"></code>
		</section>
		<section>
			<h4>C++</h4>
			<code lang="cpp"></code>
		</section>
	</section>
	<section id="Dinic">
		<h3>Dinic</h3>
		<section>
			<h4>Pascal</h4>
			<code lang="pas"></code>
		</section>
		<section>
			<h4>C++</h4>
			<code lang="cpp"></code>
		</section>
	</section>
	<section id="ISAP">
		<h3>ISAP</h3>
		<section>
			<h4>Pascal</h4>
			<code lang="pas"></code>
		</section>
		<section>
			<h4>C++</h4>
			<code lang="cpp"></code>
		</section>
	</section>
</section>
