#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Statistics_Tasks
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   600
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
   Width           =   1240
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebTabPanel WebTabPanel_Tasks
      ControlCount    =   0
      ControlID       =   ""
      Enabled         =   True
      HasBorder       =   True
      Height          =   560
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelCount      =   2
      Scope           =   2
      SelectedPanelIndex=   0
      TabDefinition   =   "All planners\rPer planner"
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   1200
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebListBox WebListBox_All_Planners
         ColumnCount     =   1
         ColumnWidths    =   ""
         ControlID       =   ""
         Enabled         =   True
         HasHeader       =   True
         Height          =   486
         HighlightSortedColumn=   True
         Index           =   -2147483648
         Indicator       =   0
         InitialValue    =   ""
         LastAddedRowIndex=   0
         LastColumnIndex =   0
         LastRowIndex    =   0
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         NoRowsMessage   =   ""
         PanelIndex      =   "0"
         Parent          =   "WebTabPanel_Tasks"
         ProcessingMessage=   ""
         RowCount        =   0
         RowSelectionType=   1
         Scope           =   2
         SearchCriteria  =   ""
         SelectedRowColor=   &c0d6efd
         SelectedRowIndex=   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   74
         Visible         =   True
         Width           =   1160
         _mPanelIndex    =   -1
      End
      Begin WebProgressWheel ProgressWheel1
         Colorize        =   True
         ControlID       =   ""
         Enabled         =   True
         Height          =   250
         Index           =   -2147483648
         Indicator       =   0
         Left            =   495
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   "0"
         Parent          =   "WebTabPanel_Tasks"
         Scope           =   2
         SVGColor        =   &cFFD47900
         SVGData         =   ""
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   175
         Visible         =   True
         Width           =   250
         _mPanelIndex    =   -1
      End
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub POPULATE_WebListBox_All_Planners()
		  ProgressWheel1.Visible = True
		  Var d As DateTime = DateTime.Now.SubtractInterval(1,0.0)
		  
		  
		  For row As Integer = 0 To WebListBox_All_Planners.LastRowIndex
		    
		    For column As Integer= 1 To WebListBox_All_Planners.LastColumnIndex
		      
		      Var sql As String = " SELECT SUM(p) as total FROM (" _
		      + "SELECT SUM(multiplier*weight) AS p " _
		      + "FROM physics_tasking.tasks " _
		      + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		      + "WHERE physics_tasking.tasks.user_id = " + WebListBox_All_Planners.ColumnTagAt( column) + " " _
		      + "AND physics_tasking.tasks.task_type_id = " + WebListBox_All_Planners.RowTagAt( row) + " " _
		      + "AND DATE(physics_tasking.tasks.completion_date) >= '"  + d.SQLDate + "' " _
		      + "UNION " _
		      + "SELECT SUM( " _
		      + App.Points_Schedulted_Tasks_Condition + " * multiplier) aS p " _
		      + "FROM physics_tasking.scheduled_tasks " _
		      + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		      + "WHERE physics_tasking.scheduled_tasks.user_id = " + WebListBox_All_Planners.ColumnTagAt( column) + " " _
		      + "AND physics_tasking.scheduled_tasks.task_type_id = " + WebListBox_All_Planners.RowTagAt( row) + " " _
		      + "AND DATE(physics_tasking.scheduled_tasks.completion_date) >= '"  + d.SQLDate + "' " _
		      +") as t;"
		      
		      'Var sql As String = "SELECT SUM(multiplier*weight) as p " _
		      '+ "FROM physics_tasking.tasks " _
		      '+ "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		      '+ "WHERE physics_tasking.tasks.user_id = " + WebListBox_All_Planners.ColumnTagAt( column) + " " _
		      '+ "AND physics_tasking.tasks.task_type_id = " + WebListBox_All_Planners.RowTagAt( row) + " " _
		      '+ "AND DATE(physics_tasking.tasks.completion_date) >= '"  + d.SQLDate + "';" 
		      '
		      Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		      '
		      'sql = "SELECT SUM(multiplier*weight) as p " _
		      '+ "FROM physics_tasking.scheduled_tasks " _
		      '+ "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		      '+ "WHERE physics_tasking.scheduled_tasks.user_id = " + WebListBox_All_Planners.ColumnTagAt( column) + " " _
		      '+ "AND physics_tasking.scheduled_tasks.task_type_id = " + WebListBox_All_Planners.RowTagAt( row) + " " _
		      '+ "AND DATE(physics_tasking.scheduled_tasks.completion_date) >= '"  + d.SQLDate + "';"
		      
		      'Var rs_scheduled_tasks As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		      
		      
		      WebListBox_All_Planners.CellTextAt(row, column  )= Format( rs.Column("total").DoubleValue, "#0.00")
		      
		      
		      
		    Next
		    
		    
		    
		  Next
		  
		  
		  ProgressWheel1.Visible = False
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events WebListBox_All_Planners
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Var d As DateTime = DateTime.Now.SubtractInterval(1,0.0)
		  
		  Var sql As String = "SELECT users.user_id, initials FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.users USING(user_id) "_
		  + "WHERE DATE(physics_tasking.tasks.completion_date) >= '"  + d.SQLDate + "' " _
		  + "GROUP BY user_id "  _
		  + "ORDER BY initials;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  
		  Me.ColumnCount = rs.RowCount + 1
		  
		  Var column As Integer = 0
		  
		  Me.HeaderAt( column) = "Task"
		  
		  While Not rs.AfterLastRow
		    
		    column = column + 1
		    
		    Me.HeaderAt( column) = rs.Column("initials").StringValue.Trim.Uppercase
		    Me.ColumnTagAt( column) = rs.Column("user_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  sql = " SELECT task_types.task_type_id as task_type_id, name FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "UNION " _
		  + "SELECT task_types.task_type_id AS task_type_id, name FROM physics_tasking.scheduled_tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "ORDER by name"
		  
		  
		  
		  rs = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("name").StringValue.Trim)
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("task_type_id").IntegerValue
		    
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(row As Integer, column As Integer)
		  If column < 1 Or column > Me.LastColumnIndex Then Return
		  If row < 0 Or row > Me.LastRowIndex Then Return
		  
		  Var thedialog As New WebDialog_User_Tasks
		  thedialog.user_id = Me.ColumnTagAt( column)
		  thedialog.task_type_id = Me.RowTagAt(row)
		  thedialog.POPULATE
		  thedialog.show
		End Sub
	#tag EndEvent
	#tag Event
		Sub Shown()
		  POPULATE_WebListBox_All_Planners
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
