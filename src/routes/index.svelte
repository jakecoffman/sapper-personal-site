<script>
	import Hero from "../components/Hero.svelte";
	import Projects from "../components/Projects.svelte";
	import Intro from "../components/Intro.svelte";
	import QA from "../components/QA.svelte";
	import Contact from "../components/Contact.svelte";
	import Nav from "../components/Nav.svelte";
</script>

<svelte:head>
	<title>Jake Coffman</title>
</svelte:head>

<Nav/>
<article>
	<Hero/>
	<Intro/>
	<Projects/>
	<QA/>
	<Contact/>
</article>
