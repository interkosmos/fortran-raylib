#version 330

in vec3 vertexPosition;

uniform mat4 matProjection;
uniform mat4 matView;

out vec3 fragPosition;

void main()
{
    fragPosition = vertexPosition;

    // Remove translation from camera matrix: a normal camera view matrix
    // contains both rotation and translation. For a skybox, we want the sky to
    // rotate when we look around, but we do not want it to move when the
    // camera moves. Removing the translation from the view matrix creates that
    // effect.
    mat4 rotView = mat4(mat3(matView));

    vec4 pos = matProjection * rotView * vec4(vertexPosition, 1.0);

    // Force skybox to maximum depth.
    gl_Position = pos.xyww;
}
