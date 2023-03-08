#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Header
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   200
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   870
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebImageViewer ImageViewer_App_Logo
      ControlID       =   ""
      Enabled         =   True
      Height          =   150
      HorizontalAlignment=   2
      Index           =   -2147483648
      Indicator       =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Picture         =   1759225855
      Scope           =   0
      SVGData         =   ""
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   20
      URL             =   ""
      VerticalAlignment=   2
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
      _ProtectImage   =   False
   End
   Begin WebImageViewer ImageViewer_Hospital_Logo
      ControlID       =   ""
      Enabled         =   True
      Height          =   94
      HorizontalAlignment=   2
      Index           =   -2147483648
      Indicator       =   0
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Picture         =   2129203199
      Scope           =   0
      SVGData         =   ""
      TabIndex        =   1
      Tooltip         =   ""
      Top             =   20
      URL             =   ""
      VerticalAlignment=   2
      Visible         =   True
      Width           =   480
      _mPanelIndex    =   -1
      _ProtectImage   =   False
   End
   Begin WebLabel Date_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   48
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   2
      Text            =   "Date"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   122
      Underline       =   False
      Visible         =   True
      Width           =   273
      _mPanelIndex    =   -1
   End
   Begin WebLabel Time_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   48
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   704
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   3
      Text            =   "Time"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   122
      Underline       =   False
      Visible         =   True
      Width           =   146
      _mPanelIndex    =   -1
   End
   Begin WebTimer UPDATE_Date_Time_Timer
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   0
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   2
      Scope           =   2
      _mPanelIndex    =   -1
   End
   Begin WebLabel Notes_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   345
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   4
      Text            =   "Notes"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   153
      Underline       =   False
      Visible         =   True
      Width           =   525
      _mPanelIndex    =   -1
   End
   Begin WebCanvas Online_Canvas
      ControlID       =   ""
      DiffEngineDisabled=   False
      Enabled         =   True
      Height          =   30
      Index           =   -2147483648
      Indicator       =   0
      Left            =   198
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   5
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   30
      _mPanelIndex    =   -1
   End
   Begin WebLabel Build_date_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   11.0
      Height          =   21
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   178
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   6
      Text            =   "Built 0n :"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   61
      Underline       =   False
      Visible         =   True
      Width           =   184
      _mPanelIndex    =   -1
   End
   Begin WebButton Directory_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Directory"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   6
      Left            =   596
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   7
      Tooltip         =   ""
      Top             =   153
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton Calendar_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Calendar"
      ControlID       =   ""
      Default         =   False
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   6
      Left            =   704
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   8
      Tooltip         =   ""
      Top             =   153
      Visible         =   False
      Width           =   100
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  ImageViewer_Hospital_Logo.Top = Me.Top - ImageViewer_Hospital_Logo.Height - 20
		  
		  Me.Style.BackgroundColor = Session.COLOR_Background
		  POPULATE_Date_Time
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub POPULATE_Date_Time()
		  
		  
		  Var d As DateTime = DateTime.Now
		  
		  Date_Label.Text = d.ToString( Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None)
		  Time_Label.Text = d.ToString( Locale.Current, DateTime.FormatStyles.None, DateTime.FormatStyles.Short)
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events ImageViewer_App_Logo
	#tag Event
		Sub Opening()
		  
		  
		  Var p As Picture = New Picture( Me.Width, Me.Height)
		  p.Graphics.DrawPicture( Me.Picture, _
		  0, 0, p.Width, p.Height, _
		  0, 0, Me.Picture.Width, Me.Picture.Height)
		  
		  Me.Picture = p // Automatically converts Picture to WebPicture
		  
		  
		  Me.Style.Value("position") = "absolute; left:-170px;"
		  Me.Style.AddTransition("transform", 2.0, WebStyle.SpeedPatterns.EaseInOut, 0)
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Shown()
		  Me.Style.Value("transform") = "translatex(170px) rotate(14deg);"
		  Me.Style.Value("transform-origin") =  "center"
		  Me.Style.Value("box-shadow") = "0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)"
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(x as Integer, y as Integer)
		  'Me.Style.Value("transform") = "rotate(180deg) translatex(190px)"
		  'Me.Style.Value("position") = "absolute; left:10px;"
		  'Me.Style.Value("transform") = "translatex(170px) rotate(14deg);"
		  'Me.Style.Value("transform") = "rotate(14deg);"
		  
		  'Me.Style.Value("transform") = "rotate(720deg); translatex(170px);"
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ImageViewer_Hospital_Logo
	#tag Event
		Sub Opening()
		  Var aPicture As Picture = New Picture(Me.Width,Me.Height)
		  
		  aPicture.graphics.drawpicture( Me.Picture, 0, 0, Me.width, Me.height, _
		  0, 0, Me.Picture.width, Me.Picture.height)
		  
		  Me.Picture =CType(aPicture, WebPicture)
		  
		  'Me.Style.Value("border-style") = "double"
		  Me.Style.BackgroundColor = &cFFFFFF00
		  
		  Me.Style.Value("transform") = "scale(0.3, 0.3)"
		  
		  Me.Style.AddTransition("transform", 2.0, WebStyle.SpeedPatterns.EaseInOut, 0)
		  Me.Style.Value("transform-origin") =  "center"
		  'Me.Style.Value("box-shadow") = "0 8px 16px 0 rgba(255,204,0,0.2), 0 6px 20px 0 rgba(255,204,0,0.19)"
		  Me.Style.Value("box-shadow") ="0 1px 2px rgba(0,0,0,0.07), " _
		  + "0 2px 4px rgba(0,0,0,0.07), " _
		  + "0 4px 8px rgba(0,0,0,0.07), " _
		  + "0 8px 16px rgba(0,0,0,0.07), " _
		  + "0 16px 32px rgba(0,0,0,0.07), " _
		  + "0 32px 64px rgba(0,0,0,0.07);"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Shown()
		  Me.Style.Value("transform") = "translatey(134px)" // scale(2, 0.5);"
		  'Me.Style.Value("box-shadow") = "0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Date_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Color.White 
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Time_Label
	#tag Event
		Sub Opening()
		  'Me.Style.Value("font-family") = "times" 
		  'Me.Style.Value("font-style") = "normal"
		  'Me.Style.Value("color") = "#ff5722" 
		  
		  'Me.Style.Value("font") = "1.2em Fira Sans, sans-serif;"
		  Me.Style.Value("font-style") = "oblique 14deg;"
		  Me.Style.ForegroundColor = Color.White 
		  
		  
		  'Font-variation-settings: 'slnt' 14;
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UPDATE_Date_Time_Timer
	#tag Event
		Sub Run()
		  POPULATE_Date_Time
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Notes_Label
	#tag Event
		Sub Opening()
		  Me.Text = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Online_Canvas
	#tag Event
		Sub Paint(g as WebGraphics)
		  If Physics_Tasking.isDatabase_Online Then
		    
		    g.DrawingColor = &c21FE8000
		  Else
		    
		    g.DrawingColor = &cFC666500
		    
		  End If
		  g.FillOval(0, 0, Me.Width, Me.Height)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(x as Integer, y as Integer)
		  Var dialog As New Database_WebDialog
		  dialog.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Build_date_Label
	#tag Event
		Sub Opening()
		  
		  Me.Style.ForegroundColor = &cFFD47900
		  Me.Style.Value("text-align") = "center;"
		  
		  
		  Me.Text = "Built on: " + App.BuildDateTime.ToString( Locale.Current, DateTime.FormatStyles.long, DateTime.FormatStyles.None)
		  
		  
		  //Application.BuildDateTime.ToString( Locale.Current, DateTime.FormatStyles.long, DateTime.FormatStyles.None)
		  
		  '.animate-charcter
		  '{
		  'Text-transform: uppercase;
		  'background-image: linear-gradient(
		  '-225deg,
		  '#231557 0%,
		  '#44107a 29%,
		  '#ff1361 67%,
		  '#fff800 100%
		  ');
		  'background-size: Auto auto;
		  'background-clip: border-box;
		  'background-size: 200% auto;
		  'Color: #fff;
		  'background-clip: text;
		  'Text-fill-Color: transparent;
		  '-webkit-background-clip: text;
		  '-webkit-Text-fill-Color: transparent;
		  'animation: textclip 2s linear infinite;
		  'display: inline-block;
		  'Font-size: 190px;
		  '}
		  '
		  '@keyframes textclip {
		  'To {
		  'background-position: 200% center;
		  '}
		  '}
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Directory_Button
	#tag Event
		Sub Pressed()
		  Var theDialog As New WebDialog_Directory
		  theDialog.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Calendar_Button
	#tag Event
		Sub Pressed()
		  Var theDialog As New WEBDIALOG_Calendar
		  theDialog.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScrollDirection"
		Visible=true
		Group="Behavior"
		InitialValue="ScrollDirections.None"
		Type="WebContainer.ScrollDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - Horizontal"
			"2 - Vertical"
			"3 - Both"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="View"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="View"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
