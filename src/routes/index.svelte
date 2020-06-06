<script>
	import Hero from "../components/Hero.svelte";
	import Projects from "../components/Projects.svelte";
	import Intro from "../components/Intro.svelte";
	import QA from "../components/QA.svelte";
	import Contact from "../components/Contact.svelte";
</script>
<style>
	header {
		display: flex;
		align-items: center;
		background: black;
		color: white;
		padding: 0.5rem;
		height: 1.5rem;
		z-index: 3;
	}
	@media (max-width: 695px) {
		header {
			font-size: .85rem;
		}
	}
	header ul {
		display: flex;
		list-style: none;
		margin: 0;
		padding: 0;
	}
	header li {
		margin-left: 0.5rem;
	}
	header a {
		color: white;
	}
	nav ul {
		list-style: none;
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
