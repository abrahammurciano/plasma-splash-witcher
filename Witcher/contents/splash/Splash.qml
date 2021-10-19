import QtQuick 2.5

Image {
    id: root
    source: "images/background.png"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Image {
            id: base
            property real size: units.gridUnit * 12
            anchors.centerIn: parent
            source: "images/base.png"
            sourceSize.width: 600
        }

        Image {
            id: overlay
            source: "images/overlay.png"
            anchors.centerIn: parent
            sourceSize.width: 600

            SequentialAnimation {
				running: true
				loops: Animation.Infinite

				OpacityAnimator {
					target: overlay
					from: 1
					to: 0
					duration: 1200
				}
				OpacityAnimator {
					target: overlay
					from: 0
					to: 1
					duration: 1200
				}
			}
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
