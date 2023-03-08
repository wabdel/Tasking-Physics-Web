#tag WebContainerControl
Begin WebContainer WebContainer_Calender_Date
   Compatibility   =   ""
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
		  DRAW(d_calender_date, calender_month)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DRAW(d as DateTime, m as DateTime)
		  d_calender_date = d
		  calender_month = m
		  
		  Date_Label.Text = d_calender_date.Day.ToString
		  UPDATE_Theme
		  'Var top_position As Integer = SUN_Label.Top + SUN_Label.Height + self  + 10
		  
		  Var t1 As Integer = Self.Parent.Parent.top
		  Var l1 As Integer = Self.Parent.Parent.Left
		  'Month_Label.Left = Left + Self.Left + Self.Width - Month_Label.Width - 5
		  'Month_Label.Top = Self.Top
		  Date_Label.Top = 0
		  Date_Label.Left = 180 - 5 - Date_Label.Width
		  Month_Label.Visible = False
		  
		  If d_calender_date.Day = 1 Then
		    
		    Month_Label.Text = Date_Module.Get_Month_Abbr( d_calender_date.Month)
		    'Month_Label.Left = Self.Left + Self.Width - Month_Label.Width - 5
		    'Month_Label.Top = Self.Top
		    Month_Label.Visible = True
		    
		    'Date_Label.Top = Month_Label.Top
		    Date_Label.Left = Month_Label.Left - Date_Label.Width - 5
		    
		  End If
		  
		  
		  Var sql As String = "SELECT user_id, initials, COUNT(*) as total, SUM(is_completed) as completed " _
		  + "FROM plans " _
		  + "INNER JOIN users USING(user_id) " _
		  + "WHERE DATE(due_date) = '"+ d_calender_date.SQLDate + "' " _
		  + "GROUP BY user_id"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		  
		  For i As Integer = Plan_Status_WEBCONTAINER.LastIndex To 0 Step -1
		    
		    Plan_Status_WEBCONTAINER(i).Close
		    
		  Next
		  
		  Plan_Status_WEBCONTAINER.ResizeTo(-1)
		  
		  Var status_left_position As Integer = 5
		  Var status_top_position As Integer = Date_Label.Height + 5
		  
		  While Not rs.AfterLastRow
		    
		    Plan_Status_WEBCONTAINER.Add (New WEBCONTAINER_Plan_Status)
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).EmbedWithin( Self, _
		    status_left_position, status_top_position, _
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Width, _
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Height)
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).user_id = _
		    rs.Column("user_id").IntegerValue
		    
		    status_left_position = status_left_position + _
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Width + 5
		    
		    Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Text = _
		    rs.Column("initials").StringValue.Trim.Uppercase
		    
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-align") = "center;"
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("font-size") = "12px;"
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("color") = "white"
		    
		    If status_left_position > Self.width - 10 - Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Width Then
		      
		      status_left_position = 5
		      status_top_position = status_top_position + Plan_Status_WEBCONTAINER( Plan_Status_WEBCONTAINER.LastIndex).Height + 5
		      
		    End If
		    
		    Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("background") = _
		     "linear-gradient(to right, #009051 0%, " _
		    +"#009051 " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    +"#941100 " + Format(rs.Column("completed").IntegerValue / rs.Column("total").IntegerValue, "00%") + ", " _
		    + "#941100 100%);"
		     
		    'If rs.Column("name").StringValue.Lowercase.IndexOf("brachy") > -1 Then
		    '
		    'Plan_Status_WEBCONTAINER(Plan_Status_WEBCONTAINER.LastIndex).Style.Value("border-radius") = "10px;"
		    '
		    'End If
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  
		  
		  
		  
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
		  If d_calender_date.DayOfWeek > 5 Then
		    
		    Me.Style.BackgroundColor = &cD6D6D600
		  Else
		    
		    Me.Style.BackgroundColor = Color.White
		    
		  End If
		  
		  
		  
		  Date_Label.Style = New WebStyle
		  Month_Label.Style = New WebStyle
		  If d_calender_date.Month <> calender_month.Month Or d_calender_date.Year <> calender_month.Year Then
		    
		    Date_Label.Style.Value("color") = "#909090;"
		    Month_Label.Style.Value("color") = "#909090;"
		    Month_Label.Italic = True
		    Date_Label.Italic = True
		    
		  Else
		    
		    Date_Label.Style.Value("color") = "#121212;"
		    Month_Label.Style.Value("color") = "#121212;"
		    
		  End If
		  
		  Me.Style.Value("border-style") =  "ridge;"
		  Me.Style.Value("border-width") =  "1px;"
		  Me.Style.Value("border-color") = "#525252;"
		  'Me.Style.Value("border-color") =  Theme_Colors.Material_BaseLine.Secondary.Value("background-color").Replace(";", "")
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private calender_month As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private d_calender_date As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Plan_Status_WEBCONTAINER() As WEBCONTAINER_Plan_Status
	#tag EndProperty


#tag EndWindowCode

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
