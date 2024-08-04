#tag WebContainerControl
Begin WebContainer WEBCONTAINER_General_Tabs_Panel
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   78
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
   PanelIndex      =   0
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   200
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Background
		  'Me.Style.AddTransition("opacity", 2, WebStyle.SpeedPatterns.EaseInOut, 0)
		  'Me.Style.Value("opacity") = "0%"
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  'Me.Style.Value("opacity") = "100%"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ADD_Tabs_for_Admin()
		  Tab_Container.ResizeTo(-1)
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Database"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Plans"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Assigned Tasks"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Patients"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "On-Calls"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ADD_Tabs_for_General()
		  Tab_Container.ResizeTo(-1)
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Calendar"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Plans"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Tasks"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "QC Reports"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Reports"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Statistics"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Search"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ADD_Tabs_for_User()
		  Tab_Container.ResizeTo(-1)
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Dashboard"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Plans"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Tasks"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Reports"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Search"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "My Statistics"
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Assign Plan"
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Indicator = _
		  WebUIControl.Indicators.Info
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Assign Task"
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Indicator = _
		  WebUIControl.Indicators.Info
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Add Completed Task"
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Style.FontSize = 10
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Indicator = _
		  WebUIControl.Indicators.Link
		  
		  Tab_Container.Append( New WEBCONTAINER_Tab)
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Caption = _
		  "Time log"
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Style.FontSize = 10
		  Tab_Container(Tab_Container.LastIndex).Tab_Button.Indicator = _
		  WebUIControl.Indicators.Link
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LOAD_Central_Panal(button_caption as String)
		  For Each item As WEBCONTAINER_Tab In Tab_Container
		    If item.Tab_Button.Caption <> button_caption Then
		      
		      'item.Tab_Button.Style.BackgroundColor = Design_Palette.COLOR_Button_Info
		      'item.Tab_Button.Style.BorderColor = Session.COLOR_Button_Info
		      'item.Tab_Button.Style.ForegroundColor = Color.Black
		      Item.Tab_Button.Indicator = WebUIControl.Indicators.Info
		    Else
		      
		      'item.Tab_Button.Style.BackgroundColor = Design_Palette.COLOR_Button_Primary
		      'Item.Tab_Button.Style.BorderColor = Session.COLOR_Button_Primary
		      'item.Tab_Button.Style.ForegroundColor = Color.White
		      Item.Tab_Button.Indicator = WebUIControl.Indicators.Primary
		      
		      
		    End If
		  Next item
		  If Central_Container <> Nil Then
		    
		    Central_Container.Close
		    
		  End If
		  
		  
		  Select Case button_caption
		  Case "Calendar"
		    
		    Central_Container = New WEBCONTAINER_Activity_Calendar
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		  Case "On-Calls"
		    
		    
		    Central_Container = New WEBCONTAINER_On_Call_Calendar
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Plans"
		    
		    
		    Central_Container = New WEBCONTAINER_Plans
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		    
		  Case "Tasks"
		    
		    
		    Central_Container = New WEBCONTAINER_Tasks
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Database"
		    
		    
		    Central_Container = New WEBCONTAINER_Database_Management
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Plans"
		    
		    
		    Central_Container = New WEBCONTAINER_Plans_Management
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Assigned Tasks"
		    
		    
		    Central_Container = New WEBCONTAINER_Assigned_Tasks_Management
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Patients"
		    
		    
		    Central_Container = New WEBCONTAINER_Patients_Management
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Dashboard"
		    
		    
		    Central_Container = New WEBCONTAINER_DashBoard
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Assign Plan"
		    
		    Central_Container = New WEBCONTAINER_Assign_Plan
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Assign Task"
		    
		    Central_Container = New WEBCONTAINER_Assign_Task
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Add Completed Task"
		    
		    Central_Container = New WEBCONTAINER_Add_Task
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Statistics"
		    
		    Central_Container = New WEBCONTAINER_Statistics
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Reports"
		    
		    Central_Container = New WEBCONTAINER_Reports
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "My Statistics"
		    
		    Central_Container = New WEBCONTAINER_User_Statistics
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Time log"
		    
		    Central_Container = New WEBCONTAINER_TimeLog
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "Search"
		    
		    Central_Container = New WEBCONTAINER_Search
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  Case "QC Reports"
		    
		    Central_Container = New WEBCONTAINER_QCReports
		    Central_Container.LockLeft = True
		    Central_Container.LockTop = True
		    Central_Container.EmbedWithin( MainWebPage, _
		    MainWebPage.General_Tabs_Panel_Container.Width, _
		    MainWebPage.Header_Container.Top + MainWebPage.Header_Container.Height, _
		    Central_Container.Width, Central_Container.Height)
		    
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub REFRESH_Panels()
		  'Me.Style.BackgroundColor = Color.White
		  For i As Integer = Tab_Container.LastIndex To 0 Step -1
		    
		    Tab_Container(i).Close
		    
		  Next i
		  
		  Self.Height = 0
		  Self.UpdateBrowser
		  
		  'Me.Style.BackgroundColor = Color.White 
		  If Session.Logged_in_User <> Nil Then
		    Select Case Session.Logged_in_User.Group.id
		    Case 1
		      
		      'Me.Style.BackgroundColor = App.COLOR_Admin
		      ADD_Tabs_for_Admin
		      
		    Case 2
		      
		      'Me.Style.BackgroundColor = App.COLOR_Physicist
		      ADD_Tabs_for_User
		      
		    Case 3
		      
		      'Me.Style.BackgroundColor = App.COLOR_Dosimetrist
		      ADD_Tabs_for_User
		      
		    End Select
		    
		  Else
		    
		    'Me.Style.BackgroundColor = App.COLOR_General
		    
		    ADD_Tabs_for_General
		    
		  End If
		  
		  
		  Me.Width = Tab_Container(0).width
		  
		  For i As Integer = 0 To Tab_Container.LastIndex
		    
		    Self.Height = Self.Height + Tab_Container(i).Height
		    Tab_Container(i).LockTop = True
		    Tab_Container(i).LockLeft= True
		    Tab_Container(i).Tab_Button.Indicator = _
		    WebUIControl.Indicators.Light
		    
		    Tab_Container(i).EmbedWithin( Self, Self.Left, _
		    Self.Top + Tab_Container(i).Height * i, _
		    Tab_Container(i).Width, _
		    Tab_Container(i).Height)
		    
		    
		  Next i
		  
		  Self.UpdateBrowser
		  
		  
		  LOAD_Central_Panal( Tab_Container(0).Tab_Button.Caption)
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Central_Container As WebContainer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Session_WebDialog As WebDialog
	#tag EndProperty

	#tag Property, Flags = &h0
		Tab_Container() As WEBCONTAINER_Tab
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="PanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
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
