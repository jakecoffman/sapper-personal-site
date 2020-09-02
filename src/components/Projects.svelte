<style>
  #projects {
    background: var(--light-blue);
    background-image: url("/hex.svg");
  }

  #projects h2 {
    color: var(--yellow);
  }

  .cards {
    display: grid;
  }

  @media (min-width: 695px) {
    .cards {
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      grid-gap: 1rem;
    }
  }
</style>
<section id="projects">
  <h2>Projects</h2>

  <p>
    This is a small selection of projects that I have worked on to learn new skills
    or scratch an itch.
  </p>
  <p>
    There are many more projects over at my Github:
    <a href="https://github.com/jakecoffman">https://github.com/jakecoffman</a>
  </p>

  <div class="cards">
    {#each projects as project}
      <Card {...project}/>
    {/each}
  </div>
</section>
<script>
  import Card from "./Card.svelte";

  const projects = [{
    title: 'STL Devs',
    link: 'https://stldevs.com',
    image: 'stldevs.png',
    text: 'This is a site for discovering what open source work developers are doing in the Greater St. Louis region by harvesting public information from Github.',
    links: [{
      href: 'https://stldevs.com',
      name: 'Visit'
    }]
  }, {
    title: 'Tank Game',
    link: 'https://github.com/jakecoffman/tanks-unity/releases',
    image: 'tanks.png',
    text: 'A multi-player game created with Unity. Think Wii Tanks but online, and with mouse and keyboard.',

    links: [{
      href: 'https://github.com/jakecoffman/tanks-unity/releases',
      name: 'Download'
    }, {

      href: 'http://github.com/jakecoffman/tanks-unity',
      name: 'Source'
    }]
  }, {
    title: 'Tanklets',
    link: 'https://github.com/jakecoffman/tanklets/releases',
    image: 'tanklets.png',
    text: 'Another Tank Game but written from scratch in Go. I used no game engine, had to learn OpenGL and ported Chipmunk2D for this project.',

    links: [{
      href: 'https://github.com/jakecoffman/tanklets/releases',
      name: 'Download'
    }, {
      href: 'http://github.com/jakecoffman/tanklets',
      name: 'Source'
    }]
  }, {
    title: 'fam',
    link: 'https://github.com/jakecoffman/fam',
    video: 'fam.mp4',
    text: 'Another OpenGL game I am making to play with the kiddos.',

    links: [{
      href: 'https://github.com/jakecoffman/fam',
      name: 'Source'
    }]
  }, {
    title: 'Chipmunk Port',
    link: 'https://www.jakecoffman.com/cpebiten/',
    image: 'cp.gif',
    text: 'Go port of the excellent Chipmunk2D, originally in C.',
    links: [{
      href: 'https://www.jakecoffman.com/cpebiten/',
      name: 'Demo'
    },{
      href: 'https://github.com/jakecoffman/cp',
      name: 'Source'
    }]
  }, {
    title: 'Matchville',
    link: 'https://set.jakecoffman.com',
    image: 'setgame.png',
    text: 'Online multi-player set finding card game.',

    links: [{
      href: 'https://set.jakecoffman.com',
      name: 'Play'
    }, {
      href: 'https://github.com/jakecoffman/set-game',
      name: 'Source'
    }]
  }, {
    title: 'Colors',
    link: 'https://www.jakecoffman.com/colors',
    image: 'coloretto.png',
    text: 'Local multi-player color matching game.',

    links: [{
      href: 'http://www.jakecoffman.com/colors',
      name: 'Play'
    }, {
      href: 'https://github.com/jakecoffman/colors',
      name: 'Source'
    }]
  }, {
    title: 'Memory',
    link: 'https://www.jakecoffman.com/memory',
    image: 'memory.png',
    text: "Local multi-player kid's game.",

    links: [{
      href: 'http://www.jakecoffman.com/memory',
      name: 'Play'
    }, {
      href: 'https://github.com/jakecoffman/memory',
      name: 'Source'
    }]
  }, {
    title: 'Spy Game',
    link: 'https://resistance.jakecoffman.com',
    image: 'resistance.png',
    text: 'Multi-player game of intrigue. This is a good game to play over web-chat during a pandemic.',

    links: [{
      href: 'https://resistance.jakecoffman.com',
      name: 'Play'
    }, {
      href: 'http://github.com/jakecoffman/resistance',
      name: 'Source'
    }]
  }, {
    title: 'Carman',
    link: 'https://www.jakecoffman.com/carman/',
    image: 'carman.jpg',
    text: 'Local multi-player pacman style game. Plug in 4 controllers! Built with Phaserjs.',
    links: [{
      href: 'https://www.jakecoffman.com/carman/',
      name: 'Play'
    }, {
      href: 'https://github.com/jakecoffman/carman',
      name: 'Source'
    }]
  }, {
    title: 'Spring Challenge',
    link: 'https://www.codingame.com/contests/spring-challenge-2020/leaderboard/global?column=keyword&value=jke',
    image: 'pacman.gif',
    text: "Placed 112th out of 5,000 in an AI Pathfinding competition. This was my first time programming AI and my first coding competition.",
    links: [{
      href: 'https://www.codingame.com/contests/spring-challenge-2020/leaderboard/global?column=keyword&value=jke',
      name: 'Leaderboard'
    }]
  }, {
    title: 'Trusted Friend',
    link: 'https://github.com/jakecoffman/trusted-friend',
    image: 'trustedfriend.png',
    text: 'Trusted Friend is an Android app no longer in Google Play, but it allowed you to friend people and request their location.',
    links: [{
      href: 'http://github.com/jakecoffman/trusted-friend',
      name: 'Source'
    }]
  }, {
    title: 'camcontrol',
    link: 'http://github.com/jakecoffman/camcontrol',
    image: 'camcontrol.png',
    text: 'camcontrol is a Qt app with embedded VLC player to open and control multiple Amcrest cameras at once',
    links: [{
      href: 'http://github.com/jakecoffman/camcontrol',
      name: 'Source'
    }]
  }, {
    title: 'Arduino Security',
    link: 'http://youtu.be/lfOxgK1-5HM',
    image: 'arduino.jpg',
    text: 'One of my first open source contributions, an Arduino emailed me when my door opened',

    links: [{
      href: 'http://youtu.be/lfOxgK1-5HM',
      name: 'Watch'
    }, {
      href: 'https://github.com/jakecoffman/arduino-security-system',
      name: 'Source'
    }]
  }, {
    title: 'Gorunner',
    link: 'http://github.com/jakecoffman/gorunner',
    image: 'gorunner.png',
    text: `I used to be obsessed with making a better Jenkins. This was an early attempt
      using Go, with AngularJS on the frontend.`,
    links: [{
      href: 'http://github.com/jakecoffman/gorunner',
      name: 'Source'
    }]
  }, {
    title: 'Video Tutorials',
    link: 'https://www.youtube.com/user/calicoJake/playlists',
    image: 'tutorials.png',
    text: `A long time ago I made programming video tutorials. It was a little experiment
      to see if I could make money off of it. Turns out no, but it was fun and I seemed to help a lot of people.`,

    links: [{
      href: 'https://www.youtube.com/playlist?list=PL0DA14EB3618A3507',
      name: 'Flask'
    }, {
      href: 'https://www.youtube.com/playlist?list=PLXbwrYvH4U89KwOnk79AA8j-s2nmDbWDk',
      name: 'Go/Angular'
    }]
  }]
</script>
