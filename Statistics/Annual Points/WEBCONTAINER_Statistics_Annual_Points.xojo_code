#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Statistics_Annual_Points
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
   PanelIndex      =   0
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   1240
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebListBox Planner_Annual_Points_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   506
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
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
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   41
      Visible         =   True
      Width           =   803
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Central_Background2
		  
		  POPULATE_List
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub POPULATE_List()
		  Planner.ResizeTo(-1)
		  
		  Var sql As String ="SELECT user_id FROM users WHERE is_retired = False AND category_id IN(2,3)"
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  
		  Planner.ResizeTo(-1)
		  
		  While Not rs.AfterLastRow
		    
		    Planner.Add( New Physics_Tasking.CLASS_User_Record)
		    Planner( Planner.LastIndex).id = rs.Column("user_id").IntegerValue
		    
		    rs.MoveToNextRow
		  Wend
		  
		  Planner_Annual_Points_ListBox.RemoveAllRows
		  
		  For Each item As Physics_Tasking.CLASS_User_Record In Planner
		    
		    Planner_Annual_Points_ListBox.AddRow()
		    Planner_Annual_Points_ListBox.CellTextAt( Planner_Annual_Points_ListBox.LastAddedRowIndex, 0) = item.initials
		    
		    Var Today As DateTime = DateTime.Now
		    Var Year_First_Date As DateTime = New DateTime( Today.Year, 1, 1)
		    
		    sql = "SELECT SUM(" _
		    + "CASE " _
		    + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		    + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		    + "WEEKDAY(DATE(due_date)) + 1, 1) <= 0 THEN " _
		    + "weight * 2 " _
		    + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		    + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		    + "WEEKDAY(DATE(due_date)) + 1, 1) <= 1 THEN " _
		    + "weight * 1.5 " _
		    + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		    + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		    + "WEEKDAY(DATE(due_date)) + 1, 1) <= 2 THEN " _
		    + "weight * 1.25 " _
		    + "ELSE " _
		    + "weight " _
		    + "END) " _
		    + "AS sum " _
		    + "FROM plans INNER JOIN plan_types on plans.plan_type_id = plan_types.plan_type_id " _
		    + "WHERE user_id = " + item.id.ToString + " " _
		    + "AND DATE(assignment_date) >= '"  + Year_First_Date.SQLDate + "';"
		    
		    rs = Physics_Tasking.DB_SELECT_Statement(sql)
		    
		    Planner_Annual_Points_ListBox.CellTextAt( Planner_Annual_Points_ListBox.LastAddedRowIndex, 1) = _
		    Format( rs.Column("sum").DoubleValue, "#0.0")
		    
		    Var Points As Double = rs.Column("sum").DoubleValue
		    
		    
		    sql = "SELECT SUM( " _
		    + "weight * multiplier) as sum " _
		    + "FROM tasks INNER JOIN task_types USING(task_type_id) " _
		    + "WHERE user_id = " + item.id.ToString +  " "_
		    + "AND DATE(completion_date) >= '"  + Year_First_Date.SQLDate + "';"
		    
		    rs = Physics_Tasking.DB_SELECT_Statement(sql)
		    
		    Planner_Annual_Points_ListBox.CellTextAt( Planner_Annual_Points_ListBox.LastAddedRowIndex, 2) = _
		    Format( rs.Column("sum").DoubleValue, "#0.0")
		    
		    Points = Points + rs.Column("sum").DoubleValue
		    
		    
		    sql = "SELECT SUM( " _
		    + "CASE " _
		    + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 0 THEN " _
		    + "weight * 0.75 " _
		    + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 7 THEN " _
		    + "weight " _
		    + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 14 THEN " _
		    + "weight * 1.25 " _
		    + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 21 THEN " _
		    + "weight * 1.5 " _
		    + "ELSE " _
		    + "weight * 2 " _
		    + "END * multiplier) as sum " _
		    + "FROM scheduled_tasks INNER JOIN task_types USING(task_type_id) " _
		    + "WHERE user_id = " + item.id.ToString +  " "_
		    + "AND is_completed = TRUE " _
		    + "AND DATE(completion_date) >= '"  + Year_First_Date.SQLDate + "';"
		    
		    
		    rs = Physics_Tasking.DB_SELECT_Statement(sql)
		    
		    Planner_Annual_Points_ListBox.CellTextAt( Planner_Annual_Points_ListBox.LastAddedRowIndex, 3) = _
		    Format( rs.Column("sum").DoubleValue, "#0.0")
		    
		    Points = Points + rs.Column("sum").DoubleValue
		    
		    Planner_Annual_Points_ListBox.CellTextAt( Planner_Annual_Points_ListBox.LastAddedRowIndex, 4) = _
		    Format( Points, "#0.0")
		    
		    
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Planner() As Physics_Tasking.CLASS_User_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		Series() As CLASS_WebChartLinear
	#tag EndProperty


#tag EndWindowCode

#tag Events Planner_Annual_Points_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.ColumnCount = 5
		  
		  Me.HeaderAt(0) = "Initials"
		  Me.HeaderAt(1) = "Plans"
		  Me.HeaderAt(2) = "Tasks"
		  Me.HeaderAt(3) = "Scheduled tasks"
		  Me.HeaderAt(4) = "Total"
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
