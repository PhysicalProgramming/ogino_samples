#ifdef GL_ES
precision mediump float;
#endif

// processingから受け取る情報
uniform vec2  resolution;
uniform vec2  mouse;
uniform float time;

varying vec4 vertColor;  // 受け取った頂点にある色情報


void main() {
  
  vec2 coordRate = ( gl_FragCoord.xy / resolution - .5 ) * 2.;
  gl_FragColor = vec4(vec3(coordRate.x+0.5, coordRate.y+0.5, sin(time)), 1.0);

}
