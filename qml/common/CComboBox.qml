import QtQuick
import QtQuick.Controls.Basic

import Display

ComboBox {
    // FIXME: Colors for hovered item in the popup

    palette.text: MyStyles.style.foreground // Foreground popup
    palette.buttonText: MyStyles.style.foreground // Foreground text
    palette.button: MyStyles.style.background // Background color
    palette.mid: MyStyles.style.background // Button background color when popup shown
    palette.window: MyStyles.style.background // Popup background color
    palette.dark: MyStyles.style.foreground // Foreground indicator

    font.pointSize: MyStyles.font.pointSize
}
