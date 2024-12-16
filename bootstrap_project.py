import shutil
import os

project_name = ""
while True:
    project_name = input("Project name?: ")

    if len(project_name) == 0:
        project_name = "Untitled"
    print(project_name)
    is_correct_input = input("Is this correct? [y/N]: ")
    if is_correct_input == 'y' or is_correct_input == "Y":
        break
project_godot_filepath = "./Template/project.godot"
project_godot = f'''; Engine configuration file.
; It's best edited using the editor UI and not directly,
; since the parameters that go here are not all obvious.
;
; Format:
;   [section] ; section goes between []
;   param=value ; assign values to parameters

config_version=5

[application]

config/name="{project_name}"
config/features=PackedStringArray("4.3", "Forward Plus")
config/icon="res://icon.svg"

[autoload]

Panku="*res://addons/panku_console/console.tscn"

[debug]

gdscript/warnings/unused_variable=0
gdscript/warnings/unused_local_constant=0
gdscript/warnings/unused_private_class_variable=0
gdscript/warnings/unused_parameter=0
gdscript/warnings/unused_signal=0
gdscript/warnings/shadowed_variable=2
gdscript/warnings/shadowed_variable_base_class=2
gdscript/warnings/shadowed_global_identifier=2
gdscript/warnings/unsafe_property_access=1
gdscript/warnings/unsafe_method_access=1
gdscript/warnings/unsafe_cast=1
gdscript/warnings/unsafe_call_argument=1

[display]

window/size/viewport_width=2560
window/size/viewport_height=1440

[dotnet]

project/assembly_name="{project_name}"

[editor_plugins]

enabled=PackedStringArray("res://addons/Todo_Manager/plugin.cfg", "res://addons/godot_state_charts/plugin.cfg", "res://addons/kanban_tasks/plugin.cfg", "res://addons/panku_console/plugin.cfg")

[gui]

theme/custom="res://assets/resources/default_theme.tres"
'''

src_dir = 'template' # path to source directory
dest_dir = project_name # path to destination directory
files = os.listdir(src_dir) # get all files in source directory
shutil.copytree(src_dir, dest_dir)

# Create project.godot to make the project editable
project_godot_file = open(f'{project_name}/project.godot', 'w', encoding="UTF8")
project_godot_file.writelines(project_godot)
project_godot_file.close()
print(f"\nAll done! Created project '{project_name}' - happy developing :)")