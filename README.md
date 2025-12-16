Luanti Mod API providing an idiomatic luantic way to manage optional dependencies.

# How to use?
put `optional_depends` in your `mod.conf`'s dependencies list, add the following line to your `init.lua`:
```lua
optional_depends.include()
```
...and now you can manage your optional dependencies using folders like so:
```
/optional_depends/modname/init.lua
/optional_depends/other_mod/init.lua
...
```
for game specific stuff, use:
```
/game_specific/game_id/init.lua
/game_specific/other_game/init.lua
...
```
yes you need to use a `dependency/init.lua`,
but say you're not feeling the directory names, you can use:
```lua
optional_depends.include {
    mods_path = "/directory_for_mods",
    games_path = "/directory_for_games",
}
```
you can set `games_path` and `mods_path` to the same folder but be warned this would cause issues if a mod and a game share a name.
<br>

dependency scripts get access to a global variable: `optional_depends.current_path` which will hold the path of the script's parent directory.

# What is this error? help!

you may get an error like this:
```
add some_mod, other_mod to the optional_depends in your mod.conf
```
this is because you made a script for mods in your `/optional_depends/` folder without first adding them to your `mod.conf`'s `optiona_depends`.
this error occurs because my API can't ensure that your script will load after all optional dependencies have loaded, as load order is determined by the engine.
simply double check your `mod.conf` and make sure you have a line that looks like this:
```conf
optional_depends = bombulator, airsword, some_other_mod, other_mod, blahblah, ...
```
note that this error doesn't show up unless the dependency is loaded as well.