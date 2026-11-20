pragma Singleton
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property alias bg: colors.bg
  property alias fg: colors.fg
  property alias subtext1: colors.subtext1
  property alias subtext2: colors.subtext2
  property alias subtext3: colors.subtext3
  property alias subtext4: colors.subtext4
  property alias bg_dark: colors.bg_dark
  property alias black: colors.black
  property alias red: colors.red
  property alias green: colors.green
  property alias orange: colors.orange
  property alias blue: colors.blue
  property alias purple: colors.purple
  property alias yellow: colors.yellow
  property alias cyan: colors.cyan
  property alias white: colors.white
  property alias bright_black: colors.bright_black
  property alias bright_red: colors.bright_red
  property alias bright_green: colors.bright_green
  property alias bright_orange: colors.bright_orange
  property alias bright_blue: colors.bright_blue
  property alias bright_purple: colors.bright_purple
  property alias bright_yellow: colors.bright_yellow
  property alias bright_cyan: colors.bright_cyan
  property alias bright_white: colors.bright_white
  property alias dark_black: colors.dark_black
  property alias dark_red: colors.dark_red
  property alias dark_green: colors.dark_green
  property alias dark_orange: colors.dark_orange
  property alias dark_blue: colors.dark_blue
  property alias dark_purple: colors.dark_purple
  property alias dark_yellow: colors.dark_yellow
  property alias dark_cyan: colors.dark_cyan
  property alias dark_white: colors.dark_white
  property alias grey0: colors.grey0
  property alias grey1: colors.grey1
  property alias grey2: colors.grey2
  property alias grey3: colors.grey3
  property alias grey4: colors.grey4

  FileView {
    path: Quickshell.shellPath("palette.json")
    watchChanges: true
    onFileChanged: reload()

    JsonAdapter {
      id: colors

      property string bg: "#0E1723"
      property string fg: "#CDCDCD"
      property string subtext1: "#9F9F9F"
      property string subtext2: "#868686"
      property string subtext3: "#717171"
      property string subtext4: "#5F5F5F"
      property string bg_dark: "#0C131D"
      property string black: "#556173"
      property string red: "#A87692"
      property string green: "#809FA1"
      property string orange: "#FD9491"
      property string blue: "#91B8E9"
      property string purple: "#B9AEE6"
      property string yellow: "#FCD0A1"
      property string cyan: "#9DBCD0"
      property string white: "#DAD0E9"
      property string bright_black: "#7C90B8"
      property string bright_red: "#D9B0C0"
      property string bright_green: "#98B1B2"
      property string bright_orange: "#FDB3B2"
      property string bright_blue: "#B4CFF0"
      property string bright_purple: "#BFB4E8"
      property string bright_yellow: "#FCD4A8"
      property string bright_cyan: "#A5C1D4"
      property string bright_white: "#DDD4EB"
      property string dark_black: "#444E5C"
      property string dark_red: "#2D2027"
      property string dark_green: "#364344"
      property string dark_orange: "#683D3B"
      property string dark_blue: "#3C4D60"
      property string dark_purple: "#48445A"
      property string dark_yellow: "#7A654E"
      property string dark_cyan: "#4C5C65"
      property string dark_white: "#938D9E"
      property string grey0: "#20262E"
      property string grey1: "#2F3843"
      property string grey2: "#404A56"
      property string grey3: "#49515E"
      property string grey4: "#575F6B"
    }
  }
}
