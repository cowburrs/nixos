{ pkgs, ... }:
let
  luaEnv = pkgs.lua.withPackages (ps: with ps; [
    dkjson
    luafilesystem
    penlight
  ]);
in
{
  environment.systemPackages = [ luaEnv ];
  environment.sessionVariables = {
    LUA_LIBS = "${luaEnv}/share/lua/5.2";
    LUA_PATH = "${luaEnv}/share/lua/5.2/?.lua;${luaEnv}/share/lua/5.2/?/init.lua;;";
  };
}
