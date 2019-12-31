
// currently a boring pass-thru shader
// GLSL

void main( void ) {
//    vec4 color = texture2D(utexture, vtexcoord); // here will emerge something worthy
//    glFragColor = color;
    
    // red color of threes
//    vec4 color = texture2D(u_texture, v_tex_coord);
//    float alpha = color.a;
//    gl_FragColor = vec4(1,0, 0.0, 1.0) * alpha; //google "premultiplied alpha"
    
    // swap color after 1 sec
//    vec4 color = texture2D(u_texture, v_tex_coord);
//    float alpha = color.a;
//    float phase = mod(u_time, 3.0);
//    vec3 outputColor = color.rgb;
//    if (phase < 1.0) {
//        outputColor = color.bgr;
//    } else if (phase < 2.0) {
//        outputColor = color.brg;
//    }
//    gl_FragColor = vec4(outputColor, 1.0) * alpha;
    
    // Colorize over time
//    vec4 color = texture2D(u_texture, v_tex_coord);
//    float alpha = color.a;
//    float r = (sin(u_time+ 3.14 * 0.00)+1.0)*0.5;
//    float g = (sin(u_time+ 3.14 * 0.33)+1.0)*0.5;
//    float b = (sin(u_time+ 3.14 * 0.66)+1.0)*0.5;
//    gl_FragColor = vec4(r,g,b, 1.0) * alpha;

    // waves
//    float deltaX = sin(v_tex_coord.y*3.14*10.0 + u_time * 4.0)*0.01;
//    vec2 coord = v_tex_coord;
//    coord.x = coord.x + deltaX;
//    vec4 color = texture2D(u_texture, coord);
//    gl_FragColor = color;
    
    // in use
//    vec4 color = texture2D(u_texture, v_tex_coord * (2.5 * THE_MIGHTY_DARK_FACTOR));
//    float alpha = color.a;
//    vec3 baseColor = color.rgb * THE_MIGHTY_DARK_FACTOR;
//    gl_FragColor = vec4(baseColor, 1.0) * alpha;
    
    // wind
    float horizonAbsoluteOffset = 0.64; // 1
    float distanceFromTrunksBase = abs(v_tex_coord[1] - horizonAbsoluteOffset); // 2
    float maxDivergence = mix(0.0,1.0,distanceFromTrunksBase)*0.038; // 3
    float factor = sin(u_time*2.0+(attrDepth * 1.3)); // 4
    vec2 deltaUV = vec2(maxDivergence * factor, 0); // 5
    gl_FragColor = texture2D(u_texture, v_tex_coord + deltaUV); //6
}
