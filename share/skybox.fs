#version 330

in vec3 fragPosition;

uniform samplerCube environmentMap;

out vec4 finalColor;

void main()
{
    finalColor = texture(environmentMap, fragPosition);
}
