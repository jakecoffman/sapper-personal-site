<script>
  export let title;
  export let link;
  export let image;
  export let video;
  export let links;
  export let text;
</script>

<div class="card">
  <a class="card-link" href={link}>
    {#if image}
      <img class="p-img" alt={title} src={image} loading="lazy">
    {/if}
    {#if video}
      <video class="p-img" playsinline autoplay muted loop>
        <source src={video} type="video/mp4">
      </video>
    {/if}
  </a>
  <div class="project-text">
    <h3>{title}</h3>
    <p class="grow">
      {text}
    </p>
  </div>
  <ul class="links">
    {#each links as link}
      <li>
        <a href={link.href} target="_blank" rel="noopener" class="btn">
          {link.name}
        </a>
      </li>
    {/each}
  </ul>
</div>

<style>
  h3 {
    color: var(--blue);
    margin-bottom: .2rem;
    text-shadow: none;
  }

  .card-link {
    width: 100%;
  }

  .p-img {
    object-fit: cover;
    border-radius: var(--roundness) var(--roundness) 0 0;
    width: 100%;
  }

  .project-text {
    font-size: 11pt;
    padding: 0.5rem;
    display: flex;
    flex-direction: column;
    height: 100%;
    justify-content: space-between;
  }

  .card {
    width: 100%;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
    border-radius: var(--roundness);
    margin-bottom: 1rem;
    display: flex;
    flex-direction: column;
    background: var(--white);
  }

  .card p {
    margin: 0;
    color: #545454;
  }

  .card:hover {
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  }

  @media (min-width: 695px) {
    .p-img {
      height: 200px;
    }
  }

  .links {
    font-size: 10pt;
    /*border-top: 1px solid #cbcbcb;*/
    width: 100%;
    display: flex;
    justify-content: space-evenly;
    list-style: none;
    margin: 0;
    padding: 1rem 0;
  }

  li a {
    color: var(--blue);
    font-weight: bolder;
    transition: all .5s;
  }

  li a:hover {
    background: var(--yellow);
    color: white;
  }
</style>
