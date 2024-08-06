#tag WebPage
Begin WebDialog WebDialog_User_Tasks
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   694
   Index           =   -2147483648
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   PanelIndex      =   0
   Position        =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   1124
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebButton WebButton_Close
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Close"
      ControlID       =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   497
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
      Top             =   636
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebListBox WebListBox_User_Tasks
      ColumnCount     =   0
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   526
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      PanelIndex      =   0
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   2
      SearchCriteria  =   ""
      SelectedRowColor=   &c0d6efd
      SelectedRowIndex=   0
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   102
      Visible         =   True
      Width           =   1084
      _mPanelIndex    =   -1
   End
   Begin WebLabel WebLabel_Name
      Bold            =   True
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
      TabIndex        =   2
      TabStop         =   True
      Text            =   "Name : "
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   340
      _mPanelIndex    =   -1
   End
   Begin WebLabel WebLabel_Task_Type_Name
      Bold            =   True
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
      TabIndex        =   3
      TabStop         =   True
      Text            =   "Task : "
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   56
      Underline       =   False
      Visible         =   True
      Width           =   1084
      _mPanelIndex    =   -1
   End
   Begin WebProgressWheel ProgressWheel1
      Colorize        =   True
      ControlID       =   ""
      Enabled         =   True
      Height          =   250
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   437
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      SVGColor        =   &cFFD47900
      SVGData         =   ""
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   272
      Visible         =   True
      Width           =   250
      _mPanelIndex    =   -1
   End
   Begin WebLabel WebLabel_Total_Points
      Bold            =   True
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   764
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
      Text            =   "Total Points = 0"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   56
      Underline       =   False
      Visible         =   True
      Width           =   340
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.ModalBackgroundColor = "#" +Design_Palette.COLOR_Background.ToString.Right(6)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub POPULATE()
		  Var sql As String = "SELECT first_name, family_name FROM physics_tasking.users " _
		  + "WHERE user_id = " + user_id.ToString + ";"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  If rs.RowCount = 1 Then
		    
		    WebLabel_Name.Text = "Name : " + rs.Column("first_name").StringValue.Trim.Titlecase _
		    + " " + rs.Column("family_name").StringValue.Trim.Uppercase
		    
		  End If
		  
		  sql = "SELECT name FROM physics_tasking.task_types " _
		  + "WHERE task_type_id = " + task_type_id.ToString + ";"
		  
		  rs = Physics_Tasking.SELECT_Statement(sql)
		  
		  If rs.RowCount = 1 Then
		    
		    WebLabel_Task_Type_Name.Text = "Task : " + rs.Column("name").StringValue.Trim
		    
		  End If
		  
		  WebListBox_User_Tasks.ColumnCount = 4
		  WebListBox_User_Tasks.HeaderAt(0) = "Date"
		  WebListBox_User_Tasks.HeaderAt(1) = "Count"
		  WebListBox_User_Tasks.HeaderAt(2) = "Points"
		  WebListBox_User_Tasks.HeaderAt(3) = "Comments"
		  
		  WebListBox_User_Tasks.RemoveAllRows
		  
		  Var d As DateTime = DateTime.Now.SubtractInterval(1,0.0)
		  
		  sql = "SELECT completion_date, multiplier as c, multiplier*weight as p, notes FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) "  _
		  + "WHERE user_id = " + user_id.ToString + " "  _
		  + "AND task_type_id = " + task_type_id.ToString + " "  _
		  + "AND DATE(physics_tasking.tasks.completion_date) >= '"  + d.SQLDate + "' " _
		  + "ORDER BY completion_date DESC;"
		  
		  rs = Physics_Tasking.SELECT_Statement(sql)
		  
		  Var sum As Double = 0.0
		  
		  While Not rs.AfterLastRow
		    
		    WebListBox_User_Tasks.AddRow()
		    WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 0) = _
		    rs.Column("completion_date").DateTimeValue.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None)
		    WebListBox_User_Tasks.CellTagAt( WebListBox_User_Tasks.LastAddedRowIndex, 0) = _
		    rs.Column("completion_date").DateTimeValue.SecondsFrom1970
		    
		    WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 1) = rs.Column("c").IntegerValue.ToString
		    WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 2) = Format( rs.Column("p").DoubleValue, "0.00")
		    WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 3) = rs.Column("notes").StringValue.Trim
		    
		    sum = sum + rs.Column("p").DoubleValue
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  
		  sql = "SELECT completion_date, multiplier as c, " _
		  + "(SELECT " _
		  + App.Points_Schedulted_Tasks_Condition + " * multiplier) AS p, " _
		  + "notes FROM physics_tasking.scheduled_tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) "  _
		  + "WHERE user_id = " + user_id.ToString + " "  _
		  + "AND task_type_id = " + task_type_id.ToString + " "  _
		  + "AND DATE(physics_tasking.scheduled_tasks.completion_date) >= '"  + d.SQLDate + "' " _
		  + "ORDER BY completion_date DESC;"
		  
		  rs = Physics_Tasking.SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    If WebListBox_User_Tasks.RowCount = 0 Then
		      WebListBox_User_Tasks.AddRow()
		      WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 0) = _
		      rs.Column("completion_date").DateTimeValue.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None)
		      WebListBox_User_Tasks.CellTagAt( WebListBox_User_Tasks.LastAddedRowIndex, 0) = _
		      rs.Column("completion_date").DateTimeValue.SecondsFrom1970
		      
		      WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 1) = rs.Column("c").IntegerValue.ToString
		      WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 2) = Format( rs.Column("p").DoubleValue, "0.00")
		      WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 3) = rs.Column("notes").StringValue.Trim
		      
		      sum = sum + rs.Column("p").DoubleValue
		      
		      
		      Continue While
		    End If
		    
		    
		    
		    Select Case rs.Column("completion_date").DateTimeValue.SecondsFrom1970
		    Case Is < WebListBox_User_Tasks.CellTagAt( WebListBox_User_Tasks.LastRowIndex, 0)
		      
		      
		      WebListBox_User_Tasks.AddRow()
		      WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 0) = _
		      rs.Column("completion_date").DateTimeValue.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None)
		      WebListBox_User_Tasks.CellTagAt( WebListBox_User_Tasks.LastAddedRowIndex, 0) = _
		      rs.Column("completion_date").DateTimeValue.SecondsFrom1970
		      
		      WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 1) = rs.Column("c").IntegerValue.ToString
		      WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 2) = Format( rs.Column("p").DoubleValue, "0.00")
		      WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 3) = rs.Column("notes").StringValue.Trim
		      
		      sum = sum + rs.Column("p").DoubleValue
		      
		      
		    Else
		      
		      
		      For row As Integer = 0 To WebListBox_User_Tasks.LastRowIndex
		        
		        If rs.Column("completion_date").DateTimeValue.SecondsFrom1970 > WebListBox_User_Tasks.CellTagAt( row, 0) Then
		          
		          WebListBox_User_Tasks.AddRowAt( row)
		          
		          WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 0) = _
		          rs.Column("completion_date").DateTimeValue.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None)
		          WebListBox_User_Tasks.CellTagAt( WebListBox_User_Tasks.LastAddedRowIndex, 0) = _
		          rs.Column("completion_date").DateTimeValue.SecondsFrom1970
		          
		          WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 1) = rs.Column("c").IntegerValue.ToString
		          WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 2) = Format( rs.Column("p").DoubleValue, "0.00")
		          WebListBox_User_Tasks.CellTextAt( WebListBox_User_Tasks.LastAddedRowIndex, 3) = rs.Column("notes").StringValue.Trim
		          
		          sum = sum + rs.Column("p").DoubleValue
		          
		          Exit For Row
		          
		        End If
		        
		      Next
		      
		    End Select
		    
		    
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  
		  
		  WebLabel_Total_Points.Text = "Total Points = " + Format(sum, "0.00")
		  ProgressWheel1.Visible = False
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		task_type_id As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		user_id As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events WebButton_Close
	#tag Event
		Sub Pressed()
		  Self.Close
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_BUTTON_Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WebLabel_Name
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WebLabel_Task_Type_Name
	#tag Event
		Sub Shown()
		  me.TextColor = Color.Yellow
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WebLabel_Total_Points
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
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
		Name="Position"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="WebDialog.Positions"
		EditorType="Enum"
		#tag EnumValues
			"0 - Top"
			"1 - Center"
		#tag EndEnumValues
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
		Visible=false
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
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
	#tag ViewProperty
		Name="user_id"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="task_type_id"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
