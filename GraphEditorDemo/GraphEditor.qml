﻿import QtQuick 2.3

Item {
    id: graphEditor
    anchors.fill: parent
    property real maxZoom: 2.0
    property real minZoom: 0.1
    MouseArea {
        id: graphEditorArea
        anchors.fill: parent
        property double factor: 1.15
        // Activate multisampling for edges antialiasing
        layer.enabled: true
        layer.samples: 8

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        drag.threshold: 0
        onWheel: {
            var zoomFactor = wheel.angleDelta.y > 0 ? factor : 1/factor
            var scale = draggable.scale * zoomFactor
            scale = Math.min(Math.max(minZoom, scale), maxZoom)
            if(draggable.scale == scale)
                return
            var point = mapToItem(draggable, wheel.x, wheel.y)
            draggable.x += (1-zoomFactor) * point.x * draggable.scale
            draggable.y += (1-zoomFactor) * point.y * draggable.scale
            draggable.scale = scale
        }
        onPressed: {
            if (mouse.button == Qt.MiddleButton) {
                drag.target = draggable // start drag
            }
        }
        onReleased: {
            drag.target = undefined // stop drag
        }
        Item {
            id: draggable
            // Main Layout
            MouseArea {
                id: mouseArea
                //width: 100
                //height: 100
                //drag.target: draggable
                // small drag threshold to avoid moving the node by mistake
                //drag.threshold: 2

                NodePair{}
                NodePair{}
                NodePair{}
                NodePair{}
                NodePair{}
                NodePair{}
                NodePair{}
                NodePair{}
                NodePair{}
            }
        }
    }
}
