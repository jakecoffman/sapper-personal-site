<style>
  a, a :hover, a :visited {
    color: var(--blue);
  }

  #contact {
    background: var(--light-blue);
    background-image: url("/hex.svg");
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

  .logo {
    border-radius: 400px;
    width: 128px;
    height: auto;
    border: 5px solid var(--red);
  }

  @media (max-width: 695px) {
    .card {
      grid-template-columns: 1fr;
    }
    .logo {
      display: none;
    }
    ul {
      padding: 0;
    }
  }

  ul {
    list-style: none;
    display: grid;
    grid-gap: 1rem;
  }

  a {
    height: 2rem;
    display: flex;
    align-items: center;
  }

  a > img {
    margin-right: 1rem;
  }

  .center {
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
<section id="contact">
  <h2>Contact</h2>

  <p>
    This is a call to action!
  </p>

  <div class="container">
    <div class="card">
      <span class="center">
        <img class="logo" src="logo.png" alt="Jake Coffman">
      </span>
      <ul>
        <li><a href="https://twitter.com/nill">
          <img src="twitter.svg" alt="twitter" class="center">
          <span>@nill</span>
        </a></li>
        <li><a href="https://github.com/jakecoffman">
          <img src="github.svg" alt="github">
          <span>jakecoffman</span>
        </a></li>
        <li><a href="mailto:jake@jakecoffman.com">
          <img src="email.svg" alt="email">
          <span>jake@jakecoffman.com</span>
        </a></li>
      </ul>
    </div>
  </div>
</section>
