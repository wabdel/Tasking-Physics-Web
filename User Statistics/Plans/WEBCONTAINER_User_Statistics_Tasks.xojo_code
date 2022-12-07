#tag WebContainerControl
Begin WebContainer WEBCONTAINER_User_Statistics_Tasks
   Compatibility   =   ""
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
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebListBox Task_Groups_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   False
      Height          =   560
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
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
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   2
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   590
      _mPanelIndex    =   -1
   End
   Begin WebListBox Task_Type_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   False
      Height          =   560
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   630
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   2
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   1
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   590
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub POPULATE_Task_Group_ListBox()
		  Task_Groups_ListBox.RemoveAllRows
		  
		  'Var sql As String = "SELECT task_group_id, task_groups.name AS name, SUM(multiplier) AS c, " _
		  '+ "SUM(weight*multiplier) As sum " _
		  '+ "FROM physics_tasking.tasks " _
		  '+ "INNER Join physics_tasking.task_types USING(task_type_id) " _
		  '+"INNER Join physics_tasking.task_groups USING(task_group_id)  " _
		  '+ "WHERE user_id = " + Session.Logged_in_User.id.ToString + " " _
		  '+ "GROUP BY task_group_id " _
		  '+ "ORDER BY task_groups.name "
		  
		  Var sql  As String = "SELECT task_groups.task_group_id AS task_group_id, " _
		  + "task_groups.name AS name, " _
		  + "(SELECT IFNULL(sum(multiplier), 0) " _
		  + "FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "WHERE task_groups.task_group_id = task_group_id " _
		  + "AND user_id = " + Session.Logged_in_User.id.ToString + ") + " _ 
		  + "(SELECT IFNULL( SUM(multiplier),0) " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "WHERE task_groups.task_group_id = task_group_id " _
		  + "AND user_id = " + Session.Logged_in_User.id.ToString + ") as c, " _ 
		  + "(SELECT IFNULL( SUM(multiplier * weight), 0) " _
		  + "FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "WHERE task_groups.task_group_id = task_group_id " _
		  + "AND user_id = " + Session.Logged_in_User.id.ToString + ") + " _ 
		  + "(SELECT IFNULL( " _
		  + "SUM( " _
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
		  + "END * multiplier), 0) AS points " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "WHERE task_groups.task_group_id = task_group_id " _
		  + "AND user_id = " + Session.Logged_in_User.id.ToString + ") AS points " _ 
		  + "FROM physics_tasking.task_groups " _
		  + "ORDER BY task_groups.name; "
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    If rs.Column("c").IntegerValue > 0  Then
		      
		      Task_Groups_ListBox.AddRow()
		      Task_Groups_ListBox.RowTagAt( Task_Groups_ListBox.LastAddedRowIndex) = rs.Column("task_group_id").IntegerValue
		      
		      Task_Groups_ListBox.CellTextAt( Task_Groups_ListBox.LastAddedRowIndex, 0)= rs.Column("name").StringValue.Trim.Uppercase
		      
		      Task_Groups_ListBox.CellTextAt( Task_Groups_ListBox.LastAddedRowIndex, 1)= rs.Column("c").IntegerValue.ToString
		      
		      Task_Groups_ListBox.CellTextAt( Task_Groups_ListBox.LastAddedRowIndex, 2) = Format( rs.Column("points").DoubleValue, "0.0")
		      
		    End If
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub POPULATE_Task_Type_ListBox(task_group_id as Integer)
		  Task_Type_ListBox.RemoveAllRows
		  
		  Var sql  As String = "SELECT task_types.task_type_id AS task_type_id, " _
		  + "task_types.name AS name, " _
		  + "(SELECT IFNULL(sum(multiplier), 0) " _
		  + "FROM physics_tasking.tasks " _
		  + "WHERE task_types.task_type_id = tasks.task_type_id " _
		  + "AND user_id = " + Session.Logged_in_User.id.ToString + ") + " _ 
		  + "(SELECT IFNULL( SUM(multiplier),0) " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "WHERE task_types.task_type_id = scheduled_tasks.task_type_id " _
		  + "AND user_id = " + Session.Logged_in_User.id.ToString + ") as c, " _ 
		  + "(SELECT IFNULL( SUM(multiplier * weight), 0) " _
		  + "FROM physics_tasking.tasks " _
		  + "WHERE task_types.task_type_id = tasks.task_type_id  " _
		  + "AND user_id = " + Session.Logged_in_User.id.ToString + ") + " _ 
		  + "(SELECT IFNULL( " _
		  + "SUM( " _
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
		  + "END * multiplier), 0) AS points " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "WHERE task_types.task_type_id = scheduled_tasks.task_type_id " _
		  + "AND user_id = " + Session.Logged_in_User.id.ToString + ") AS points " _ 
		  + "FROM physics_tasking.task_types " _
		  + "WHERE task_group_id = " + task_group_id.ToString + " " _
		  + "ORDER BY task_types.name;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    If rs.Column("c").IntegerValue > 0  Then
		      
		      Task_Type_ListBox.AddRow()
		      Task_Type_ListBox.RowTagAt( Task_Type_ListBox.LastAddedRowIndex) = rs.Column("task_type_id").IntegerValue
		      
		      Task_Type_ListBox.CellTextAt( Task_Type_ListBox.LastAddedRowIndex, 0)= rs.Column("name").StringValue.Trim.Uppercase
		      
		      Task_Type_ListBox.CellTextAt( Task_Type_ListBox.LastAddedRowIndex, 1)= rs.Column("c").IntegerValue.ToString
		      
		      Task_Type_ListBox.CellTextAt( Task_Type_ListBox.LastAddedRowIndex, 2) = Format( rs.Column("points").DoubleValue, "0.0")
		      
		    End If
		    
		    rs.MoveToNextRow
		    
		  Wend
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Task_Groups_ListBox
	#tag Event
		Sub SelectionChanged(Rows() as Integer)
		  Task_Type_ListBox.Enabled = True
		  POPULATE_Task_Type_ListBox( Me.RowTagAt( Me.SelectedRowIndex))
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.ColumnCount =3
		  Me.HasHeader = True
		  Me.HeaderAt(0) = "Task group"
		  Me.HeaderAt(1) = "Count"
		  Me.HeaderAt(2) = "Points"
		  POPULATE_Task_Group_ListBox
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Task_Type_ListBox
	#tag Event
		Sub Opening()
		  Me.ColumnCount =3
		  Me.HasHeader = True
		  Me.HeaderAt(0) = "Task type"
		  Me.HeaderAt(1) = "Count"
		  Me.HeaderAt(2) = "Points"
		  Me.Enabled = False
		  
		  
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
