#tag WebContainerControl
Begin WebContainer WebContainer_Calendar_Date
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   120
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
   Width           =   180
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel Month_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   30
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   137
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Jun"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   35
      _mPanelIndex    =   -1
   End
   Begin WebLabel Date_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   30
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   106
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
      Text            =   "23"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   30
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  Me.Style.BorderColor = Design_Palette.COLOR_On_Background
		  Me.Style.BorderThickness = 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DRAW_Date()
		  
		  
		  
		  If is_Calender_Month Then
		    
		    Date_Label.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		    Month_Label.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		    Self.Style.BackgroundColor = Design_Palette.COLOR_Surface_Primary
		    
		  Else
		    
		    Date_Label.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		    Month_Label.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		    
		    Date_Label.Style.ForegroundColor = &c969696
		    Month_Label.Style.ForegroundColor = &c969696
		    Self.Style.BackgroundColor = Design_Palette.COLOR_Background
		    
		    
		  End If
		  
		  Select Case mmy_date.DayOfWeek
		  Case 6, 7
		    
		    Self.Style.BackgroundColor = Design_Palette.COLOR_Surface_Secondary
		    
		  Else
		    
		    
		  End Select
		  
		  Date_Label.Text = mmy_date.Day.ToString
		  Date_Label.Top =  0
		  Date_Label.Left = 180 - 5 - Date_Label.Width
		  Month_Label.Visible = False
		  
		  If mmy_date.Day = 1 Then
		    
		    Month_Label.Text = Date_Module.Get_Month_Abbr( mmy_date.Month)
		    Month_Label.Visible = True
		    
		    Date_Label.Left = Month_Label.Left - Date_Label.Width - 5
		    
		  End If
		  
		  Date_Label.Style.BackgroundColor = Self.Style.BackgroundColor
		  Date_Label.Style.Value( "border") = "none;"
		  Date_Label.Style.Value("border-radius") =  Date_Label.Width.ToString + "px;"
		  
		  
		  If mmy_date.day = DateTime.Now.Day AND _
		    mmy_date.Month = DateTime.Now.Month AND _
		    mmy_date.year = DateTime.Now.Year Then
		    Var c1 As String = "#" +Design_Palette.COLOR_Primary.ToString.Right(6)
		    Date_Label.Style.BackgroundColor = Design_Palette.COLOR_Primary
		    Date_Label.Style.ForegroundColor = Design_Palette.COLOR_On_Primary
		    Date_Label.Style.Value( "border") = "1px solid  " + c1 + ";"
		    Date_Label.Style.Value("border-radius") =  Date_Label.Width.ToString + "px;"
		    
		  End If
		  
		  DRAW_On_Call
		  DRAW_Plans
		  DRAW_Tasks
		  DRAW_Vacations
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DRAW_On_Call()
		  
		  
		  If OnCall_Status_WEBCONTAINER <> Nil Then OnCall_Status_WEBCONTAINER.Close
		  
		  
		  
		  Var sql As String = "SELECT user_id, users.initials as initials FROM physics_tasking.on_calls " _
		  + "INNER JOIN physics_tasking.users USING(user_id) " _
		  + "WHERE on_call_date = '" + mmy_date.SQLDate + "';"
		  Var rs As Rowset = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  If rs.RowCount = 0 Then Return
		  
		  
		  status_left_position = 5
		  status_top_position = 5
		  
		  OnCall_Status_WEBCONTAINER = New WEBCONTAINER_OnCall_Status
		  
		  OnCall_Status_WEBCONTAINER.EmbedWithin( Self, _
		  status_left_position, status_top_position, _
		  OnCall_Status_WEBCONTAINER.Width, _
		  OnCall_Status_WEBCONTAINER.Height)
		  
		  OnCall_Status_WEBCONTAINER.user_id = _
		  rs.Column("user_id").IntegerValue
		  
		  OnCall_Status_WEBCONTAINER.date = _
		  mmy_date
		  
		  
		  
		  OnCall_Status_WEBCONTAINER.Initials_Label.Text = _
		  rs.Column("initials").StringValue.Trim.Uppercase
		  
		  OnCall_Status_WEBCONTAINER.Initials_Label.Style.ForegroundColor = Design_Palette.COLOR_Secondary
		  Var c_group As New ColorGroup( Design_Palette.COLOR_Secondary)
		  
		  OnCall_Status_WEBCONTAINER.Initials_Label.Style.BorderColor = c_group
		  OnCall_Status_WEBCONTAINER.Initials_Label.Style.BorderThickness = 1
		  OnCall_Status_WEBCONTAINER.Initials_Label.Style.FontSize = 12
		  OnCall_Status_WEBCONTAINER.Initials_Label.Style.Value("border-radius") =  "50px 50px;"
		  Var c1 As String = "#" +Design_Palette.COLOR_Secondary.ToString.Right(6)
		  Var c2 As String = "#" +Design_Palette.COLOR_On_Secondary.ToString.Right(6)
		  
		  
		  
		  status_top_position = status_top_position + OnCall_Status_WEBCONTAINER.Height + 5
		  
		  
		  'OnCall_Status_WEBCONTAINER.Initials_Label.Style.Value("text-align") = "center;"
		  'OnCall_Status_WEBCONTAINER.Initials_Label.Style.Value("font-size") = "12px;"
		  'OnCall_Status_WEBCONTAINER.Initials_Label.Style.Value("color") = c2
		  'OnCall_Status_WEBCONTAINER.Initials_Label.Style.Value("text-shadow") =  "2px 2px 4px #000000;"
		  '
		  'OnCall_Status_WEBCONTAINER.Initials_Label.Style.Value("text-align") = "center;"
		  'OnCall_Status_WEBCONTAINER.Initials_Label.Style.Value("font-size") = "10px;"
		  'OnCall_Status_WEBCONTAINER.Initials_Label.Style.Value("color") = c1
		  ''OnCall_Status_WEBCONTAINER.Initials_Label.Style.Value("text-shadow") =  "2px 2px 4px #000000;"
		  '
		  '
		  ''OnCall_Status_WEBCONTAINER.Style.Value("border-color") = c1
		  ''OnCall_Status_WEBCONTAINER.Style.Value("border-width") = "1px"
		  ''OnCall_Status_WEBCONTAINER.Style.Value("border-style") = "solid"
		  'OnCall_Status_WEBCONTAINER.Style.Value("border") =  "2px solid " + c1 
		  '
		  'OnCall_Status_WEBCONTAINER.Style.Value("border-radius") =  "50px 50px;"
		  
		  '
		  'OnCall_Status_WEBCONTAINER.Style.Value("background") = c1
		  'OnCall_Status_WEBCONTAINER.Style.Value("box-shadow") =  "1px 1px 1px white"
		  '
		  'OnCall_Status_WEBCONTAINER.Style.Value("border-radius") =  "50px 50px;"
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DRAW_Plans()
		  For i As Integer = Plan_Status_WEBCONTAINER.LastIndex To 0 Step -1
		    
		    Plan_Status_WEBCONTAINER(i).Close
		    
		  Next
		  
		  Var sql As String = "SELECT user_id, initials, COUNT(*) as total, SUM(is_completed) as completed, is_active " _
		  + "FROM plans " _
		  + "INNER JOIN users USING(user_id) " _
		  + "WHERE DATE(due_date) = '"+ mmy_date.SQLDate + "' " _
		  + "GROUP BY user_id"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then Return
		  
		  
		  
		  Plan_Status_WEBCONTAINER.ResizeTo(-1)
		  
		  status_left_position = 5
		  status_top_position = Date_Label.Height + 5
		  
		  While Not rs.AfterLastRow
		    
		    Plan_Status_WEBCONTAINER.Add (New WEBCONTAINER_Plan_Status)
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).EmbedWithin( Self, _
		    status_left_position, status_top_position, _
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Width, _
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Height)
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).user_id = _
		    rs.Column("user_id").IntegerValue
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).date = _
		    mmy_date
		    
		    status_left_position = status_left_position + _
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Width + 5
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Text = _
		    rs.Column("initials").StringValue.Trim.Uppercase
		    
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-align") = "center;"
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("font-size") = "12px;"
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("color") = "white"
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-shadow") =  "2px 2px 4px #000000;"
		    
		    If status_left_position > 0 + Self.width - 10 - Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Width Then
		      
		      status_left_position = 5
		      status_top_position = status_top_position + Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Height + 5
		      
		    End If
		    
		    Var c1 As String = "#" +Design_Palette.COLOR_Pass.ToString.Right(6)
		    Var c2 As String = "#" +Design_Palette.COLOR_Error.ToString.Right(6)
		    Var c3 As String = "#" +Design_Palette.COLOR_Warning.ToString.Right(6)
		    
		    
		    
		    If rs.Column("is_active").BooleanValue Then
		      Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Style.Value("background") = _
		      "linear-gradient(to right, " + c1 + " 0%, " _
		      + c1 + " " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		      + c2 + " " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		      + c2 + " 100%);"
		      
		      
		    Else
		      
		      Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Style.Value("background") = _
		      "linear-gradient(to right, " + c1 + " 0%, " _
		      + c1 +"  " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		      + c3 +"  "  + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		      + c3 + " 100%);"
		      
		      
		    End If
		    
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Style.Value("box-shadow") =  "1px 1px 1px lightblue;"
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  status_left_position = 5
		  
		  If Plan_Status_WEBCONTAINER.LastIndex > -1 Then
		    
		    status_top_position = status_top_position + Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Height + 5
		    
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DRAW_Tasks()
		  status_left_position = 7
		  For i As Integer = Task_Status_WEBCONTAINER.LastIndex To 0 Step -1
		    
		    Task_Status_WEBCONTAINER(i).Close
		    
		  Next
		  
		  Task_Status_WEBCONTAINER.ResizeTo(-1)
		  
		  Var sql as String = "SELECT user_id, initials, COUNT(*) as total, SUM(is_completed) as completed " _
		  + "FROM scheduled_tasks " _
		  + "INNER JOIN users USING(user_id) " _
		  + "WHERE DATE(due_date) = '"+ mmy_date.SQLDate + "' " _
		  + "GROUP BY user_id;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Task_Status_WEBCONTAINER.Add (New WEBCONTAINER_Task_Status)
		    
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).EmbedWithin( Self, _
		    status_left_position, status_top_position, _
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Width, _
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Height)
		    
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).user_id = _
		    rs.Column("user_id").IntegerValue
		    
		    
		    
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).date = _
		    mmy_date
		    
		    status_left_position = status_left_position + _
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Width + 7
		    
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Text = _
		    rs.Column("initials").StringValue.Trim.Uppercase
		    
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-align") = "center;"
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("font-size") = "12px;"
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("color") = "white"
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-shadow") =  "2px 2px 4px #000000;"
		    
		    
		    If status_left_position > Self.width - 10 - Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Width Then
		      
		      status_left_position = 7
		      status_top_position = status_top_position + Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Height + 5
		      
		    End If
		    
		    Var c1 As String = "#" +Design_Palette.COLOR_Pass.ToString.Right(6)
		    Var c2 As String = "#" +Design_Palette.COLOR_Error.ToString.Right(6)
		    Var c3 As String = "#" +Design_Palette.COLOR_Warning.ToString.Right(6)
		    
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("background") = _
		    "linear-gradient(to right, " + c1 + " 0%, " _
		    + c1 + " " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    + c2 + " " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    + c2 + " 0 100%);"
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("box-shadow") =  "1px 1px 1px lightblue;"
		    
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("border-radius") =  "50px 50px;"
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  status_left_position = 5
		  
		  If Plan_Status_WEBCONTAINER.LastIndex > -1 Then
		    
		    status_top_position = status_top_position + Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Height + 5
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DRAW_Vacations()
		  
		  
		  For i As Integer = Vacation_Status_WEBCONTAINER.LastIndex To 0 Step -1
		    
		    Vacation_Status_WEBCONTAINER(i).Close
		    Vacation_Status_WEBCONTAINER(i).UpdateBrowser
		    
		  Next
		  
		  Var sql As String = "SELECT user_id, initials " _
		  + "FROM physics_tasking.vacations " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "WHERE start_date <= '" + mmy_date.SQLDate + "' " _
		  + "AND end_date >= '" + mmy_date.SQLDate + "';"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then Return
		  
		  Vacation_Status_WEBCONTAINER.ResizeTo(-1)
		  
		  status_left_position = Self.Width  - 35
		  status_top_position = Self.Height - 30
		  
		  
		  
		  While Not rs.AfterLastRow
		    
		    Vacation_Status_WEBCONTAINER.Add (New WEBCONTAINER_Vacation_Status)
		    
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).EmbedWithin( Self, _
		    status_left_position, status_top_position, _
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).Width, _
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).Height)
		    
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).user_id = _
		    rs.Column("user_id").IntegerValue
		    
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).date = _
		    mmy_date
		    
		    
		    
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Text = _
		    rs.Column("initials").StringValue.Trim.Uppercase
		    
		    Var c_group As New ColorGroup( Design_Palette.COLOR_Warning)
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.ForegroundColor = Design_Palette.COLOR_Warning
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.BorderColor = c_group
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.BorderThickness = 1
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.FontSize = 12
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("border-radius") =  "50px 50px;"
		    Var c1 As String = "#" +Design_Palette.COLOR_Secondary.ToString.Right(6)
		    Var c2 As String = "#" +Design_Palette.COLOR_On_Secondary.ToString.Right(6)
		    
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-align") = "center;"
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("font-size") = "12px;"
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("color") = "white" //"#212121" //"white"
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-shadow") =  "2px 2px 4px #000000;"
		    '
		    '
		    '
		    '
		    'Var c1 As String = "#" +Design_Palette.COLOR_Primary_Variant.ToString.Right(6)
		    'Var c2 As String = "#" +Design_Palette.COLOR_Error.ToString.Right(6)
		    'Var c3 As String = "#" +Design_Palette.COLOR_Warning.ToString.Right(6)
		    '
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Style.Value("background") = c1
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Style.Value("box-shadow") =  "1px 1px 1px white"
		    '
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Style.Value("border-radius") =  "50px 50px;"
		    
		    status_left_position = status_left_position - _
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).Width - 5
		    
		    rs.MoveToNextRow
		    
		  Wend 
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Calendar_month As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		is_Calender_Month As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mmy_date As DateTime
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mmy_date
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mmy_date = value
			  DRAW_Date
			  
			  
			End Set
		#tag EndSetter
		my_date As DateTime
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private OnCall_Status_WEBCONTAINER As WEBCONTAINER_OnCall_Status
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Plan_Status_WEBCONTAINER() As WEBCONTAINER_Plan_Status
	#tag EndProperty

	#tag Property, Flags = &h21
		Private status_left_position As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private status_top_position As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Task_Status_WEBCONTAINER() As WEBCONTAINER_Task_Status
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Vacation_Status_WEBCONTAINER() As WEBCONTAINER_Vacation_Status
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
	#tag ViewProperty
		Name="is_Calender_Month"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
