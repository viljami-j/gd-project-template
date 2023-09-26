# gd-project-template
A project template for new game projects created in Godot. Slightly inspired by workflows discovered while using Unity.

## Godot style guide, as per 27th of September, 2023.
_For consistency across projects, we recommend following these guidelines:_

_Use snake_case for folder and file names (with the exception of C# scripts). This sidesteps case sensitivity issues that can crop up after exporting a project on Windows. C# scripts are an exception to this rule, as the convention is to name them after the class name which should be in PascalCase._

_Use PascalCase for node names, as this matches built-in node casing._

_In general, keep third-party resources in a top-level addons/ folder, even if they aren't editor plugins. This makes it easier to track which files are third-party. There are some exceptions to this rule; for instance, if you use third-party game assets for a character, it makes more sense to include them within the same folder as the character scenes and scripts._
