#ifdef GL_ES
precision mediump float;
#endif

varying vec4 vertColor;  // 受け取った頂点にある色情報


void main() {

  gl_FragColor = vertColor;  // 色情報をそのまま出力する

}
