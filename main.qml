import QtQuick 2.12
import QtQuick.Window 2.12

Window
{
    visible: true
    width: 800
    height: 480
    color: "#233343"

    FontLoader
    {
       id: fontHelvetica
       source:"qrc:/helvetica.ttf"
    }

    // Rectangle Container for Inputs
    Rectangle
    {
       id: rectInputs
       width: 150
       height: 460
       anchors.left: parent.left
       anchors.leftMargin: 10
       anchors.top: parent.top
       anchors.topMargin: 10
       color: "transparent"
       border.color: "gray"
       border.width: 2
       radius: 10

       Text
        {
           text: qsTr("INPUTS")
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top: parent.top
           anchors.topMargin: 10
           color: "white"
           font.family: fontHelvetica.name
           font.pointSize: 20
        }

       Rectangle
       {
           id: rectCnt1
           width: 80
           height: width
           radius: width / 2
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top: parent.top
           anchors.topMargin: 90
           color: "transparent"
           border.width: 2
           border.color: "green"

           Rectangle
           {
               id: inctrl1
               width: 60
               height: width
               radius: width / 2
               anchors.centerIn: parent
               color: "transparent"
           }
       }

       Text
       {
           text: "IN 1"
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top: rectCnt1.bottom
           anchors.topMargin: 10
           color: "white"
           font.family: fontHelvetica.name
           font.pointSize: 15
       }

       Rectangle
       {
           id: rectCnt2
           width: 80
           height: width
           radius: width / 2
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top: rectCnt1.bottom
           anchors.topMargin: 60
           color: "transparent"
           border.width: 2
           border.color: "green"

           Rectangle
           {
               id: inctrl2
               width: 60
               height: width
               radius: width / 2
               anchors.centerIn: parent
               color: "transparent"
           }
       }

       Text
       {
           text: "IN 2"
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top: rectCnt2.bottom
           anchors.topMargin: 10
           color: "white"
           font.family: fontHelvetica.name
           font.pointSize: 15
       }

       Image
      {
          id: imgSubscribe
          source: "qrc:/subscribe.png"
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 20
      }


    }

    // Rectangle Container for Output
    Rectangle
    {
        id: rectOutputs
        width: 620
        height: 150
        anchors.left: rectInputs.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "transparent"
        border.color: "gray"
        border.width: 2
        radius: 10

        Text
        {
            text: qsTr("OUTPUT")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            color: "white"
            font.family: fontHelvetica.name
            font.pointSize: 20
        }

        Switch
        {
            id: ledSwitch
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 70
            backgroundHeight: 50
            backgroundWidth: 110
            onSwitched:
            {
                if(on == true)
                    output.pinHigh();
                else
                    output.pinLow();
            }
        }

        Image
        {
            source: "qrc:/logo.png"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            scale: 0.7
        }
    }

    // Rectangle Container for PWM
    Rectangle
    {
        id: rectPwm
        width: 620
        height: 300
        anchors.left: rectInputs.right
        anchors.leftMargin: 10
        anchors.top: rectOutputs.bottom
        anchors.topMargin: 10
        color: "transparent"
        border.color: "gray"
        border.width: 2
        radius: 10


        Text
       {
           text: qsTr("PWM")
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top: parent.top
           anchors.topMargin: 10
           color: "white"
           font.family: fontHelvetica.name
           font.pointSize: 20
       }

       Text
       {
           text: qsTr("R")
           anchors.right: sldRed.left
           anchors.rightMargin: 30
           anchors.verticalCenter: sldRed.verticalCenter
           color: "red"
           font.family: fontHelvetica.name
           font.pointSize: 25
       }

       Slider
       {
           id: sldRed
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top: parent.top
           anchors.topMargin: 80
           width: 450
           minimum: 0
           maximum: 100
           value: 0
           step: 1
           backgroundEmpty: "lightgray"
           backgroundFull: "red"
           pressCircle: "red"
           onValueChanged:
           {
               pwmRed.setPwmValue(value);
           }
       }

       Text
       {
           text: sldRed.value
           anchors.left: sldRed.right
           anchors.leftMargin: 10
           anchors.verticalCenter: sldRed.verticalCenter
           color: "white"
           font.family: fontHelvetica.name
           font.pointSize: 25
       }

       Text
      {
          text: qsTr("G")
          anchors.right: sldGreen.left
          anchors.rightMargin: 30
          anchors.verticalCenter: sldGreen.verticalCenter
          color: "lightgreen"
          font.family: fontHelvetica.name
          font.pointSize: 25
      }

      Slider
      {
          id: sldGreen
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.top: sldRed.bottom
          anchors.topMargin: 70
          width: 450
          minimum: 0
          maximum: 100
          value: 0
          step: 1
          backgroundEmpty: "lightgray"
          onValueChanged:
          {
              pwmGreen.setPwmValue(value);
          }
      }

      Text
      {
          text: sldGreen.value
          anchors.left: sldGreen.right
          anchors.leftMargin: 10
          anchors.verticalCenter: sldGreen.verticalCenter
          color: "white"
          font.family: fontHelvetica.name
          font.pointSize: 25
      }

      Text
      {
          text: qsTr("B")
          anchors.right: sldBlue.left
          anchors.rightMargin: 30
          anchors.verticalCenter: sldBlue.verticalCenter
          color: "blue"
          font.family: fontHelvetica.name
          font.pointSize: 25
      }

      Slider
      {
          id: sldBlue
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.top: sldGreen.bottom
          anchors.topMargin: 70
          width: 450
          minimum: 0
          maximum: 100
          value: 0
          step: 1
          backgroundEmpty: "lightgray"
          backgroundFull: "blue"
          pressCircle: "blue"
          onValueChanged:
          {
              pwmBlue.setPwmValue(value);
          }
      }

      Text
      {
          text: sldBlue.value
          anchors.left: sldBlue.right
          anchors.leftMargin: 10
          anchors.verticalCenter: sldBlue.verticalCenter
          color: "white"
          font.family: fontHelvetica.name
          font.pointSize: 25
      }


    }

    SequentialAnimation
    {
        PropertyAnimation
        {
            target: imgSubscribe
            properties: "opacity"
            from: 0; to:1
            duration: 1000
            easing.type: Easing.InOutQuad

        }

        PauseAnimation { duration: 1000 }

        PropertyAnimation
        {
            target: imgSubscribe
            properties: "opacity"
            from: 1; to:0
            duration: 1000
            easing.type: Easing.InOutQuad
        }

        running: true
        loops: Animation.Infinite
    }

    Connections
   {
       target: input1

       onInputChanged:
       {
           if(value == 0)
               inctrl1.color = "lightgray"
           else
               inctrl1.color = "transparent"
       }
   }

   Connections
   {
       target: input2

       onInputChanged:
       {
           if(value == 0)
               inctrl2.color = "lightgray"
           else
               inctrl2.color = "transparent"
       }
   }


}
