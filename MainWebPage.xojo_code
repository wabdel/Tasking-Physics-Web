#tag WebPage
Begin WebPage MainWebPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   False
   Height          =   1200
   ImplicitInstance=   True
   Index           =   -2147483648
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   MinimumHeight   =   1200
   MinimumWidth    =   1600
   PanelIndex      =   0
   TabIndex        =   0
   Title           =   "Tasking Physics"
   Top             =   0
   Visible         =   True
   Width           =   1420
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Surface
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  
		  Header_Container = New WEBCONTAINER_Header
		  Header_Container.Locktop = True
		  Header_Container.LockLeft = True
		  Header_Container.EmbedWithin( Self, 0, 0, _
		  Header_Container.Width, Header_Container.Height)
		  
		  
		  General_Tabs_Panel_Container = _
		  New WEBCONTAINER_General_Tabs_Panel
		  General_Tabs_Panel_Container.LockLeft = True
		  General_Tabs_Panel_Container.LockTop = True
		  General_Tabs_Panel_Container.EmbedWithin( Self, Header_Container.Left, _
		  Header_Container.Height + Header_Container.Top, _
		  General_Tabs_Panel_Container.Width, _
		  General_Tabs_Panel_Container.Height)
		  Session.LOGIN_User(-1)
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LOAD_General_User_Panels()
		  If Session.Logged_in_User = Nil Then
		    
		    If Logout_Container <> Nil Then
		      
		      Logout_Container.Style.AddTransition("opacity", 1.0, WebStyle.SpeedPatterns.EaseInOut, 0)
		      Logout_Container.Style.Value("opacity") =  Logout_Container.Style.Opacity.ToString + "%"
		      Logout_Container.Style.Value("opacity") = "0%"
		      Logout_Container.Close
		      
		    End If
		    
		    Login_Container = New WEBCONTAINER_Login
		    Login_Container.Locktop = True
		    Login_Container.LockLeft = True
		    Login_Container.EmbedWithin( Self, _
		    Header_Container.Left + Header_Container.Width, 0, _
		    Login_Container.Width, Login_Container.Height)
		    
		  Else
		    
		    If Login_Container <> Nil Then
		      
		      Login_Container.Style.AddTransition("opacity", 1.0, WebStyle.SpeedPatterns.EaseInOut, 0)
		      Login_Container.Style.Value("opacity") =  Login_Container.Style.Opacity.ToString + "%"
		      Login_Container.Style.Value("opacity") = "0%"
		      Login_Container.Close
		      
		    End If
		    
		    Logout_Container = New WEBCONTAINER_Logout
		    Logout_Container.LockTop = True
		    Logout_Container.LockLeft = True
		    Logout_Container.EmbedWithin( MainWebPage, _
		    Header_Container.Left + Header_Container.Width, 0, _
		    Logout_Container.Width, Logout_Container.Height)
		    
		  End If
		  
		  General_Tabs_Panel_Container.REFRESH_Panels
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Date_Time_Container As WEBCONTAINER_Date_Time
	#tag EndProperty

	#tag Property, Flags = &h0
		General_Tabs_Panel_Container As WEBCONTAINER_General_Tabs_Panel
	#tag EndProperty

	#tag Property, Flags = &h0
		Header_Container As WEBCONTAINER_Header
	#tag EndProperty

	#tag Property, Flags = &h0
		Hospital_Logo_Container As WEBCONTAINER_Hospital_Logo
	#tag EndProperty

	#tag Property, Flags = &h0
		Login_Container As WEBCONTAINER_Login
	#tag EndProperty

	#tag Property, Flags = &h0
		Logout_Container As WEBCONTAINER_Logout
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
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
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
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
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
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
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
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
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
#tag EndViewBehavior
