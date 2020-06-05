<script>
	import Hero from "../components/Hero.svelte";
	import Projects from "../components/Projects.svelte";
	import Intro from "../components/Intro.svelte";
	import QA from "../components/QA.svelte";
	import Contact from "../components/Contact.svelte";
</script>
<style>
	header a {
		color: white;
	}
</style>

<svelte:head>
	<title>Jake Coffman</title>
</svelte:head>

<header>
	<a class="jakecoffman" href="https://jakecoffman.com">jakecoffman.com</a>
	<div class="grow"></div>
	<nav>
		<ul>
			<li>
				<a href="#intro">Intro</a>
			</li>
			<li>
				<a href="#projects">Projects</a>
			</li>
			<li>
				<a href="#qa">Q&A</a>
			</li>
			<li>
				<a href="https://www.jakecoffman.com/blog">Blog</a>
			</li>
		</ul>
	</nav>
</header>
<article>
	<Hero/>
	<Intro/>
	<Projects/>
	<QA/>
	<Contact/>
</article>
