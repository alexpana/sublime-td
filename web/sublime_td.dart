library core;

import 'dart:html';
import 'package:vector_math/vector_math.dart';
import 'dart:web_gl';
import 'dart:typed_data';
import 'graphics/graphics.dart';

class Game {
  
  CanvasElement _canvas;
  RenderingContext _gl;
  ShaderResource shaderFlatColor;

  int _viewportWidth;
  int _viewportHeight;
  
  Mesh quad;
  Renderer _renderer;
  
  Matrix4 _pMatrix;
  Matrix4 _mvMatrix;
  
  var _requestAnimationFrame;
  
  
  Game(CanvasElement canvas) {
    _gl = canvas.getContext("experimental-webgl");
    _gl.viewport(0, 0, canvas.width, canvas.height);

    _pMatrix = makePerspectiveMatrix(radians(45.0), canvas.width / canvas.height, 0.1, 100.0);
    _mvMatrix = new Matrix4.identity();
    _mvMatrix.translate(0.0, 0.0, -3.0);

    
    _renderer = new Renderer(_gl);
    
    initShaders();
    initBuffers();
    
    _gl.clearColor(0.0, 0.0, 0.0, 1.0);
    _gl.enable(RenderingContext.DEPTH_TEST);
  }
  
  void initShaders() {
    shaderFlatColor = new ShaderResource(
        _gl,

        // Vertex Shader
        """
        attribute vec3 aPosition;
      
        uniform mat4 uMVMatrix;
        uniform mat4 uPMatrix;
      
        varying vec4 vColor;
      
        void main(void) {
          gl_Position = uPMatrix * uMVMatrix * vec4(aPosition, 1.0);
        }
        """,
        
        // Fragment Shader
        """
        precision mediump float;
    
        uniform vec4 uColor;
    
        void main(void) {
          gl_FragColor = uColor;
        }
        """);
    
    _renderer.bindShader(shaderFlatColor);
  }
  
  void initBuffers() {
    quad = new Mesh(_gl, [1.0,  1.0, 0.0, -1.0, 1.0,  0.0, 1.0, -1.0, 0.0, -1.0, -1.0, 0.0], [0, 1, 2, 1, 2, 3]);
  }
  
  void _setMatrixUniforms() {
    Float32List tmpList = new Float32List(16);
    
    _pMatrix.copyIntoArray(tmpList);
    _gl.uniformMatrix4fv(_renderer.activeShader.getUniformLocation("uPMatrix"), false, tmpList);
    
    _mvMatrix.copyIntoArray(tmpList);
    _gl.uniformMatrix4fv(_renderer.activeShader.getUniformLocation("uMVMatrix"), false, tmpList);
  }
  
  bool render(double time) {
    _gl.clear(RenderingContext.COLOR_BUFFER_BIT | RenderingContext.DEPTH_BUFFER_BIT);

    _setMatrixUniforms();
    _gl.uniform4fv(_renderer.activeShader.getUniformLocation("uColor"), new Float32List.fromList([1.0, 0.0, 0.0, 1.0]));
    _renderer.drawMesh(quad);

    // keep drawing
//    this._renderFrame();
  }
  
  void start() {
    this._renderFrame();
  }
  
  void _renderFrame() {
    this.render(0.0);
//    window.requestAnimationFrame((num time) { this.render(time); });
  }
  
}

void main() {
  Game lesson = new Game(querySelector('#canvas'));
  lesson.start();
}