/* 
SimpleFragment.glsl

Fragment shader with color input and output.

Mike Barnes
8/16/2014

updated to our Warbird Simulation by
Armand Abrahamian
Ben Villalobos
Bryant Barron
*/

# version 330 core

//pointLight Variables
uniform vec3 PointLightRuber; 
uniform vec3 PointLightPosition; 
uniform bool PointLightOn;

//headLamp Variables
uniform vec3 HeadLampPosition;
uniform bool HeadLampOn;

//light Variables
uniform vec3 LightColor; 
uniform float ConstantAttenuation;
uniform float LinearAttenuation;
uniform float QuadraticAttenuation;
uniform float Shininess; 
uniform float Strength;
uniform bool AmbientLightOn; 
uniform bool Ruber;

//texture 
uniform sampler2D Texture;
uniform bool IsTexture;

//input info from vertex shader output
in vec3 Position;
in vec3 Normal;
in vec4 color;
in vec2 TextCoord;

// output from fragment shader prog
out vec4 FragColor;

//pointLight method in GLSL
// doesn't work for some reason, the minute
// its not commented out we start getting a 
// Cannot find PDB file error
/*
vec3 pointLight(vec3 lightPos){

	vec3 lightDirection = lightPos - vec3(Position);

	float lightDistance = length(lightDirection);

	lightDirection = lightDirection/lightDistance; 

	float attenuation = 1.0 / (ConstantAttenuation +
								LinearAttenuation * lightDistance +
								QuadraticAttenuation * lightDistance
								 * lightDistance);

	vec3 halfVector = normalize(lightDirection + PointLightPosition);
	float diffuse = max(0.0, dot(Normal, lightDirection));
	float specular = max(0.0, dot(Normal, halfVector));

	if(diffuse == 0.0)
		specular = 0.0;
	else
		specular = pow(specular, Shininess) * Strength;

	vec3 scatteredLight = LightColor * diffuse * attenuation;
	vec3 reflectedLight = LightColor * specular * Strength * attenuation;
	vec3 rgb = min(Color.rgb * scatteredLight + reflectedLight, vec3(1.0));

	return rgb;
}*/

//HeadLamp Method
/* also getting a PDB file error when this vec3 is created
vec3 HeadLamp(){
	float ambient;

	if(AmbientLightOn)
		ambient = 0.2f;
	else 
		ambient = 0.0f;

	vec3 halfVector = normalize(lightDirection);

	float diffuse = max(dot(Normal, LightDirection), 0.0);
	float specular = max(dot(Normal, halfVector), 0.0);

	if (diffuse == 0)
		specular = 0.0;
	else
		specular = pow(specular, Shininess);

	vec3 scatteredLight = ambient + LightColor * diffuse;
	vec3 reflectedLight = LightColor * specular * Strength;
	vec3 rgb = min(Color.rgb * scatteredLight + reflectedLight, vec3(1.0));

	return rgb;
}
*/

// 
void main() {
 FragColor = color;

  if(IsTexture) {
	FragColor = texture(Texture, TextCoord);
  }/*else {
		
		// Get the color of the fragment
		vec3 tempColor = vec3(Color) * 0.1f;
		
		// if the directional light is on, apply directional light effect to color
		if (HeadLampOn)
			tempColor += HeadLamp();

		// if the point light is on, apply point light effect to color
		if (PointLightOn) 
			tempColor += pointLight(PointLightPosition);
			
		//Output the fragment's color
		FragColor = vec4(tempColor, 1.0);
		
	}*/
  
}