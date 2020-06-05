<style>
  a, a :hover, a :visited {
    color: var(--blue);
  }

  #contact {
    background: var(--blue);
    padding-bottom: 200px;
  }

  #contact h2 {
    color: var(--yellow);
  }

  .container {
    display: flex;
    justify-content: center;
    width: 100%;
  }

  .card {
    display: grid;
    grid-template-columns: 1fr 2fr;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
    border-radius: var(--roundness);
    background: var(--white);
    margin-top: 2rem;
    padding: 1rem;
  }

  img {
    border-radius: 400px;
    width: 128px;
    height: 128px;
    border: 5px solid var(--red);
  }

  li {
    margin-bottom: .5rem;
  }
</style>
<section id="contact">
  <h2>Contact</h2>

  <p>
    This is a call to action!
  </p>

  <div class="container">
    <div class="card">
      <img src="logo.png" alt="Jake Coffman">
      <ul>
        <li><a href="https://twitter.com/nill">Twitter @nill</a></li>
        <li><a href="https://github.com/jakecoffman">Github jakecoffman</a></li>
        <li><a href="mailto:jake@jakecoffman.com">Email jake@jakecoffman.com</a></li>
      </ul>
    </div>
  </div>
</section>
