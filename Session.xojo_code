#tag Class
Protected Class Session
Inherits WebSession
#tag Session
  interruptmessage=We are having trouble communicating with the server. Please wait a moment while we attempt to reconnect.
  disconnectmessage=You have been disconnected from this application.
  confirmmessage=
  AllowTabOrderWrap=True
#tag EndSession
	#tag Event
		Sub Opening()
		  
		  DEFINE_WebStyles
		  Self.UserTimeout = 0
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub UserTimedOut()
		  If session.UserTimeout = Session.session_Idle_timeout Then
		    
		    TimeoutDialog = New SessionWarningDialog
		    TimeoutDialog.Show
		    Self.UserTimeout = session.confirm_idle_Timeout
		    
		  ElseIf session.UserTimeout = session.confirm_idle_Timeout Then
		    
		    TimeoutDialog.Close
		    Self.LOGIN_User(-1)
		    
		  End If
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DEFINE_WebStyles()
		  // Label
		  
		  Session.WEBSTYLE_Label = New WebStyle
		  Session.WEBSTYLE_Label.ForegroundColor = Color.White
		  Session.WEBSTYLE_Label.FontSize = 14
		  
		  
		  Session.WEBSTYLE_Note = New WebStyle
		  Session.WEBSTYLE_Note.ForegroundColor = Color.Orange
		  Session.WEBSTYLE_Note.Italic = True
		  Session.WEBSTYLE_Note.FontSize = 14
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LOGIN_User(id as Integer)
		  If id = -1 Then
		    
		    Logged_in_User = Nil
		    Self.UserTimeout = 0
		    Session.My_Completed_Plans.ResizeTo(-1)
		    Session.My_Due_Plans.ResizeTo(-1)
		    Session.My_Tasks.ResizeTo(-1)
		    
		  Else
		    
		    Logged_in_User = New Physics_Tasking.CLASS_User_Record
		    Logged_in_User.id = id
		    
		    Self.UserTimeout = session_Idle_timeout
		    
		    
		  End If
		  
		  MainWebPage.LOAD_General_User_Panels
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		COLOR_Background As Color = &c33333300
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Central_Background As Color = &c55555500
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Central_Background2 As Color = &c77777700
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Foreground As Color = &cFFFEFE00
	#tag EndProperty

	#tag Property, Flags = &h0
		darkmode As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Logged_in_User As Physics_Tasking.CLASS_User_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		My_Completed_Plans() As Physics_Tasking.CLASS_Plan_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		My_Due_Plans() As Physics_Tasking.CLASS_Plan_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		My_Due_Plans_Latest_Update As Datetime
	#tag EndProperty

	#tag Property, Flags = &h0
		My_Plans_Changed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		My_Tasks() As Physics_Tasking.CLASS_Task_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		My_Task_Changed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TimeoutDialog As SessionWarningDialog
	#tag EndProperty

	#tag Property, Flags = &h0
		WEBSTYLE_Label As WebStyle
	#tag EndProperty

	#tag Property, Flags = &h0
		WEBSTYLE_Note As WebStyle
	#tag EndProperty


	#tag Constant, Name = confirm_idle_Timeout, Type = Double, Dynamic = False, Default = \"30", Scope = Public
	#tag EndConstant

	#tag Constant, Name = session_Idle_timeout, Type = Double, Dynamic = False, Default = \"3600", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
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
			Name="HashTag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageRightToLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScaleFactor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserTimeout"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_baseurl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisconnectMessage"
			Visible=true
			Group="Behavior"
			InitialValue="You have been disconnected from this application."
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InterruptionMessage"
			Visible=true
			Group="Behavior"
			InitialValue="We are having trouble communicating with the server. Please wait a moment while we attempt to reconnect."
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_LastMessageTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabOrderWrap"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfirmDisconnectMessage"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Platform"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDarkMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Background"
			Visible=false
			Group="Behavior"
			InitialValue="&c33333300"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Central_Background"
			Visible=false
			Group="Behavior"
			InitialValue="&c55555500"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Central_Background2"
			Visible=false
			Group="Behavior"
			InitialValue="&c77777700"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Foreground"
			Visible=false
			Group="Behavior"
			InitialValue="&cFFFEFE00"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="My_Task_Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="My_Plans_Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
