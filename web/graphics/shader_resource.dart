part of graphics;

class ShaderResource {
  RenderingContext _gl;
  Shader fragment;
  Shader vertex;
  Program _shaderProgram;
  int position;

  ShaderResource(RenderingContext gl, String vsSource, String fsSource) {
    _gl = gl;

    // vertex shader compilation
    vertex = _gl.createShader(RenderingContext.VERTEX_SHADER);
    _gl.shaderSource(vertex, vsSource);
    _gl.compileShader(vertex);
    
    // fragment shader compilation
    fragment = _gl.createShader(RenderingContext.FRAGMENT_SHADER);
    _gl.shaderSource(fragment, fsSource);
    _gl.compileShader(fragment);
    
    // attach shaders to a WebGL program
    _shaderProgram = _gl.createProgram();
    _gl.attachShader(_shaderProgram, vertex);
    _gl.attachShader(_shaderProgram, fragment);
    _gl.linkProgram(_shaderProgram);
    
    checkCompilation();
    
    position = _gl.getAttribLocation(_shaderProgram, "aPosition");
    _gl.enableVertexAttribArray(position);
  }
  
  void bind() {
    _gl.useProgram(_shaderProgram);
  }
  
  UniformLocation getUniformLocation(String name) {
    return _gl.getUniformLocation(_shaderProgram, name);
  }
  
  void checkCompilation() {
    if (!_gl.getShaderParameter(vertex, RenderingContext.COMPILE_STATUS)) { 
      print(_gl.getShaderInfoLog(vertex));
    }
    
    if (!_gl.getShaderParameter(fragment, RenderingContext.COMPILE_STATUS)) { 
      print(_gl.getShaderInfoLog(fragment));
    }
    
    if (!_gl.getProgramParameter(_shaderProgram, RenderingContext.LINK_STATUS)) { 
      print(_gl.getProgramInfoLog(_shaderProgram));
    }
  }
}