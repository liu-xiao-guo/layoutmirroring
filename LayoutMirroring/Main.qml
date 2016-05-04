import QtQuick 2.4
import Ubuntu.Components 1.3

MainView {
    id: main
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "layoutmirroring.liu-xiao-guo"

    width: units.gu(60)
    height: units.gu(85)

    LayoutMirroring.enabled: rtl
    LayoutMirroring.childrenInherit: true
    property bool rtl: Qt.application.layoutDirection == Qt.RightToLeft

    Page {
        id: page
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("LayoutMirroring")
            StyleHints {
                foregroundColor: UbuntuColors.orange
                backgroundColor: UbuntuColors.porcelain
                dividerColor: UbuntuColors.slate
            }

            trailingActionBar.actions: [
                Action {
                    text: i18n.tr('Right to Left')
                    iconName: 'flash-on'
                    visible: !rtl
                    onTriggered: rtl = !rtl
                },
                Action {
                    text: i18n.tr('Left to Right')
                    iconName: 'flash-off'
                    visible: rtl
                    onTriggered: rtl = !rtl
                }
            ]
        }

        Row {
            anchors {
                left: parent.left
                right: parent.Right
                top: page.header.bottom
                bottom: parent.bottom
            }
            spacing: units.gu(1)

            Repeater {
                model: 5

                Rectangle {
                    color: "red"
                    opacity: (5 - index) / 5
                    width: units.gu(5); height: units.gu(5)

                    Text {
                        text: index + 1
                        anchors.centerIn: parent
                    }
                }
            }
        }

    }
}

