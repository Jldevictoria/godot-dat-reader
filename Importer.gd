@tool
extends EditorImportPlugin

func _get_importer_name():
	return "lithtech.dat.import"

func _get_visible_name():
	return "Lithtech DAT Importer"

func _get_recognized_extensions():
	return ["dat"]

func _get_save_extension():
	return "tscn"

func _get_resource_type():
	return "PackedScene"

func _get_preset_count():
	return 1

func _get_preset_name(i):
	return "Default"

func _get_priority():
	return 1

func get_import_options(i):
	return []
	
func get_option_visibility(option, options):
	return true

var _world_builder = null

func _init():
	self._world_builder = preload('res://addons/godot-dat-reader/WorldBuilder.gd').new()

func _import(source_file, save_path, options, platform_variants, gen_files):
	var scene = self._world_builder.build(source_file, options)
	var filename = save_path + "." + _get_save_extension()
	print("Saving as ", filename)
	ResourceSaver.save(filename, scene)
	return OK
