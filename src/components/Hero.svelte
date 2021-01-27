<style>
    h1 {
        font-family: Roboto-Bold, sans-serif;
        font-size: 12vw;
        margin: 0;
        padding-top: 1rem;
        text-shadow: 4px 8px var(--red), 8px 12px black;
    }

    .tagline {
        font-size: 5vw;
        text-shadow: 2px 4px var(--red), 4px 8px black;
    }

    .heroic {
        display: flex;
        flex-direction: column;
        align-items: center;
        transform: matrix(1, 0.10, 0, 1, 0, 0);
        font-variant: small-caps;
        color: var(--yellow);
        text-align: center;
        font-weight: bolder;
        text-shadow: 4px 6px var(--red), 6px 10px black;
    }

    #hero {
        background: var(--light-blue);
        background-image: url("/hex.svg");
        color: white;
        padding: 4rem 2rem 8rem;
        position: relative;
    }

    #logo {
        position: absolute;
        top: 6px;
        right: 10px;
        display: block;
        width: 128px;
        height: auto;
        border-radius: 100%;
        border: 5px solid var(--yellow);
    }

    @media (max-width: 695px) {
        h1 {
            font-size: 15vw;
            text-shadow: 1px 3px var(--red), 3px 6px black;
            white-space: nowrap;
        }

        .tagline {
            text-shadow: 1px 2px var(--red), 2px 4px black;
        }

        #hero {
            padding-bottom: 6rem;
        }

        #logo {
            width: 64px;
        }
    }

    @media (min-width: 1200px) {
        #logo {
            width: 167px;
        }
    }

    #canvas {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        width: 100%;
    }
</style>

<section id="hero">
  <canvas id="canvas"></canvas>
  <img alt="Jake Coffman" src="logo.png" id="logo">
  <div class="heroic">
    <h1>Jake Coffman</h1>
    <span class="tagline">Software Developer</span>
  </div>
</section>

