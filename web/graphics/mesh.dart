part of graphics;

class Mesh {
  List<double> vertices;
  List<int> indices;
  
  RenderingContext _gl;
  Buffer vertexBuffer;
  Buffer indexBuffer;
  
  Mesh(RenderingContext _gl, List<double> vertices, List<int> indices) {
    this._gl = _gl;
    this.vertices = vertices;
    this.indices = indices;
    
    vertexBuffer = _gl.createBuffer();
    _gl.bindBuffer(RenderingContext.ARRAY_BUFFER, vertexBuffer);
    _gl.bufferDataTyped(RenderingContext.ARRAY_BUFFER, new Float32List.fromList(vertices), RenderingContext.STATIC_DRAW);
    
    indexBuffer = _gl.createBuffer();
    _gl.bindBuffer(RenderingContext.ELEMENT_ARRAY_BUFFER, indexBuffer);
    _gl.bufferDataTyped(RenderingContext.ELEMENT_ARRAY_BUFFER, new Uint16List.fromList(indices), RenderingContext.STATIC_DRAW);
  }
}