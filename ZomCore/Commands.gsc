////////////////////////////////////////////////////////////////
// ZomCore BO2 Frame by DevDokus                              //
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
#include scripts\zm\ZomCore;
#include scripts\zm\ZomCore\_Utils;
#include scripts\zm\ZomCore\Hud;
#include scripts\zm\ZomCore\Level;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
init() {}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
Commands() {
  level endon("end_game");
  prefix = GetDvar("_Prefix");
  for (;;) {
    level waittill("say", message, player);
    message = toLower(message);
    if(!level.intermission && message[0] == prefix) {
      args = strtok(message, " ");
      command = getSubStr(args[0], 1);
      switch(command) {

        // Help
        case "commands":
          player thread CommandsAvail();
          break;

        // Commands
        case "welcome":
          player IPrintLn("tetst");
          player thread Welcome_User();
          break;
        



          // DEBUG
        case "test":
          player thread DoTest();
          break;

          // Default
        default:
          CommandNotFound();
          break;
      }
    }
  }
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
CommandNoAccess() {
  self IPrintLn("^2[ System ]: ^7You've no access to this command!");
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
CommandNotFound() {
  self IPrintLn("^2[ System ]: ^7Command not found!"); wait 3.0;
  self IPrintLn("^2[ System ]: ^7Type ^3.commands ^7for more information.");
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
CommandsAvail() {
  self IPrintLn("^2[ System ]: ^3.Welcome    | ^7Restart Welcome Message"); wait 0.75;
  self IPrintLn("^2[ System ]: ^3.God            | ^7Toggle Godmode [ Admin ]"); wait 0.75;
  self IPrintLn("^2[ System ]: ^3.AFK            | ^7Toggle AFK status [ Everyone ]"); wait 0.75;
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
DoTest() {
  
}