<script>
  import {onMount} from 'svelte'

  onMount(() => {
    const c = document.getElementById('canvas')
    const parent = document.getElementById('hero')
    let w = c.width = parent.clientWidth;
    let h = c.height = parent.clientHeight;
    let gl = c.getContext('webgl', {preserveDrawingBuffer: true})
    let webgl = {}
    let opts = {
      projectileAlpha: 2,
      projectileLineWidth: 1.5,
      fireworkAngleSpan: .5,
      baseFireworkVel: 3,
      addedFireworkVel: 3,
      gravity: .03,
      lowVelBoundary: -.2,
      xFriction: .995,
      baseShardVel: 1,
      addedShardVel: .2,
      fireworks: 25,
      baseShardsParFirework: 10,
      addedShardsParFirework: 10,
      shardFireworkVelMultiplier: .3,
      initHueMultiplier: 1 / 360,
      runHueAdder: .1 / 360
    }

    webgl.vertexShaderSource = `
uniform int u_mode;
uniform vec2 u_res;
attribute vec4 a_data;
varying vec4 v_color;

vec3 h2rgb( float h ){
	return clamp( abs( mod( h * 6. + vec3( 0, 4, 2 ), 6. ) - 3. ) -1., 0., 1. );
}
void clear(){
	gl_Position = vec4( a_data.xy, 0, 1 );
	v_color = vec4( 0, 0, 0, a_data.w );
}
void draw(){
	gl_Position = vec4( vec2( 1, -1 ) * ( ( a_data.xy / u_res ) * 2. - 1. ), 0, 1 );
	v_color = vec4( h2rgb( a_data.z ), a_data.w );
}
void main(){
	if( u_mode == 0 )
		draw();
	else
		clear();
}
`;
    webgl.fragmentShaderSource = `
precision mediump float;
varying vec4 v_color;

void main(){
	gl_FragColor = v_color;
}
`;

    webgl.vertexShader = gl.createShader(gl.VERTEX_SHADER);
    gl.shaderSource(webgl.vertexShader, webgl.vertexShaderSource);
    gl.compileShader(webgl.vertexShader);

    webgl.fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
    gl.shaderSource(webgl.fragmentShader, webgl.fragmentShaderSource);
    gl.compileShader(webgl.fragmentShader);

    webgl.shaderProgram = gl.createProgram();
    gl.attachShader(webgl.shaderProgram, webgl.vertexShader);
    gl.attachShader(webgl.shaderProgram, webgl.fragmentShader);

    gl.linkProgram(webgl.shaderProgram);
    gl.useProgram(webgl.shaderProgram);

    webgl.dataAttribLoc = gl.getAttribLocation(webgl.shaderProgram, 'a_data');
    webgl.dataBuffer = gl.createBuffer();

    gl.enableVertexAttribArray(webgl.dataAttribLoc);
    gl.bindBuffer(gl.ARRAY_BUFFER, webgl.dataBuffer);
    gl.vertexAttribPointer(webgl.dataAttribLoc, 4, gl.FLOAT, false, 0, 0);

    webgl.resUniformLoc = gl.getUniformLocation(webgl.shaderProgram, 'u_res');
    webgl.modeUniformLoc = gl.getUniformLocation(webgl.shaderProgram, 'u_mode');

    gl.viewport(0, 0, w, h);
    gl.uniform2f(webgl.resUniformLoc, w, h);

    gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
    gl.enable(gl.BLEND);

    gl.lineWidth(opts.projectileLineWidth);

    webgl.data = [];

    webgl.clear = function () {
      gl.uniform1i(webgl.modeUniformLoc, 1);
      const a = .1;
      webgl.data = [
        -1, -1, 0, a,
        1, -1, 0, a,
        -1, 1, 0, a,
        -1, 1, 0, a,
        1, -1, 0, a,
        1, 1, 0, a
      ];
      webgl.draw(gl.TRIANGLES);
      gl.uniform1i(webgl.modeUniformLoc, 0);
      webgl.data.length = 0;
    }

    webgl.draw = function (glType) {
      gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(webgl.data), gl.STATIC_DRAW);
      gl.drawArrays(glType, 0, webgl.data.length / 4);
    }

    let fireworks = []
        , tick = 0
        , sins = []
        , coss = []
        , maxShardsParFirework = opts.baseShardsParFirework + opts.addedShardsParFirework
        , tau = 2 * Math.PI;

    for (let i = 0; i < maxShardsParFirework; ++i) {
      sins[i] = Math.sin(tau * i / maxShardsParFirework);
      coss[i] = Math.cos(tau * i / maxShardsParFirework);
    }

    function Firework() {
      this.reset();
      this.shards = [];
      for (let i = 0; i < maxShardsParFirework; ++i)
        this.shards.push(new Shard(this));
    }

    Firework.prototype.reset = function () {
      let angle = -Math.PI / 2 + (Math.random() - .5) * opts.fireworkAngleSpan
      let vel = opts.baseFireworkVel + opts.addedFireworkVel * Math.random();

      this.mode = 0;
      this.vx = vel * Math.cos(angle);
      this.vy = vel * Math.sin(angle);

      this.x = Math.random() * w;
      this.y = h;

      this.hue = Math.random();

    }
    Firework.prototype.step = function () {

      if (this.mode === 0) {

        let ph = this.hue
            , px = this.x
            , py = this.y;

        this.hue += opts.runHueAdder;

        this.x += this.vx *= opts.xFriction;
        this.y += this.vy += opts.gravity;

        webgl.data.push(
            px, py, ph, opts.projectileAlpha * .2,
            this.x, this.y, this.hue, opts.projectileAlpha * .2);

        if (this.vy >= opts.lowVelBoundary) {
          this.mode = 1;

          this.shardAmount = opts.baseShardsParFirework + opts.addedShardsParFirework * Math.random() | 0;

          let baseAngle = Math.random() * tau
              , x = Math.cos(baseAngle)
              , y = Math.sin(baseAngle)
              , sin = sins[this.shardAmount]
              , cos = coss[this.shardAmount];

          for (let i = 0; i < this.shardAmount; ++i) {

            let vel = opts.baseShardVel + opts.addedShardVel * Math.random();
            this.shards[i].reset(x * vel, y * vel)
            let X = x;
            x = x * cos - y * sin;
            y = y * cos + X * sin;
          }
        }

      } else if (this.mode === 1) {

        this.ph = this.hue
        this.hue += opts.runHueAdder;

        let allDead = true;
        for (let i = 0; i < this.shardAmount; ++i) {
          let shard = this.shards[i];
          if (!shard.dead) {
            shard.step();
            allDead = false;
          }
        }

        if (allDead)
          this.reset();
      }

    }

    function Shard(parent) {
      this.parent = parent;
    }

    Shard.prototype.reset = function (vx, vy) {
      this.x = this.parent.x;
      this.y = this.parent.y;
      this.vx = this.parent.vx * opts.shardFireworkVelMultiplier + vx;
      this.vy = this.parent.vy * opts.shardFireworkVelMultiplier + vy;
      this.dead = false;
      this.tick = 1;
    }
    Shard.prototype.step = function () {

      this.tick += .05;

      let px = this.x;
      let py = this.y;

      this.x += this.vx *= opts.xFriction;
      this.y += this.vy += opts.gravity;

      webgl.data.push(
          px, py, this.parent.ph, opts.projectileAlpha / this.tick,
          this.x, this.y, this.parent.hue, opts.projectileAlpha / this.tick);

      if (this.y > h)
        this.dead = true;
    }

    function anim() {
      window.requestAnimationFrame(anim)

      webgl.clear();

      ++tick;

      if (fireworks.length < opts.fireworks)
        fireworks.push(new Firework);

      fireworks.map(function (firework) {
        firework.step();
      });

      webgl.draw(gl.LINES);
    }

    anim();

    window.addEventListener('resize', function () {
      w = c.width = parent.clientWidth;
      h = c.height = parent.clientHeight;

      gl.viewport(0, 0, w, h);
      gl.uniform2f(webgl.resUniformLoc, w, h);
    })
  })
</script>
