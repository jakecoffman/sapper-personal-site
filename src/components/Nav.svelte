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

  .jakecoffman {
    margin-left: 1rem;
  }

  @media (max-width: 695px) {
    header {
      font-size: .85rem;
    }

    .jakecoffman {
      display: none;
    }
  }

  ul {
    display: flex;
    gap: 1rem;
    list-style: none;
    margin: 0;
    padding: 0;
  }

  a {
    color: var(--white);
    transition: color .5s;
  }

  a:hover {
    color: var(--red);
  }
</style>

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
        <a href="#contact">Contact</a>
      </li>
      <li>
        <a href="https://www.jakecoffman.com/blog">Blog</a>
      </li>
    </ul>
  </nav>
</header>
