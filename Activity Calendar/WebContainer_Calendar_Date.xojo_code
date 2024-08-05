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
   Begin WebTimer Timer_Update
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
   Begin WebLabel Label_On_Call
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   12.0
      Height          =   25
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   2
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   2
      TabStop         =   True
      Text            =   "IAD"
      TextAlignment   =   2
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   2
      Underline       =   False
      Visible         =   True
      Width           =   25
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Date_Weekday
		  Me.Style.BorderColor = Design_Palette.COLOR_Central_Background
		  Me.Style.BorderThickness = 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DRAW_Date()
		  
		  
		  
		  If is_Calinder_Month Then 
		    Date_Label.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		    Month_Label.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		    Self.Style.BackgroundColor = Design_Palette.COLOR_Background
		  Else
		    
		    Date_Label.Style.ForegroundColor = &c5E5E5E00
		    Month_Label.Style.ForegroundColor = &c3E424B
		    Self.Style.BackgroundColor = Design_Palette.COLOR_Background
		    
		    
		  End If
		  
		  Select Case mmy_date.DayOfWeek
		  Case 6, 7
		    
		    Self.Style.BackgroundColor =&c3E424B
		    
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
		    
		    Date_Label.Style.BackgroundColor = Design_Palette.COLOR_Error
		    Date_Label.Style.ForegroundColor = Color.Black
		    Date_Label.Style.Value( "border") = "1px solid #FF3B3B;"
		    Date_Label.Style.Value("border-radius") =  Date_Label.Width.ToString + "px;"
		    
		  End If
		  
		  DRAW_On_Call
		  DRAW_Plans
		  DRAW_Tasks
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DRAW_On_Call()
		  
		  
		  Var sql As String = "SELECT user_id, users.initials as initials FROM physics_tasking.on_calls " _
		  + "INNER JOIN physics_tasking.users USING(user_id) " _
		  + "WHERE on_call_date = '" + mmy_date.SQLDate + "';"
		  Var rs As Rowset = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then
		    
		    Label_On_Call.Style.BorderColor = Self.Style.BackgroundColor
		    Label_On_Call.Style.BackgroundColor = Self.Style.BackgroundColor
		    
		    Label_On_Call.Text = ""
		    
		  Else
		    
		    Label_On_Call.Text = rs.Column("initials").StringValue.Trim.Uppercase
		    
		    Label_On_Call.Style.BorderColor = &c76D6FF00
		    Label_On_Call.Style.BorderThickness = 1
		    Label_On_Call.Style.ForegroundColor = &c76D6FF00
		    Label_On_Call.Style.BackgroundColor = Self.Style.BackgroundColor
		    
		    
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DRAW_Plans()
		  Var sql As String = "SELECT user_id, initials, COUNT(*) as total, SUM(is_completed) as completed, is_active " _
		  + "FROM plans " _
		  + "INNER JOIN users USING(user_id) " _
		  + "WHERE DATE(due_date) = '"+ mmy_date.SQLDate + "' " _
		  + "GROUP BY user_id"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  
		  For i As Integer = Plan_Status_WEBCONTAINER.LastIndex To 0 Step -1
		    
		    Plan_Status_WEBCONTAINER(i).Close
		    Plan_Status_WEBCONTAINER(i).UpdateBrowser
		    
		  Next
		  
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
		    
		    Var c1 As String
		    Var c2 As String
		    
		    
		    If Session.darkmode Then
		      
		      c1 = "#018786"
		      c2 = "#CF6679"
		      
		      
		      
		    Else
		      
		      c1 = "#018786"
		      c2 = "#B00020"
		    End If
		    
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
		      +"#f4c430 " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		      + "#f4c430 100%);"
		      
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

	#tag Method, Flags = &h0
		Sub DRAW_Tasks()
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
		    
		    Var c1 As String
		    Var c2 As String
		    
		    
		    If Session.darkmode Then
		      
		      c1 = "#018786"
		      c2 = "#CF6679"
		      
		      
		      
		    Else
		      
		      c1 = "#018786"
		      c2 = "#B00020"
		    End If
		    
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("background") = _
		    "linear-gradient(to right, " + c1 + " 0%, " _
		    + c1 + " " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    + c2 + " " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    + c2 + " 0 100%);"
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("box-shadow") =  "1px 1px 1px lightblue;"
		    
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("border-radius") =  "50px 50px;"
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Calendar_month As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		is_Calinder_Month As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LATEST_UPDATE As DateTime
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
			  Select Case mmy_date.DayOfWeek
			  Case 6,7
			    
			    
			    Self.Style.BackgroundColor = Design_Palette.COLOR_Date_Weekend
			    
			  Else
			    
			    Self.Style.BackgroundColor = Design_Palette.COLOR_Date_Weekday
			    
			  End Select
			  
			  
			End Set
		#tag EndSetter
		my_date As DateTime
	#tag EndComputedProperty

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


#tag EndWindowCode

#tag Events Timer_Update
	#tag Event
		Sub Run()
		  If LATEST_UPDATE <> app.last_database_update Then
		    
		    DRAW_On_Call
		    DRAW_Plans
		    DRAW_Tasks
		    LATEST_UPDATE = app.last_database_update
		    
		    
		  End If
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
	#tag ViewProperty
		Name="is_Calinder_Month"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
