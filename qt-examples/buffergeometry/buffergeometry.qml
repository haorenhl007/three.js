import QtQuick 2.0
import QtCanvas3D 1.0

import "buffergeometry.js" as GLCode

Item {
    id: mainview
    width: 1280
    height: 768
    visible: true

    Canvas3D {
        id: canvas3d
        anchors.fill: parent
        focus: true
        logAllCalls: false
        logAllErrors: false

        // Emitted when one time initializations should happen
        onInitGL: {
            GLCode.initGL(canvas3d);
        }

        // Emitted each time Canvas3D is ready for a new frame
        onRenderGL: {
            GLCode.renderGL(canvas3d);
        }

        onWidthChanged: {
            GLCode.onCanvasResize(canvas3d);
        }

        onHeightChanged: {
            GLCode.onCanvasResize(canvas3d);
        }

        onDevicePixelRatioChanged: {
            GLCode.onCanvasResize(canvas3d);
        }
    }
}
