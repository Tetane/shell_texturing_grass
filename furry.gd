@tool
extends Node3D

@export var mesh_count: float = 64
@export var grass_height: float = 0.3

func _ready():
	# Make sure instance_count is set to zero if you want to enable custom_data
	$MultiMeshInstance3D.multimesh.instance_count = 0
	$MultiMeshInstance3D.multimesh.transform_format = MultiMesh.TRANSFORM_3D
	$MultiMeshInstance3D.multimesh.use_custom_data = true
	$MultiMeshInstance3D.multimesh.instance_count = mesh_count
	$MultiMeshInstance3D.multimesh.visible_instance_count = mesh_count
	$MultiMeshInstance3D.multimesh.mesh.surface_get_material(0).set_shader_parameter("instance_count", mesh_count)
	
	# Set the transform of the instances.
	for i in $MultiMeshInstance3D.multimesh.visible_instance_count:
		$MultiMeshInstance3D.multimesh.set_instance_transform(i, Transform3D(Basis(), Vector3(0, i / mesh_count * grass_height, 0)))
		
		# Set a custom data for each instance (access it with "INSTANCE_CUSTOM" in vertex shader)
#		$MultiMeshInstance3D.multimesh.set_instance_custom_data(i, Color(i/mesh_count,0,0,0))

