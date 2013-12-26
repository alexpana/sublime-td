part of graphics;

class Renderer {
  RenderingContext _gl;
  
  ShaderResource activeShader;

  Renderer(RenderingContext gl) {
    _gl = gl;
  }
  
  void bindShader(ShaderResource shader) {
    activeShader = shader;
    activeShader.bind();
  }
  
  void drawMesh(Mesh mesh) {
    _gl.bindBuffer(RenderingContext.ARRAY_BUFFER, mesh.vertexBuffer);
    _gl.vertexAttribPointer(activeShader.position, 3, RenderingContext.FLOAT, false, 0, 0);

    _gl.bindBuffer(RenderingContext.ELEMENT_ARRAY_BUFFER, mesh.indexBuffer);
    _gl.drawElements(RenderingContext.TRIANGLES, 6, RenderingContext.UNSIGNED_SHORT, 0);
  }
}