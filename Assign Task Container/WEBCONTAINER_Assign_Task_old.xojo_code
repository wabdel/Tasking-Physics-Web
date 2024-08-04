#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Assign_Task_old Implements WebDataSource
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   700
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
   Width           =   1200
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebButton Reset_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Reset"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   1080
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
      Top             =   642
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLabel Title_Label
      Bold            =   True
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   0
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
      Text            =   "Assign New Task"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   1200
      _mPanelIndex    =   -1
   End
   Begin WebButton Assign_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Assign"
      ControlID       =   ""
      Default         =   False
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   550
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
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   642
      Visible         =   True
      Width           =   100
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
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   14
      TabStop         =   True
      Tooltip         =   ""
      Top             =   81
      Visible         =   True
      Width           =   594
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
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   15
      TabStop         =   True
      Text            =   "Task :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   81
      Underline       =   False
      Visible         =   True
      Width           =   152
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
      TabIndex        =   16
      TabStop         =   True
      Text            =   "Machine :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   145
      Underline       =   False
      Visible         =   True
      Width           =   152
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
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   17
      TabStop         =   True
      Tooltip         =   ""
      Top             =   145
      Visible         =   True
      Width           =   354
      _mPanelIndex    =   -1
   End
   Begin WebLabel Assign_to_Label
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
      TabIndex        =   18
      TabStop         =   True
      Text            =   "Assign to :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   201
      Underline       =   False
      Visible         =   True
      Width           =   152
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu Staff_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   19
      TabStop         =   True
      Tooltip         =   ""
      Top             =   201
      Visible         =   True
      Width           =   354
      _mPanelIndex    =   -1
   End
   Begin WebDatePicker Due_DatePicker
      AllowKeyboardEntry=   False
      ControlID       =   ""
      EarliestDate    =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LatestDate      =   ""
      Left            =   929
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   20
      TabStop         =   True
      Tooltip         =   ""
      Top             =   145
      Visible         =   True
      Width           =   121
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
      Left            =   814
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
      TabIndex        =   21
      TabStop         =   True
      Text            =   "Start Date :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   145
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebListBox Scheduled_Tasks_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   309
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
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   22
      TabStop         =   True
      Tooltip         =   ""
      Top             =   263
      Visible         =   True
      Width           =   1160
      _mPanelIndex    =   -1
   End
   Begin WebLabel Assigned_Tasks_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   1054
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
      TabIndex        =   23
      TabStop         =   True
      Text            =   "Tasks = 0"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   580
      Underline       =   False
      Visible         =   True
      Width           =   126
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  'selected_user_id = Points_Container.GET_Random_Planner
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  Style.BackgroundColor = Design_Palette.COLOR_Central_Background
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ASSIGN_Scheduled_Task()
		  
		  
		  // Let check if patient exists
		  
		  Var row As New DatabaseRow
		  
		  row.Column("task_type_id").IntegerValue = Task_Type_PopupMenu.RowTagAt( Task_Type_PopupMenu.SelectedRowIndex)
		  row.Column("machine_id").IntegerValue = Machine_PopupMenu.RowTagAt( Machine_PopupMenu.SelectedRowIndex)
		  row.Column("user_id").IntegerValue = Staff_PopupMenu.RowTagAt( Staff_PopupMenu.SelectedRowIndex)
		  row.Column("assigned_by_id").IntegerValue = Session.Logged_in_User.id
		  row.Column("assignment_date").DateTimeValue = DateTime.Now
		  row.Column("due_date").DateTimeValue = Due_DatePicker.SelectedDate
		  row.Column("notes").StringValue = "(Assigned manually by " + Session.Logged_in_User.full_name.ToText + ")" 
		  row.Column("multiplier").IntegerValue = 0
		  
		  Physics_Tasking.INSERT_Row("physics_tasking.scheduled_tasks", row)
		  
		  
		  Var Assign_scheduled_Task As New DatabaseRow
		  Assign_scheduled_Task.Column("user_id").IntegerValue = Session.Logged_in_User.id
		  Assign_scheduled_Task.Column("task_type_id").IntegerValue = 1
		  Assign_scheduled_Task.Column("multiplier").IntegerValue = 1
		  Assign_scheduled_Task.Column("completion_date").DateTimeValue = DateTime.Now
		  Assign_scheduled_Task.Column("notes").StringValue = "Assigned " _
		  + Task_Type_PopupMenu.RowValueAt( Task_Type_PopupMenu.SelectedRowIndex) + " - " _
		  + Machine_PopupMenu.RowValueAt( Machine_PopupMenu.SelectedRowIndex) + "/ to " _
		  + Staff_PopupMenu.RowValueAt( Staff_PopupMenu.SelectedRowIndex)
		  
		  Physics_Tasking.INSERT_Row("physics_tasking.tasks", Assign_scheduled_Task)
		  
		  App.last_database_update = DateTime.Now
		  
		  
		  RESET_Assign_Task
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "task_type" // the name of the field in your database or data source
		  col.Heading = "Task" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "650"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "machine_name" // the name of the field in your database or data source
		  col.Heading = "Machine" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "150"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "due_date" // the name of the field in your database or data source
		  col.Heading = "Due Date" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "staff" // the name of the field in your database or data source
		  col.Heading = "Staff" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "80"
		  cols.Add(col)
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  // Part of the WebDataSource interface.
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ENABLE_Assign_Button()
		  Assign_Button.Enabled = False
		  
		  If Task_Type_PopupMenu.SelectedRowIndex = -1 Then Return
		  
		  If Machine_PopupMenu.SelectedRowIndex = -1 Then Return
		  
		  If Staff_PopupMenu.SelectedRowIndex = -1 Then Return
		  
		  Var d As  DateTime = DateTime.Now
		  
		  Var today As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  
		  If Due_DatePicker.SelectedDate < Today Then Return
		  
		  Assign_Button.Enabled = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RESET_Assign_Task()
		  Task_Type_PopupMenu.SelectedRowIndex = -1
		  
		  Staff_PopupMenu.SelectedRowIndex = -1
		  
		  Machine_PopupMenu.SelectedRowIndex = -1
		  
		  Var d As  DateTime = DateTime.Now
		  
		  Due_DatePicker.SelectedDate = New DateTime( d.Year, d.Month, d.Day)
		  ENABLE_Assign_Button
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  
		  Var sql As String = "SELECT COUNT(*) as c " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "WHERE is_completed = FALSE " 
		  
		  If filter > 0 Then 
		    
		    sql = sql  + "AND user_id = " + filter.ToString + " " _
		    
		  End If
		  
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  
		  
		  Var rows() As WebListboxRowData
		  
		  
		  
		  Var d As DateTime = DateTime.Now
		  'Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  Var today As New DateTime(d.Year, d.Month, d.Day)
		  
		  //+ "physics_tasking.users.first_name As first_name, " _
		  //+ "physics_tasking.users.family_name As family_name, " _
		  Var sql As String = "SELECT physics_tasking.scheduled_tasks.scheduled_task_id As scheduled_task_id, " _
		  + "physics_tasking.task_types.name As task_type_name, " _
		  + "physics_tasking.task_groups.name As task_group_name, " _
		  + "physics_tasking.machines.name As machine_name, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "DATE(physics_tasking.scheduled_tasks.due_date) As due_date " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "INNER JOIN physics_tasking.machines USING(machine_id) " _
		  + "INNER Join physics_tasking.task_groups Using(task_group_id) " _
		  + "INNER Join physics_tasking.users Using(user_id) " _
		  + "WHERE physics_tasking.scheduled_tasks.is_completed = FALSE " 
		  
		  If filter > 0 Then 
		    
		    sql = sql  + "AND user_id = " + filter.ToString + " " _
		    
		  End If
		  
		  sql = sql + "ORDER BY DATE(physics_tasking.scheduled_tasks.due_date) ASC, " _
		  + "physics_tasking.scheduled_tasks.scheduled_task_id DESC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  While Not rs.AfterLastRow
		    Var s As New WebStyle
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("scheduled_task_id").IntegerValue
		    row.tag = rs.Column("scheduled_task_id").IntegerValue
		    row.Value("task_type") = rs.Column("task_group_name").StringValue.Trim.Uppercase + " / " _
		    + rs.Column("task_type_name").StringValue.Trim
		    
		    row.Value("machine_name") =  rs.Column("machine_name").StringValue.Trim
		    
		    Var temp As DateTime = rs.Column("due_date").DateValue
		    Var cellRenderer As New WebListBoxStyleRenderer(s, _
		    temp.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    row.Value("due_date") = cellRenderer
		    
		    row.Value("staff") = rs.Column("initials").StringValue.Trim.Uppercase
		    rows.Add(row)
		    
		    
		    rs.MoveToNextRow
		  Wend
		  rs.Close
		  
		  Return rows
		  
		  
		  
		  
		  
		  // Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SortedPrimaryKeys(sortColumns as String) As Integer()
		  // Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UnsortedPrimaryKeys() As Integer()
		  // Part of the WebDataSource interface.
		  
		  Var keys() As Integer 
		  
		  
		  Var sql As String = "SELECT physics_tasking.scheduled_tasks.scheduled_task_id As scheduled_task_id " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "WHERE physics_tasking.scheduled_tasks.is_completed = FALSE " 
		  
		  If filter > 0 Then 
		    
		    sql = sql  + "AND user_id = " + filter.ToString + " " _
		    
		  End If
		  
		  sql = sql + "ORDER BY DATE(physics_tasking.scheduled_tasks.due_date) ASC, " _
		  + "physics_tasking.scheduled_tasks.scheduled_task_id DESC;"
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("scheduled_task_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private filter As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private selected_patient_id As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private selected_user_id As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events Reset_Button
	#tag Event
		Sub Pressed()
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Title_Label
	#tag Event
		Sub Shown()
		  Me.Style.ForegroundColor = Color.White
		  Me.FontSize = 20
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Assign_Button
	#tag Event
		Sub Pressed()
		  Me.Enabled = False
		  Me.Indicator = WebUIControl.Indicators.Warning
		  
		  ASSIGN_Scheduled_Task
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Shown()
		  Me.Enabled = False
		  Me.Indicator = Indicators.Danger
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Task_Type_PopupMenu
	#tag Event
		Sub Shown()
		  Me.RemoveAllRows
		  
		  Var sql As String = "SELECT task_type_id, name " _
		  + "FROM task_types " _
		  + "WHERE is_schedulable = TRUE " _
		  + "ORDER BY name"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("name").StringValue )
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("task_type_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  ENABLE_Assign_Button
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Task_Type_Label
	#tag Event
		Sub Shown()
		  Me.Style.ForegroundColor = Color.White
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Machine_Label
	#tag Event
		Sub Shown()
		  Me.Style.ForegroundColor = Color.White
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Machine_PopupMenu
	#tag Event
		Sub Shown()
		  
		  Me.RemoveAllRows
		  
		  Var sql As String = "SELECT machine_id, name " _
		  + "FROM machines " _
		  + "ORDER BY name"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("name").StringValue )
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("machine_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  ENABLE_Assign_Button
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Assign_to_Label
	#tag Event
		Sub Shown()
		  Me.Style.ForegroundColor = Color.White
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Staff_PopupMenu
	#tag Event
		Sub Shown()
		  
		  Me.RemoveAllRows
		  
		  Var sql As String = "SELECT user_id, first_name, family_name " _
		  + "FROM users " _
		  + "WHERE category_id IN (2,3) " _
		  + "AND is_retired = FALSE " _
		  + "ORDER BY first_name, family_name"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("first_name").StringValue.Trim.Titlecase + " " + rs.Column("family_name").StringValue.Trim.Uppercase )
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("user_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  If Me.SelectedRowIndex = -1 Then
		    
		    filter = 0
		    
		  Else
		    
		    filter = Me.RowTagAt( Me.SelectedRowIndex)
		    
		  End If
		  
		  Scheduled_Tasks_ListBox.ReloadData
		  Assigned_Tasks_Label.Text = "Tasks = " + Scheduled_Tasks_ListBox.DataSource.RowCount.ToString
		  
		  ENABLE_Assign_Button
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Due_DatePicker
	#tag Event
		Sub Opening()
		  Var d As  DateTime = DateTime.Now
		  
		  Me.SelectedDate = New DateTime( d.Year, d.Month, d.Day)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DateChanged(selectedDate As DateTime)
		  ENABLE_Assign_Button
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Due_Date_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Color.White
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Scheduled_Tasks_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = Self
		  Assigned_Tasks_Label.Text = "Tasks = " + Me.DataSource.RowCount.ToString
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Assigned_Tasks_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Color.White
		  
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
