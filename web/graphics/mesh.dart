import 'dart:web_gl' as webgl;
import 'dart:typed_data';

class Mesh {
  List<double> vertices;
  List<int> indices;
  
  webgl.RenderingContext _gl;
  webgl.Buffer _vertexPositionBuffer;
  webgl.Buffer _indicesBuffer;
  
  Mesh(webgl.RenderingContext _gl ,List<double> vertices, List<int> indices) {
    
    this._gl = _gl;
    this.vertices = vertices;
    this.indices = indices;
    
    _vertexPositionBuffer = _gl.createBuffer();
    _gl.bindBuffer(webgl.RenderingContext.ARRAY_BUFFER, _vertexPositionBuffer);
    _gl.bufferDataTyped(webgl.RenderingContext.ARRAY_BUFFER, new Float32List.fromList(vertices), webgl.RenderingContext.STATIC_DRAW);
    
    _indicesBuffer = _gl.createBuffer();
    _gl.bindBuffer(webgl.RenderingContext.ARRAY_BUFFER, _indicesBuffer);
    _gl.bufferDataTyped(webgl.RenderingContext.ARRAY_BUFFER, new Uint32List.fromList(indices), webgl.RenderingContext.STATIC_DRAW);
  }
  
  void draw()
  {
  }
}