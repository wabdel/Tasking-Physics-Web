#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Logout
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
   Width           =   666
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebButton Logout_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Logout"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   3
      Left            =   115
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
      Top             =   142
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
      Left            =   20
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
      Text            =   "User"
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   245
      _mPanelIndex    =   -1
   End
   Begin WebLabel Group_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   20
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
      Text            =   "Group"
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   64
      Underline       =   False
      Visible         =   True
      Width           =   245
      _mPanelIndex    =   -1
   End
   Begin WebLabel Points_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   330
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
      TabIndex        =   3
      TabStop         =   True
      Text            =   "Points = "
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   155
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebTimer Points_Timer
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   0
      LockedInPosition=   False
      PanelIndex      =   0
      Period          =   1000
      RunMode         =   2
      Scope           =   2
      _mPanelIndex    =   -1
   End
   Begin WebLabel Acc_Plan_Points_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   330
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
      TabIndex        =   4
      TabStop         =   True
      Text            =   "Plan points (A) = "
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebLabel Acc_Task_Points_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   330
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
      TabIndex        =   5
      TabStop         =   True
      Text            =   "Task points (A) = "
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   53
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebLabel Cur_Plan_Points_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   330
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
      TabIndex        =   6
      TabStop         =   True
      Text            =   "Plan points (R) = "
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   86
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebLabel Cur_Task_Points_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   330
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
      TabIndex        =   7
      TabStop         =   True
      Text            =   "Task points (R) = "
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   119
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebLabel Points_Value_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   478
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
      TabIndex        =   8
      TabStop         =   True
      Text            =   "0.00"
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   155
      Underline       =   False
      Visible         =   True
      Width           =   176
      _mPanelIndex    =   -1
   End
   Begin WebLabel Acc_Plan_Points_Value_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   478
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
      TabIndex        =   9
      TabStop         =   True
      Text            =   "0.00"
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebLabel Acc_Task_Points_Value_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   478
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
      TabIndex        =   10
      TabStop         =   True
      Text            =   "0.00"
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   53
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebLabel Cur_Plan_Points_Value_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   478
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
      TabIndex        =   11
      TabStop         =   True
      Text            =   "0.00"
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   86
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebLabel Cur_Task_Points_Value_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   478
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
      TabIndex        =   12
      TabStop         =   True
      Text            =   "0.00"
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   119
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebImageViewer Preferences_ImageViewer
      ControlID       =   ""
      DisplayMode     =   3
      Enabled         =   True
      Height          =   45
      Image           =   1486747647
      Index           =   -2147483648
      Indicator       =   0
      Left            =   273
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      SVGData         =   ""
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      URL             =   ""
      Visible         =   True
      Width           =   45
      _mPanelIndex    =   -1
      _ProtectImage   =   False
   End
   Begin WebLabel Assigned_Tasks_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
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
      TabIndex        =   14
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   99
      Underline       =   False
      Visible         =   True
      Width           =   289
      _mPanelIndex    =   -1
   End
   Begin WebTimer Assigned_Tasks_Timer
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   0
      LockedInPosition=   False
      PanelIndex      =   0
      Period          =   1000
      RunMode         =   0
      Scope           =   2
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  Self.Style.BackgroundColor = Design_Palette.COLOR_Background
		  Self.Style.BorderColor = Design_Palette.COLOR_Border
		  Self.Style.BorderThickness = 2
		  Self.Style.Value("border-radius") = "15px;"
		  
		  Self.User_Label.Text = _
		  Session.Logged_in_User.full_name
		  Self.Group_Label.Text = _
		  Session.Logged_in_User.Group.name.Uppercase.Trim
		  
		  Self.Logout_Button.Indicator = _
		  WebUIControl.Indicators.Success
		  
		  
		  POPULATE_Points
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ENABLE_Login_Button()
		  'If User_TextField.Text <> "" And Password_TextField.Text <> "" Then
		  '
		  'Login_Button.Indicator = WebUIControl.Indicators.Primary
		  'Login_Button.Enabled = True
		  '
		  'Else
		  '
		  'Login_Button.Indicator = WebUIControl.Indicators.Light
		  'Login_Button.Enabled = False
		  '
		  '
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub POPULATE_Assigned_Tasks()
		  Var sql As String = "SELECT COUNT(*) as c " _
		  + "FROM scheduled_tasks " _
		  + "WHERE user_id = " + Session.Logged_in_User.id.ToString + " " _
		  + "AND is_completed = FALSE;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  Select Case rs.Column("c").IntegerValue
		  Case 0
		    
		    Assigned_Tasks_Label.Text = ""
		    
		  Else
		    
		    Assigned_Tasks_Label.Visible = True
		    Assigned_Tasks_Label.Text = "Assigned tasks = " _
		    + rs.Column("c").IntegerValue.ToString
		    
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub POPULATE_Points()
		  If Session.Logged_in_User.Group.id = 2 Or Session.Logged_in_User.Group.id = 3 Then
		    
		    Var today_sum As Double = 0
		    Var yesterday_sum As Double = 0
		    
		    Var today As Double = 0.1 * (Session.Logged_in_User.GET_Accumulated_Task_Points( DateTime.Now) _
		    + Session.Logged_in_User.GET_Accumulated_Assigned_Task_Points( DateTime.Now))
		    
		    Var yesterday As Double = 0.1 * ( _
		    Session.Logged_in_User.GET_Accumulated_Task_Points( DateTime.Now.SubtractInterval(0,0,1)) + _
		    Session.Logged_in_User.GET_Accumulated_Assigned_Task_Points( DateTime.Now.SubtractInterval(0,0,1)) _
		    ) 
		    
		    Acc_Task_Points_Value_Label.Text = Format( today, "#0.0") + " (" + Format( today-yesterday, "+#0.0") + ")"
		    today_sum = today_sum + today
		    yesterday_sum = yesterday_sum + yesterday
		    
		    today = Session.Logged_in_User.GET_Accumulated_Plan_Points( DateTime.Now) * 0.1
		    yesterday = Session.Logged_in_User.GET_Accumulated_Plan_Points( DateTime.Now.SubtractInterval(0,0,1)) * 0.1
		    Acc_Plan_Points_Value_Label.Text = Format( today, "#0.0") + " (" + Format( today-yesterday, "+#0.0") + ")"
		    today_sum = today_sum + today
		    yesterday_sum = yesterday_sum + yesterday
		    
		    today = 0.9 * (Session.Logged_in_User.GET_Recent_Tasks_Points( DateTime.Now) + _
		    Session.Logged_in_User.GET_Recent_Assigned_Tasks_Points( DateTime.Now) )
		    yesterday = 0.9 * (Session.Logged_in_User.GET_Recent_Tasks_Points( DateTime.Now.SubtractInterval(0,0,1)) + _
		    Session.Logged_in_User.GET_Recent_Assigned_Tasks_Points( DateTime.Now.SubtractInterval(0,0,1)))
		    
		    Cur_Task_Points_Value_Label.Text = Format( today, "#0.0") + " (" + Format( today-yesterday, "+#0.0") + ")"
		    today_sum = today_sum + today
		    yesterday_sum = yesterday_sum + yesterday
		    
		    today = Session.Logged_in_User.GET_Recent_Plan_Points( DateTime.Now) * 0.9
		    yesterday = Session.Logged_in_User.GET_Recent_Plan_Points( DateTime.Now.SubtractInterval(0,0,1)) * 0.9
		    Cur_Plan_Points_Value_Label.Text = Format( today, "#0.0") + " (" + Format( today-yesterday, "+#0.0") + ")"
		    today_sum = today_sum + today
		    yesterday_sum = yesterday_sum + yesterday
		    
		    Points_Value_Label.Text = Format( today_sum, "#0.0") + " (" + Format( today_sum - yesterday_sum, "+#0.0") + ")"
		    
		    
		  Else
		    
		    Acc_Task_Points_Label.Visible = False
		    Acc_Task_Points_Value_Label.Visible = False
		    
		    Acc_Plan_Points_Label.Visible = False
		    Acc_Plan_Points_Value_Label.Visible = False
		    
		    Cur_Task_Points_Label.Visible = False
		    Cur_Task_Points_Value_Label.Visible = False
		    
		    Cur_Plan_Points_Label.Visible = False
		    Cur_Plan_Points_Value_Label.Visible = False
		    
		    Points_Label.Visible = False
		    Points_Value_Label.Visible = False
		    
		    
		  End If
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Logout_Button
	#tag Event
		Sub Pressed()
		  Session.LOGIN_User(-1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_BUTTON_Unpressed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events User_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		  Me.Style.FontSize = 14
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Group_Label
	#tag Event
		Sub Shown()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Foreground 
		  Me.Style.Value("font-style") = "oblique 45deg;" 
		  Me.Style.FontSize = 12
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Points_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Points_Timer
	#tag Event
		Sub Run()
		  If Session.Logged_in_User <> Nil Then
		    
		    POPULATE_Points
		    POPULATE_Assigned_Tasks
		    
		  Else
		    
		    Points_Label.Visible = False
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Acc_Plan_Points_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Acc_Task_Points_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Cur_Plan_Points_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Cur_Task_Points_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Points_Value_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Acc_Plan_Points_Value_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Acc_Task_Points_Value_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Cur_Plan_Points_Value_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Cur_Task_Points_Value_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Preferences_ImageViewer
	#tag Event
		Sub Opening()
		  
		  
		  Var p As Picture = New Picture( Me.Width, Me.Height)
		  p.Graphics.DrawPicture( Me.Picture, _
		  0, 0, p.Width, p.Height, _
		  0, 0, Me.Picture.Width, Me.Picture.Height)
		  
		  Me.Picture = p // Automatically converts Picture to WebPicture
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(x As Integer, y As Integer)
		  Var dialog As New WebDialog_User_Edit
		  dialog.Show
		  dialog.user_id = Session.Logged_in_User.id
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Assigned_Tasks_Label
	#tag Event
		Sub Opening()
		  Me.TextColor = Color.Yellow
		  me.FontSize = 20
		  POPULATE_Assigned_Tasks
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Assigned_Tasks_Timer
	#tag Event
		Sub Run()
		  Assigned_Tasks_Label.Visible = Not Assigned_Tasks_Label.Visible
		  
		  
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
