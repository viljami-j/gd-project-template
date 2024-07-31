# meta-default: true
# meta-name: Default
#@tool # uncomment to make this script run in the editor.

extends _BASE_

# Signals definitions
#signal something_happened

# Guidelines:
#region 
# - Write stateful functions declaratively.
# - Prefer unique names (%MyNode) to get_node()/$MyNode
#endregion       

@export_category("Editor-only")
@export var enable_print_verbose = true ## Toggles whether prints called via _print_verbose() are printed or not.
@export_category("")


func _ready():
	if Engine.is_editor_hint(): 
		_tool_ready()
	_onready_connect_signals()
	

func _process(delta):
	if Engine.is_editor_hint(): 
		_tool_process()

	
func _physics_process(delta):
	if Engine.is_editor_hint():
		_tool_physics_process()


# Signal callbacks
## Signals are primarily connected here.
func _onready_connect_signals():
	#some_node.connect("some_signal", func(): print("My signal callback"))
	pass


# Tool/editor-only functions
#region All editor functionality goes here, strictly! Prefix functions like so: func _tool_my_function()
func _tool_ready(): ## Same as _ready(), but runs only in the editor.
	if not Engine.is_editor_hint(): return
	# Code goes here.
	#print("I happen on _ready()!")
	pass

func _tool_process(): ## Same as _process(), but runs only in the editor.
	if not Engine.is_editor_hint(): return
	# code goes here.
	#print("I happen on _process()!")
	pass

func _tool_physics_process(): ## Same as _physics_process(), but runs only in the editor.
	if not Engine.is_editor_hint(): return
	# code goes here.
	#print("I happen on _physics_process()!")
	pass

#func _tool_functionname():
#	pass

# Configuration warnings allow the editor to warn the user
# if there has been misconfigurations.
# Uncomment the snippet below and conditionally append to warnings
# to trigger configuration warnings.
#
# Try the code below to see them in action.
#func _get_configuration_warnings():
#	var warnings = []
#	if true:
#		warnings.append("Demo warning", "Demo warning2")
#	const save_reminder = "Save and click anywhere after adjusting to dismiss the resolved warning(s)."
#	if warnings.size() != 0: warnings.append(save_reminder)
#	return warnings # -> no warnings
#endregion

# Logging
#region Contains all the functions related to logging.
## Print verbose - a wrapper to print(), allows separation of "important" prints from usually extraneous prints.
## Used for prints that may sometimes be useful in debugging. These can be safely disabled.
## Can be enabled/disabled via 'enable_print_verbose'.
func _printver(string: String, string2:="", string3:="", string4:="", string5:="", string6:="", string7:="", string8:="", string9:=""): ## Print verbose. Used for prints that may sometimes be useful in debugging. These can be safely disabled via setting 'enable_print_verbose' to false.
	var str_total = string+string2+string3+string4+string5+string6+string7+string8+string9
	if not enable_print_verbose:
		return
	print(str_total)

## Print verbose - a wrapper to print(), allows separation of "important" prints from usually extraneous prints.
## Used for prints that may sometimes be useful in debugging. These can be safely disabled.
## Parameters are separated by given separator. 
func _printvers(separator: String, string: String, string2:="", string3:="", string4:="", string5:="", string6:="", string7:="", string8:="", string9:=""):
	var str_total = string+string2+string3+string4+string5+string6+string7+string8+string9
	if not enable_print_verbose:
		return
	print(str_total)

## Prints and pushes a warning.
func _printwar(string: String, string2:="", string3:="", string4:="", string5:="", string6:="", string7:="", string8:="", string9:=""):
	var warning = string+string2+string3+string4+string5+string6+string7+string8+string9
	print_rich("[color=yellow]", warning ,"[/color]")
	push_warning(string)

## Prints and pushes a warning.
## Parameters are separated by given separator.
func _printwars(separator: String, string: String, string2:="", string3:="", string4:="", string5:="", string6:="", string7:="", string8:="", string9:=""): ## Print warning, parameters are separated by given separator.
	var warning = string+separator+string2+separator+string3+separator+string4+separator+string5+separator+string6+separator+string7+separator+string8+separator+string9
	print_rich("[color=yellow]", warning ,"[/color]")
	push_warning(string)

## Prints and pushes an error.
func _printerr(string: String, string2:="", string3:="", string4:="", string5:="", string6:="", string7:="", string8:="", string9:=""): ## Print error
	var err = string+string2+string3+string4+string5+string6+string7+string8+string9
	printerr(err)
	push_error(err)

## Prints and pushes an error.
## Parameters are separated by given separator.
func _printerrs(separator: String, string: String, string2:="", string3:="", string4:="", string5:="", string6:="", string7:="", string8:="", string9:=""): ## Print error, parameters are separated by given separator.
	var error = string+separator+string2+separator+string3+separator+string4+separator+string5+separator+string6+separator+string7+separator+string8+separator+string9
	printerr(error)
	push_error(error)
#endregion

# Editor-connected signals