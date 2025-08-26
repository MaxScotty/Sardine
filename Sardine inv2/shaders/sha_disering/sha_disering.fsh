precision mediump float;

varying vec2 v_texcoord;
varying vec4 v_col;

uniform float scale;

float bayer4x4(vec2 pos) {
    vec2 pp = floor(pos);
    int xx = int(mod(pp.xx, 4.0));
    int yy = int(mod(pp.yy, 4.0));
    int i = yy * 4 + xx;

    if(i==0) return 0.03125;
    if(i==1) return 0.53125;
    if(i==2) return 0.15625;
    if(i==3) return 0.65625;
    if(i==4) return 0.78125;
    if(i==5) return 0.28125;
    if(i==6) return 0.90625;
    if(i==7) return 0.40625;
    if(i==8) return 0.1875;
    if(i==9) return 0.6875;
    if(i==10) return 0.0625;
    if(i==11) return 0.5625;
    if(i==12) return 0.9375;
    if(i==13) return 0.4375;
    if(i==14) return 0.8125;
    return 0.3125;
}

void main() {
    vec4 tex = texture2D(gm_BaseTexture, v_texcoord) * v_col;

    // яркость пикселя (по RGB)
    float lum = dot(tex.rgb, vec3(0.299, 0.587, 0.114));

    // порог по Bayer
    float threshold = bayer4x4(gl_FragCoord.xy / scale);

    // коэффициент: 1 = рисуем пиксель, 0 = прозрачный
    float mask = step(threshold, lum);

    // оставляем цвет как есть, но альфу «продырявливаем»
    gl_FragColor = vec4(tex.rgb, tex.a * mask);
	
	////изменить     -=      ||||
	gl_FragColor.rgb += vec3(0.15);
}
