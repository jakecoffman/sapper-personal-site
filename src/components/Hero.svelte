<style>
	h1 {
		font-size: 12vw;
		margin: 0;
		padding-top: 1rem;
		text-shadow: 4px 8px var(--red), 8px 12px black;
	}

	.heroic {
		transform: matrix(1, 0.10, 0, 1, 0, 0);
		font-variant: small-caps;
		color: var(--yellow);
		text-align: center;
		font-weight: bolder;
		text-shadow: 4px 6px var(--red), 6px 10px black;
	}

	.tagline {
		font-size: 5vw;
		text-shadow: 2px 4px var(--red), 4px 8px black;
	}

	#hero {
		background: var(--blue);
		color: white;
		padding: 4rem 2rem 8rem;
	}

	#logo {
		position: absolute;
		top: 70px;
		right: 10px;
		display: block;
		width: 64px;
		height: auto;
		border-radius: 100%;
		border: 5px solid var(--yellow);
	}
</style>

<section id="hero">
	<img alt="Jake Coffman" src="logo.png" id="logo">
	<div class="heroic">
		<h1>Jake Coffman</h1>
		<span class="tagline">Software Developer</span>
	</div>
	<style>
		.embolden {
			color: black;
			font-weight: bolder;
			font-style: italic;
		}
	</style>
</section>
