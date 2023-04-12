#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Completed_Assigned_Tasks
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
   Begin WebListBox Completed_Assigned_Tasks_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   True
      Height          =   430
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
      NoRowsMessage   =   "No Data"
      ProcessingMessage=   "Processing"
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   104
      Visible         =   True
      Width           =   1200
      _mPanelIndex    =   -1
   End
   Begin WebLabel Completed_Assigned_Tasks_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   1094
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   1
      Text            =   "Tasks = 0"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   542
      Underline       =   False
      Visible         =   True
      Width           =   126
      _mPanelIndex    =   -1
   End
   Begin WebTimer REFRESH_Timer
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   0
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   2
      Scope           =   2
      _mPanelIndex    =   -1
   End
   Begin WebLabel Task_Type_Label
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
      Scope           =   2
      TabIndex        =   2
      Text            =   "Assigned Task"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   645
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu Task_Type_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
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
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowValue=   ""
      TabIndex        =   3
      Tooltip         =   ""
      Top             =   58
      Visible         =   True
      Width           =   645
      _mPanelIndex    =   -1
   End
   Begin WebLabel Machine_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   678
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   4
      Text            =   "Machine"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   12
      Underline       =   False
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu Machine_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   678
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowValue=   ""
      TabIndex        =   5
      Tooltip         =   ""
      Top             =   58
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
   Begin WebLabel Due_Date_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   836
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   6
      Text            =   "Due Date"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   12
      Underline       =   False
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu Due_Date_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   836
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowValue=   ""
      TabIndex        =   7
      Tooltip         =   ""
      Top             =   58
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Session.COLOR_Central_Background2
		  
		  Var sql As String = "CREATE OR REPLACE VIEW completed_assigned_tasks AS " _
		  + "SELECT physics_tasking.scheduled_tasks.scheduled_task_id As scheduled_task_id, " _
		  + "physics_tasking.task_types.name As task_type_name, " _
		  + "physics_tasking.task_types.task_type_id As task_type_id, " _
		  + "physics_tasking.task_groups.name As task_group_name, " _
		  + "physics_tasking.machines.name As machine_name, " _
		  + "physics_tasking.machines.machine_id As machine_id, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "DATE(physics_tasking.scheduled_tasks.due_date) As due_date, " _
		  + "DATE(physics_tasking.scheduled_tasks.completion_date) As completion_date " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "INNER JOIN physics_tasking.machines USING(machine_id) " _
		  + "INNER JOIN physics_tasking.task_groups USING(task_group_id) " _
		  + "INNER JOIN physics_tasking.users USING(user_id) " _
		  + "WHERE physics_tasking.scheduled_tasks.is_completed = TRUE " _
		  + "ORDER BY DATE(physics_tasking.scheduled_tasks.due_date) DESC, " _
		  + "physics_tasking.scheduled_tasks.scheduled_task_id DESC;"
		  
		  Physics_Tasking.DB_EXECUTE_Statement(sql)
		  
		  
		  Task_Type_PopupMenu.RemoveAllRows
		  
		  Task_Type_PopupMenu.AddRow("All")
		  Task_Type_PopupMenu.RowTagAt(Task_Type_PopupMenu.LastAddedRowIndex) = 0
		  
		  
		  
		  sql = "SELECT DISTINCT(task_type_name), " _
		  + "task_group_name, " _
		  + "task_type_id " _
		  + "FROM physics_tasking.completed_assigned_tasks " _
		  + "ORDER BY task_group_name, task_type_name"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Task_Type_PopupMenu.AddRow( rs.Column("task_group_name").StringValue.Trim.Uppercase + " / " +rs.Column("task_type_name").StringValue.Trim)
		    Task_Type_PopupMenu.RowTagAt( Task_Type_PopupMenu.LastAddedRowIndex) = rs.Column("task_type_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  Machine_PopupMenu.RemoveAllRows
		  
		  Machine_PopupMenu.AddRow("All")
		  Machine_PopupMenu.RowTagAt(Machine_PopupMenu.LastAddedRowIndex) = 0
		  
		  sql = "SELECT DISTINCT(machine_name), " _
		  + "machine_id " _
		  + "FROM physics_tasking.completed_assigned_tasks " _
		  + "ORDER BY machine_name"
		  
		  rs = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Machine_PopupMenu.AddRow( rs.Column("machine_name").StringValue.Trim.Uppercase )
		    Machine_PopupMenu.RowTagAt( Machine_PopupMenu.LastAddedRowIndex) = rs.Column("machine_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  Due_Date_PopupMenu.RemoveAllRows
		  
		  Due_Date_PopupMenu.AddRow("All")
		  Due_Date_PopupMenu.RowTagAt(Due_Date_PopupMenu.LastAddedRowIndex) = 0
		  
		  sql = "SELECT DISTINCT(due_date) " _
		  + "FROM physics_tasking.completed_assigned_tasks " _
		  + "ORDER BY due_date DESC"
		  
		  rs = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Due_Date_PopupMenu.AddRow( rs.Column("due_date").DateTimeValue.ToString( _
		    Locale.Current, DateTime.FormatStyles.Medium, DateTime.FormatStyles.None ))
		    
		    Due_Date_PopupMenu.RowTagAt( Due_Date_PopupMenu.LastAddedRowIndex) = rs.Column("due_date").DateTimeValue
		    rs.MoveToNextRow
		    
		  Wend
		  
		  Task_Type_PopupMenu.SelectedRowIndex = 0
		  Machine_PopupMenu.SelectedRowIndex = 0
		  Due_Date_PopupMenu.SelectedRowIndex = 0
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private Latest_UPDATE As DateTime
	#tag EndProperty


#tag EndWindowCode

#tag Events Completed_Assigned_Tasks_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  'Me.DataSource = New CompletedAssignedTasksDataSource
		  'Me.ReloadData
		  'Completed_Assigned_Tasks_Label.Text = "Tasks = " + Me.DataSource.RowCount.ToString
		  
		  Me.ColumnCount = 5
		  Me.HeaderAt(0) = "Assigned Task"
		  Me.HeaderAt(1) = "Machine"
		  Me.HeaderAt(2) = "Due date"
		  Me.HeaderAt(3) = "Completion date"
		  Me.HeaderAt(4) = "Staff"
		  Latest_UPDATE = App.last_database_update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Completed_Assigned_Tasks_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = App.Colour_Note
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events REFRESH_Timer
	#tag Event
		Sub Run()
		  
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    Completed_Assigned_Tasks_ListBox.ReloadData
		    Completed_Assigned_Tasks_Label.Text = "Tasks = " + Completed_Assigned_Tasks_ListBox.DataSource.RowCount.ToString
		    Latest_UPDATE = App.last_database_update
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Machine_PopupMenu
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Me.AddRow("All")
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Due_Date_PopupMenu
	#tag Event
		Sub SelectionChanged(item as WebMenuItem)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Me.AddRow("All")
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
