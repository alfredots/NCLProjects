<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="focus" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">
<head>

  <regionBase>
    <region id="mainDevice" width="100%" height="100%">
      <region id="rS" left="5%" top="5%" width="40%" height="40%" zIndex="7"/>
      <region id="rB1" right="10%" top="10%" width="10%" height="10%" zIndex="7"/>
      <region id="rB2" right="10%" top="30%" width="10%" height="10%" zIndex="7"/>
      <region id="rB3" right="10%" top="50%" width="10%" height="10%" zIndex="7"/>
      <region id="rB4" right="10%" top="70%" width="10%" height="10%" zIndex="7"/>
      <region id="rT1" left="5%" top="55%" width="40%" height="40%" zIndex="7"/>
    </region>
  </regionBase>

  <descriptorBase>
    <descriptor id="dS" region="rS"/>

    <descriptor id="dB1" region="rB1"
     focusIndex="ixB1"
     moveUp="ixB4" moveDown="ixB2"
     focusSrc="img/yellow.gif"
     focusSelSrc="img/green.gif"/>

    <descriptor id="dB2" region="rB2"
     focusIndex="ixB2"
     moveUp="ixB1" moveDown="ixB3"
     focusSrc="img/yellow.gif"
     focusSelSrc="img/green.gif"/>

    <descriptor id="dB3" region="rB3"
     focusIndex="ixB3"
     moveUp="ixB2" moveDown="ixB4"
     focusSrc="img/yellow.gif"
     focusSelSrc="img/green.gif"/>

    <descriptor id="dB4" region="rB4"
     focusIndex="ixB4"
     moveUp="ixB3" moveDown="ixB1" moveLeft="ixT1"
     focusSrc="img/yellow.gif"
     focusSelSrc="img/green.gif"/>

    <descriptor id="dT1" region="rT1"
     focusIndex="ixT1"
     moveRight="ixB4">
       <descriptorParam name="background" value="black"/>
    </descriptor>

  </descriptorBase>

  <connectorBase>
    <causalConnector id="onBeginStart">
      <simpleCondition role="onBegin"/>
      <simpleAction role="start" max="unbounded" qualifier="par"/>
    </causalConnector>

    <causalConnector id="onSelectionStop">
      <connectorParam name="value"/>
      <simpleCondition role="onSelection"/>
      <simpleAction role="stop" max="unbounded" qualifier="par"/>
    </causalConnector>

    <causalConnector id="onSelectionSetVar">
      <connectorParam name="value"/>
      <connectorParam name="var"/>
      <simpleCondition role="onSelection"/>
      <simpleAction role="set" value="$var" max="unbounded" qualifier="seq"/>
    </causalConnector>

    <causalConnector id="onBeginSetVar">
      <connectorParam name="var"/>
      <simpleCondition role="onBegin"/>
      <simpleAction role="set" value="$var"/>
    </causalConnector>
  </connectorBase>

</head>

<body>
  <port id="entrada" component="s"/>

  <media descriptor="dS" id="s" src="video/corrego1.mp4"/>

  <media descriptor="dB1" id="b1" src="img/gray.gif"/>
  <media descriptor="dB2" id="b2" src="img/gray.gif"/>
  <media descriptor="dB3" id="b3" src="img/gray.gif"/>
  <media descriptor="dB4" id="b4" src="img/gray.gif"/>
  <media descriptor="dT1" id="t1" src="txt/text1.txt">
    <property name="fontUri"/>
    <property name="fontColor"/>
    <property name="fontSize"/>
  </media>

  <link id="linkInicio" xconnector="onBeginStart">
    <bind component="s" role="onBegin"/>
    <bind component="b1" role="start"/>
    <bind component="b2" role="start"/>
    <bind component="b3" role="start"/>
    <bind component="b4" role="start"/>
    <bind component="t1" role="start"/>
  </link>

  <link id="linkInicio2" xconnector="onSelectionSetVar">
    <bind component="b1" role="onSelection"/>
    <bind component="t1" interface="fontUri" role="set">
      <bindParam name="var" value="/usr/local/share/fonts/truetype/vera.ttf"/>
    </bind>
    <bind component="t1" interface="fontColor" role="set">
      <bindParam name="var" value="red"/>
    </bind>
    <bind component="t1" interface="fontSize" role="set">
      <bindParam name="var" value="8"/>
    </bind>
  </link>

  <link id="linkInicio3" xconnector="onSelectionSetVar">
    <bind component="b2" role="onSelection"/>
    <bind component="t1" interface="fontColor" role="set">
      <bindParam name="var" value="green"/>
    </bind>
    <bind component="t1" interface="fontSize" role="set">
      <bindParam name="var" value="10"/>
    </bind>
  </link>

  <link id="linkInicio4" xconnector="onSelectionSetVar">
    <bind component="b3" role="onSelection"/>
    <bind component="t1" interface="fontColor" role="set">
      <bindParam name="var" value="black"/>
    </bind>
    <bind component="t1" interface="fontSize" role="set">
      <bindParam name="var" value="10"/>
    </bind>
  </link>

  <link id="linkTransicaoPraia" xconnector="onSelectionStop">
    <bind component="b4" role="onSelection"/>
    <bind component="s" role="stop"/>
    <bind component="b1" role="stop"/>
    <bind component="b2" role="stop"/>
    <bind component="b3" role="stop"/>
    <bind component="b4" role="stop"/>
    <bind component="t1" role="stop"/>
  </link>

</body>
</ncl>
