extends Node


const QCROMA_CRITPARABOLIC_DIR := "Qcroma-CritParabolic"
const QCROMA_CRITPARABOLIC_LOG := "Qcroma-CritParabolic:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(QCROMA_CRITPARABOLIC_DIR)
	extensions_dir_path = mod_dir_path.plus_file("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("crit_parabolic.gd"))

func _ready() -> void:
	ModLoaderLog.info("Ready!", QCROMA_CRITPARABOLIC_LOG)
