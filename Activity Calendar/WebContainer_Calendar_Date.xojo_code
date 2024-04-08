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
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  DRAW(d_Calendar_date, Calendar_month)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DRAW(d as DateTime, m as DateTime)
		  d_Calendar_date = d
		  Calendar_month = m
		  
		  Date_Label.Text = d_Calendar_date.Day.ToString
		  UPDATE_Theme
		  'Var top_position As Integer = SUN_Label.Top + SUN_Label.Height + self  + 10
		  
		  'Var t1 As Integer = Self.Parent.Parent.top
		  'Var l1 As Integer = Self.Parent.Parent.Left
		  'Month_Label.Left = Left + Self.Left + Self.Width - Month_Label.Width - 5
		  'Month_Label.Top = Self.Top
		  Date_Label.Top =  0
		  Date_Label.Left = 180 - 5 - Date_Label.Width
		  Month_Label.Visible = False
		  
		  If d_Calendar_date.Day = 1 Then
		    
		    Month_Label.Text = Date_Module.Get_Month_Abbr( d_Calendar_date.Month)
		    'Month_Label.Left = Self.Left + Self.Width - Month_Label.Width - 5
		    'Month_Label.Top = Self.Top
		    Month_Label.Visible = True
		    
		    'Date_Label.Top = Month_Label.Top
		    Date_Label.Left = Month_Label.Left - Date_Label.Width - 5
		    
		  End If
		  
		  
		  Var sql As String = "SELECT user_id, initials, COUNT(*) as total, SUM(is_completed) as completed, is_active " _
		  + "FROM plans " _
		  + "INNER JOIN users USING(user_id) " _
		  + "WHERE DATE(due_date) = '"+ d_Calendar_date.SQLDate + "' " _
		  + "GROUP BY user_id"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		  
		  For i As Integer = Plan_Status_WEBCONTAINER.LastIndex To 0 Step -1
		    
		    Plan_Status_WEBCONTAINER(i).Close
		    
		  Next
		  
		  Plan_Status_WEBCONTAINER.ResizeTo(-1)
		  
		  Var status_left_position As Integer = Self.Left + 5
		  Var status_top_position As Integer = Self.Top + Date_Label.Height + 5
		  
		  While Not rs.AfterLastRow
		    
		    Plan_Status_WEBCONTAINER.Add (New WEBCONTAINER_Plan_Status)
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).EmbedWithin( Self, _
		    status_left_position, status_top_position, _
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Width, _
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Height)
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).user_id = _
		    rs.Column("user_id").IntegerValue
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).date = _
		    d_Calendar_date
		    
		    status_left_position = status_left_position + _
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Width + 5
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Text = _
		    rs.Column("initials").StringValue.Trim.Uppercase
		    
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-align") = "center;"
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("font-size") = "12px;"
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("color") = "white"
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-shadow") =  "2px 2px 4px #000000;"
		    
		    If status_left_position > Self.Left + Self.width - 10 - Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Width Then
		      
		      status_left_position = Self.Left + 5
		      status_top_position = status_top_position + Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Height + 5
		      
		    End If
		    
		    If rs.Column("is_active").BooleanValue Then
		      Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Style.Value("background") = _
		      "linear-gradient(to right, #009051 0%, " _
		      +"#009051 " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		      +"#941100 " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		      + "#941100 100%);"
		    Else
		      
		      Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Style.Value("background") = _
		      "linear-gradient(to right, #009051 0%, " _
		      +"#009051 " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		      +"#f4c430 " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		      + "#f4c430 100%);"
		      
		      '#f0e130
		      '#f4c430 
		    End If
		    
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Style.Value("box-shadow") =  "1px 1px 1px lightblue;"
		    'If rs.Column("name").StringValue.Lowercase.IndexOf("brachy") > -1 Then
		    '
		    'Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Style.Value("border-radius") = "10px;"
		    '
		    'End If
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  status_left_position = Self.Left + 5
		  If Plan_Status_WEBCONTAINER.LastIndex > -1 Then
		    
		    status_top_position = status_top_position + Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Height + 5
		    
		  End If
		  
		  For i As Integer = Task_Status_WEBCONTAINER.LastIndex To 0 Step -1
		    
		    Task_Status_WEBCONTAINER(i).Close
		    
		  Next
		  
		  Task_Status_WEBCONTAINER.ResizeTo(-1)
		  
		  
		  
		  sql = "SELECT user_id, initials, COUNT(*) as total, SUM(is_completed) as completed " _
		  + "FROM scheduled_tasks " _
		  + "INNER JOIN users USING(user_id) " _
		  + "WHERE DATE(due_date) = '"+ d_Calendar_date.SQLDate + "' " _
		  + "GROUP BY user_id;"
		  
		  rs = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Task_Status_WEBCONTAINER.Add (New WEBCONTAINER_Task_Status)
		    
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).EmbedWithin( Self, _
		    status_left_position, status_top_position, _
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Width, _
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Height)
		    
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).user_id = _
		    rs.Column("user_id").IntegerValue
		    
		    
		    
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).date = _
		    d_Calendar_date
		    
		    status_left_position = Self.Left + status_left_position + _
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Width + 7
		    
		    Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Text = _
		    rs.Column("initials").StringValue.Trim.Uppercase
		    
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-align") = "center;"
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("font-size") = "12px;"
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("color") = "white"
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-shadow") =  "2px 2px 4px #000000;"
		    
		    
		    If status_left_position > Self.Left + Self.width - 10 - Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Width Then
		      
		      status_left_position = Self.Left + 7
		      status_top_position = Self.Top + status_top_position + Task_Status_WEBCONTAINER( Task_Status_WEBCONTAINER.LastIndex).Height + 5
		      
		    End If
		    
		    
		    'Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Style.Value("background") = _
		    '"linear-gradient(to right, #002E0B 0%, " _
		    '+ "#FFFFFF " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    '+ "#FFFFFF " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    '+ "#4A1300 100%);"
		    
		    
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("background") = _
		    "linear-gradient(to right, #009051 0%, " _
		    +"#009051 " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    +"#941100 " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    + "#941100 100%);"
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("box-shadow") =  "1px 1px 1px lightblue;"
		    
		    Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("border-radius") =  "50px 50px;"
		    'Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("border") =  "1px solid #AAAAAA;"
		    
		    'Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Style.Value("transform") = "rotate(45deg);"
		    'Task_Status_WEBCONTAINER(Task_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("transform") = "rotate(-45deg);"
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  UPDATE_Theme
		  
		  'Label1.Text = Date_Label.Left.ToString + ", " + Date_Label.top.ToString
		  'Label2.Text = Self.Left.ToString + ", " + Self.Top.ToString
		  If d.day <> DateTime.Now.Day Then Return
		  If d.Month <> DateTime.Now.Month Then Return
		  If d.Year <> DateTime.Now.Year Then Return
		  
		  
		  Date_Label.Style.BackgroundColor = &cFF3B3B
		  Date_Label.Style.ForegroundColor = Color.Black
		  Date_Label.Style.Value( "border") = "1px solid #FF3B3B;"
		  Date_Label.Style.Value("border-radius") =  Date_Label.Width.ToString + "px;"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UPDATE_Theme()
		  If d_Calendar_date.DayOfWeek > 5 Then
		    
		    Me.Style.BackgroundColor = &c363636
		  Else
		    
		    Me.Style.BackgroundColor = &c242424
		    
		  End If
		  
		  Date_Label.Style = New WebStyle
		  Month_Label.Style = New WebStyle
		  If d_Calendar_date.Month <> Calendar_month.Month Or d_Calendar_date.Year <> Calendar_month.Year Then
		    
		    Date_Label.Style.Value("color") = "#FFFFFF,"
		    Month_Label.Style.Value("color") = "#C9C9C9,"
		    Month_Label.Italic = True
		    Date_Label.Italic = True
		    
		  Else
		    
		    Date_Label.Style.Value("color") = "#EDEDED;"
		    Month_Label.Style.Value("color") = "#EDEDED;"
		    
		  End If
		  
		  Me.Style.Value("border-style") =  "ridge;"
		  Me.Style.Value("border-width") =  "1px;"
		  Me.Style.Value("border-color") = "#525252;"
		  'Me.Style.Value("border-color") =  Theme_Colors.Material_BaseLine.Secondary.Value("background-color").Replace(";", "")
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Calendar_month As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private d_Calendar_date As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Plan_Status_WEBCONTAINER() As WEBCONTAINER_Plan_Status
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Task_Status_WEBCONTAINER() As WEBCONTAINER_Task_Status
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
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
