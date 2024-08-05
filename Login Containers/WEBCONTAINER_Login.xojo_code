#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Login
   Compatibility   =   ""
   ControlCount    =   0
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
   PanelIndex      =   0
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   350
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebButton Login_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Login"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   6
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   127
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLabel User_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   43
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   1
      TabStop         =   True
      Text            =   "User :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   22
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLabel Password_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   43
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   2
      TabStop         =   True
      Text            =   "Password :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   66
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebTextField User_TextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   151
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   3
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   1
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   179
      _mPanelIndex    =   -1
   End
   Begin WebTextField Password_TextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   1
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   151
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   4
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   1
      Tooltip         =   ""
      Top             =   68
      Visible         =   True
      Width           =   179
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Self.Style.BackgroundColor = Design_Palette.COLOR_Surface
		  Self.Style.BorderColor = Design_Palette.COLOR_Border
		  Self.Style.BorderThickness = 2
		  Self.Style.Value("border-radius") = "15px;"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ENABLE_Login_Button()
		  
		  
		  
		  If User_TextField.Text <> "" And Password_TextField.Text <> "" Then
		    
		    
		    Login_Button.Style.BackgroundColor = Design_Palette.COLOR_Primary_Variant
		    Login_Button.Style.ForegroundColor = Design_Palette.COLOR_On_Primary_Variant
		    Login_Button.Enabled = True
		    'Login_Button.Style.Value("box-shadow") = "0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)"
		    
		  Else
		    
		    
		    Login_Button.Style.BackgroundColor = Design_Palette.COLOR_Primary
		    Login_Button.Style.ForegroundColor = Design_Palette.COLOR_On_Primary
		    Login_Button.Enabled = False
		    'Login_Button.Style.Value("box-shadow") = "none"
		    
		  End If
		  
		  
		  
		  'Me.UpdateBrowser
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Login_Button
	#tag Event
		Sub Pressed()
		  
		  Var db As New MySQLCommunityServer
		  db.Host = Physics_Tasking.db_host
		  db.Port = Physics_Tasking.db_port
		  db.DatabaseName = Physics_Tasking.db_name
		  db.UserName = Physics_Tasking.db_username
		  db.Password = Physics_Tasking.db_password
		  
		  Try
		    
		    If db.Connect Then
		      
		      Var ps As  MySQLPreparedStatement = _
		      db.Prepare("SELECT user_id, password, reset_password, is_active " _
		      + "FROM physics_tasking.users " _
		      + "WHERE login = ?")
		      
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      
		      Var rs As RowSet = ps.SelectSQL(User_TextField.Text.Trim.Lowercase)
		      
		      If rs.RowCount = 0 Or rs.Column("password").BlobValue <> _
		        Crypto.Hash(Password_TextField.Text, Crypto.Algorithm.SHA512) Then
		        
		        Var theDialog As New MessageWebDialog
		        
		        theDialog.Message_Label.Text = "Login is invalid"
		        theDialog.Show
		        
		        Return
		        
		        
		      End If
		      
		      
		      
		      
		      If rs.Column("reset_password").BooleanValue Then
		        
		        Var theDialog As New WebDialog_Reset_Password
		        theDialog.user_id = rs.Column("user_id").IntegerValue
		        theDialog.Show
		        
		        Return
		        
		      Else
		        
		        If Not rs.Column("is_active").BooleanValue Then
		          
		          Var sql As String = "UPDATE physics_tasking.users " _
		          + "SET is_active = TRUE " _
		          + "WHERE user_id = " + rs.Column("user_id").IntegerValue.ToString + ";"
		          Physics_Tasking.EXECUTE_Statement(sql)
		          
		          App.last_database_update = DateTime.Now
		          
		        End If
		        Session.LOGIN_User(rs.Column("user_id").IntegerValue)
		        
		        
		        Self.Close
		        
		      End If
		      
		      
		    Else
		      
		      Var theDialog As New MessageWebDialog
		      
		      theDialog.Message_Label.Text = "Login is invalid"
		      theDialog.Show
		      
		      Return
		      
		      
		    End If
		    
		  Catch de As DatabaseException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + de.ErrorNumber.ToString + ") " + de.Message + "."
		    theDialog.Show
		    
		  Catch noe As NilObjectException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + noe.ErrorNumber.ToString + ") " + noe.Message + "."
		    theDialog.Show
		    
		  End Try
		  
		  
		  'Var sql As  String = "SELECT user_id, password
		  '
		  'For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		  '
		  '
		  'If item.login = User_TextField.Text _
		  'And item.resetPassword _
		  'and Password_TextField.Text = "12345678" Then
		  '
		  'Var theDialog As New WebDialog_Reset_Password
		  '
		  'theDialog.user_id = item.id
		  'theDialog.Show
		  '
		  '
		  'Return
		  '
		  'End If
		  'Next item
		  '
		  '
		  '
		  '
		  'Var id As Integer = Physics_Tasking.RETURN_Login_User_ID( User_TextField.Text, Password_TextField.Text)
		  '
		  'If id = 0 Then
		  '// Create an instance of the dialog
		  'Var theDialog As New MessageWebDialog
		  '
		  'theDialog.Message_Label.Text = "Login is invalid"
		  'theDialog.Show
		  '
		  'Else
		  '
		  '
		  '
		  '
		  '
		  '
		  'Session.LOGIN_User(id)
		  '
		  '
		  'End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  'Me.Style.AddTransition("width", 5, WebStyle.SpeedPatterns.EaseInOut, 0)
		  'Me.Style.Value("width") = Me.Width.ToString + "px"
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Primary
		  Me.Style.BackgroundColor = Design_Palette.COLOR_On_Primary
		  Me.Style.BorderColor = Design_Palette.COLOR_Border
		  ENABLE_Login_Button
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events User_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Password_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events User_TextField
	#tag Event
		Sub TextChanged()
		  ENABLE_Login_Button
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Password_TextField
	#tag Event
		Sub TextChanged()
		  ENABLE_Login_Button
		End Sub
	#tag EndEvent
#tag EndEvents
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
