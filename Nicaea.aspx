﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    </style>
</head>
<body style="background-repeat: no-repeat; background-image: url('https://cdn.discordapp.com/attachments/297969825240842242/332082673830854657/Nicaea_webform.png'); height: 272px; width: 480px;">
    <style>
        .Topleft{
            width: 60px; 
            height: 56px; 
            position: relative; 
            top: 16px; 
            left: 0px; 
            bottom: -16px;
            margin-bottom: 0px;
        }
        .TopleftLabel{
            border-style: none;
            border-color: inherit;
            border-width: 0;
            background-color: transparent; 
            color: #FFFFFF;
            text-align: center; 
            width: 60px;
            height: 16px;
        }
        .Topcenter{
            width: 207px; 
            height: 56px; 
            position: relative; 
            top: -153px; 
            left: 65px; 
            bottom: 153px;
            margin-bottom: 0px;
            display: inline-block;
        }
        .TopcenterLabel{
            border-style: none;
            border-color: inherit;
            border-width: 0;
            background-color: transparent; 
            color: #FFFFFF;
            text-align: left; 
            width: 207px;
            height: 16px;
        }
        .InfoDiv{           
            width: 267px; 
            height: 160px; 
            position: relative; 
            top: 19px; 
            left: -206px; 
            bottom: -19px;
            margin-bottom: 0px;
            display: inline-block;
        }
        .InfoLabel{
            border-style: none;
            border-color: inherit;
            border-width: 0;
            background-color: transparent; 
            color: #FFFFFF;
            text-align: left; 
            width: 267px;
            height: 160px;
        }
        .RunButton{
            position: absolute;
            background: url('https://cdn.discordapp.com/attachments/297969825240842242/332126103424729088/Nicaea_settings_icon-50.png') no-repeat center center;
            background-size: 100% 100%;
            object-fit: cover;
            height: 49px;
            width: 46px;
            top: 23px;
            left: 419px;
            margin-right: 3px;
        }
    </style>

    <div class="Topleft">
        <input id="Text1" class="TopleftLabel" type="text"; value="Name"   readonly="readonly"/>
        <input id="Text2" class="TopleftLabel" type="text"; value="Arcana" readonly="readonly"/>
        <input id="Text3" class="TopleftLabel" type="text"; value="Nicaea" readonly="readonly"/>
    </div>
    <div class="Topcenter">
        <input id="name" class="TopcenterLabel" type="text"; value="Name Here"  />
        <input id="handle" class="TopcenterLabel" type="text"; value="Handle Here"/>
        <input id="nicaea" class="TopcenterLabel" type="text"; value="Nicaea Here"/>
    </div>
    <div class="InfoDiv">
            <textarea id="info" class="InfoLabel" cols="20" name="S1" rows="2"">Your Info.</textarea>
    </div>
    <p><button id="Button1" class="RunButton" onclick="runButton()"></button></p>

        <script>
        function runButton() {
            var name = document.getElementById("name").value;
            var handle = document.getElementById("handle").value;
            var nicaea = document.getElementById("nicaea").value;
            var info = document.getElementById("info").value;
            alert("Hello, " + name + "#" + handle + "\nYour report: " + info);
            alert("Thank you very much, your report has been submitted to the server and will be reviewed shortly.\nPS: We'll be happy to have you, agent " + nicaea + "!");
        }
    </script>
</body>
</html>
