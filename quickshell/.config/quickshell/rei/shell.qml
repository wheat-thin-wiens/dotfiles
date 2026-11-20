import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

import QtQuick
import QtQuick.Layouts

import qs.palette

PanelWindow {
  id: root

  // Font
  property string fontFamily: "JetBrainsMono Nerd Font"
  property int fontSize: 14

  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 30
  color: Colors.bg

  RowLayout {
    id: barRow
    anchors.fill: parent
    anchors.margins: 6
    spacing: 12

    // Workspaces
    Repeater {
      model: 9
      Rectangle {
        id: wsBox
        property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

        implicitWidth: wsLabel.implicitWidth + 8
        implicitHeight: root.implicitHeight - 12
        color: isActive ? Colors.subtext4 : "transparent"
        radius: 4
        Behavior on color { ColorAnimation { duration: 150 } }

        Text {
          id: wsLabel
          anchors.centerIn: parent
          text: index + 1
          color: wsMouse.containsMouse ? Colors.orange
            : (isActive ? Colors.purple: (ws ? Colors.blue : Colors.subtext2))
          Behavior on color { ColorAnimation { duration: 150 } }
          font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
        }

        MouseArea {
          id: wsMouse
          anchors.fill: parent
          anchors.margins: -barRow.spacing / 2
          hoverEnabled: true
          onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + " })")
        }
      }
    }

    Item { Layout.fillWidth: true }

  }

    // Clock
    Text {
      id: clock
      anchors.centerIn: parent
      color: Colors.blue
      font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
      text: Qt.formatDateTime(new Date(), "ddd, MMM dd - hh:mm AP")
      Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - hh:mm AP")
      }
    }

}
