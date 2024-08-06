#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Completed_Assigned_Tasks Implements WebDataSource
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   786
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
   Width           =   1220
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebListBox Completed_Assigned_Tasks_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   654
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
      NoRowsMessage   =   "No Data"
      PanelIndex      =   0
      ProcessingMessage=   "Processing"
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   112
      Visible         =   True
      Width           =   1180
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
      Left            =   1084
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
      TabIndex        =   1
      TabStop         =   True
      Text            =   "Tasks = 0"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   66
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
      PanelIndex      =   0
      Period          =   1000
      RunMode         =   2
      Scope           =   2
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   0
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
      Text            =   "Assigned Task"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   263
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
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   66
      Visible         =   True
      Width           =   629
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   1
      Indicator       =   0
      Italic          =   False
      Left            =   657
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
      TabIndex        =   4
      TabStop         =   True
      Text            =   "Machine"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
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
      Left            =   657
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
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   66
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   2
      Indicator       =   0
      Italic          =   False
      Left            =   810
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
      TabIndex        =   6
      TabStop         =   True
      Text            =   "Due Date"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
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
      Left            =   810
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
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   66
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Surface_Primary
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  
		  Var sql As String = "CREATE OR REPLACE VIEW completed_assigned_tasks AS " _
		  + "SELECT physics_tasking.scheduled_tasks.scheduled_task_id As scheduled_task_id, " _
		  + "physics_tasking.task_types.name As task_type_name, " _
		  + "physics_tasking.task_groups.task_group_id As task_group_id, " _
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
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  Task_Type_PopupMenu.RemoveAllRows
		  
		  Task_Type_PopupMenu.AddRow("All")
		  Task_Type_PopupMenu.RowTagAt(Task_Type_PopupMenu.LastAddedRowIndex) = 0
		  
		  
		  
		  sql = "SELECT DISTINCT(task_group_name), " _
		  + "task_group_id " _
		  + "FROM physics_tasking.completed_assigned_tasks " _
		  + "ORDER BY task_group_name;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Task_Type_PopupMenu.AddRow( rs.Column("task_group_name").StringValue.Trim.Uppercase )
		    Task_Type_PopupMenu.RowTagAt( Task_Type_PopupMenu.LastAddedRowIndex) =rs.Column( "task_group_id").IntegerValue 
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  Machine_PopupMenu.RemoveAllRows
		  
		  Machine_PopupMenu.AddRow("All")
		  Machine_PopupMenu.RowTagAt(Machine_PopupMenu.LastAddedRowIndex) = 0
		  
		  sql = "SELECT DISTINCT(machine_name), " _
		  + "machine_id " _
		  + "FROM physics_tasking.completed_assigned_tasks " _
		  + "ORDER BY machine_name"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
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
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
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
		  col.DatabaseColumnName = "completion_date" // the name of the field in your database or data source
		  col.Heading = "Completion Date" // the name that appears above the column
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
		Private Sub POPULATE_POPUPMENUS()
		  Var Task_Group_id As Variant
		  
		  If Task_Type_PopupMenu.RowCount > 0 And Task_Type_PopupMenu.SelectedRowIndex > -1 Then
		    
		    Task_Group_id =  Task_Type_PopupMenu.RowTagAt( Task_Type_PopupMenu.SelectedRowIndex)
		    
		  Else
		    
		    Task_Group_id = 0
		    
		    
		  End If
		  
		  Var Machine_id As Variant 
		  
		  If Machine_PopupMenu.RowCount > 0  And Machine_PopupMenu.SelectedRowIndex > -1 Then
		    
		    Machine_id = Machine_PopupMenu.RowTagAt( Machine_PopupMenu.SelectedRowIndex)
		    
		  Else
		    
		    Machine_id = 0
		    
		    
		  End If
		  
		  
		  Var Due_Date As Variant 
		  
		  If Due_Date_PopupMenu.RowCount > 0 And Due_Date_PopupMenu.SelectedRowIndex > -1 Then
		    
		    Due_date = Due_Date_PopupMenu.RowTagAt( Due_Date_PopupMenu.SelectedRowIndex)
		    
		  Else
		    Due_date = 0
		    
		  End If
		  
		  Var sql As String = "CREATE OR REPLACE VIEW completed_assigned_tasks AS " _
		  + "SELECT physics_tasking.scheduled_tasks.scheduled_task_id As scheduled_task_id, " _
		  + "physics_tasking.task_types.name As task_type_name, " _
		  + "physics_tasking.task_groups.task_group_id As task_group_id, " _
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
		  
		  If Task_Type_PopupMenu.SelectedRowIndex > 0 Then
		    
		    sql = sql + "AND physics_tasking.task_groups.task_group_id = " _
		    + Str(Task_Type_PopupMenu.RowTagAt( Task_Type_PopupMenu.SelectedRowIndex)) + " "
		    
		  End If
		  
		  If Machine_PopupMenu.SelectedRowIndex > 0 Then
		    
		    sql = sql + "AND physics_tasking.machines.machine_id = " _
		    + Str(Machine_PopupMenu.RowTagAt( Machine_PopupMenu.SelectedRowIndex)) + " "
		    
		  End If
		  
		  If Due_Date_PopupMenu.SelectedRowIndex > 0 Then
		    
		    sql = sql + "AND physics_tasking.scheduled_tasks.due_date = '" _
		    + Due_Date_PopupMenu.RowTagAt( Due_Date_PopupMenu.SelectedRowIndex) + "' "
		    
		  End If
		  
		  
		  sql = sql + "ORDER BY DATE(physics_tasking.scheduled_tasks.due_date) DESC, " _
		  + "physics_tasking.scheduled_tasks.scheduled_task_id DESC;"
		  
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  Task_Type_PopupMenu.RemoveAllRows
		  
		  Task_Type_PopupMenu.AddRow("All")
		  Task_Type_PopupMenu.RowTagAt(Task_Type_PopupMenu.LastAddedRowIndex) = 0
		  
		  
		  
		  sql = "SELECT DISTINCT(task_group_name), " _
		  + "task_group_id " _
		  + "FROM physics_tasking.completed_assigned_tasks " _
		  + "ORDER BY task_group_name;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Task_Type_PopupMenu.AddRow( rs.Column("task_group_name").StringValue.Trim.Uppercase )
		    Task_Type_PopupMenu.RowTagAt( Task_Type_PopupMenu.LastAddedRowIndex) =rs.Column( "task_group_id").IntegerValue 
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  Machine_PopupMenu.RemoveAllRows
		  
		  Machine_PopupMenu.AddRow("All")
		  Machine_PopupMenu.RowTagAt(Machine_PopupMenu.LastAddedRowIndex) = 0
		  
		  sql = "SELECT DISTINCT(machine_name), " _
		  + "machine_id " _
		  + "FROM physics_tasking.completed_assigned_tasks " _
		  + "ORDER BY machine_name"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
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
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Due_Date_PopupMenu.AddRow( rs.Column("due_date").DateTimeValue.ToString( _
		    Locale.Current, DateTime.FormatStyles.Medium, DateTime.FormatStyles.None ))
		    
		    Due_Date_PopupMenu.RowTagAt( Due_Date_PopupMenu.LastAddedRowIndex) = rs.Column("due_date").DateTimeValue
		    rs.MoveToNextRow
		    
		  Wend
		  
		  If Task_Group_id = 0 Then
		    
		    Task_Type_PopupMenu.SelectedRowIndex = 0
		    
		  Else
		    
		    Task_Type_PopupMenu.SelectRowWithTag(Task_Group_id)
		    
		  End If
		  
		  If Machine_id = 0 Then
		    
		    Machine_PopupMenu.SelectedRowIndex = 0
		    
		  Else
		    
		    Machine_PopupMenu.SelectRowWithTag(Machine_id)
		    
		  End If
		  
		  
		  If Due_Date = 0 Then
		    
		    Due_Date_PopupMenu.SelectedRowIndex = 0
		    
		  Else
		    
		    Due_Date_PopupMenu.SelectRowWithTag( Due_Date)
		    
		  End If
		  
		  Completed_Assigned_Tasks_ListBox.ReloadData
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  
		  Var sql As String = "SELECT COUNT(*) as c " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "WHERE is_completed = TRUE " _
		  + "ORDER BY physics_tasking.scheduled_tasks.due_date DESC"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		  // Part of the WebDataSource interface.
		  
		  
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
		  + "DATE(physics_tasking.scheduled_tasks.due_date) As due_date, " _
		  + "DATE(physics_tasking.scheduled_tasks.completion_date) As completion_date " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "INNER JOIN physics_tasking.machines USING(machine_id) " _
		  + "INNER JOIN physics_tasking.task_groups USING(task_group_id) " _
		  + "INNER JOIN physics_tasking.users USING(user_id) " _
		  + "WHERE physics_tasking.scheduled_tasks.is_completed = TRUE " 
		  
		  If Task_Type_PopupMenu.SelectedRowIndex > 0 Then
		    
		    sql = sql + "AND physics_tasking.task_groups.task_group_id = " _
		    + Str(Task_Type_PopupMenu.RowTagAt( Task_Type_PopupMenu.SelectedRowIndex)) + " "
		    
		  End If
		  
		  If Machine_PopupMenu.SelectedRowIndex > 0 Then
		    
		    sql = sql + "AND physics_tasking.machines.machine_id = " _
		    + Str(Machine_PopupMenu.RowTagAt( Machine_PopupMenu.SelectedRowIndex)) + " "
		    
		  End If
		  
		  If Due_Date_PopupMenu.SelectedRowIndex > 0 Then
		    
		    sql = sql + "AND physics_tasking.scheduled_tasks.due_date = '" _
		    + Due_Date_PopupMenu.RowTagAt( Due_Date_PopupMenu.SelectedRowIndex) + "' "
		    
		  End If
		  
		  
		  sql = sql + "ORDER BY DATE(physics_tasking.scheduled_tasks.due_date) DESC, " _
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
		    
		    temp = rs.Column("completion_date").DateValue
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    temp.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    row.Value("completion_date") = cellRenderer
		    
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
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "INNER JOIN physics_tasking.machines USING(machine_id) " _
		  + "INNER JOIN physics_tasking.task_groups USING(task_group_id) " _
		  + "INNER JOIN physics_tasking.users USING(user_id) " _
		  + "WHERE physics_tasking.scheduled_tasks.is_completed = TRUE "
		  
		  If Task_Type_PopupMenu.SelectedRowIndex > 0 Then
		    
		    sql = sql + "AND physics_tasking.task_groups.task_group_id = " _
		    + Str(Task_Type_PopupMenu.RowTagAt( Task_Type_PopupMenu.SelectedRowIndex)) + " "
		    
		  End If
		  
		  If Machine_PopupMenu.SelectedRowIndex > 0 Then
		    
		    sql = sql + "AND physics_tasking.machines.machine_id = " _
		    + Str(Machine_PopupMenu.RowTagAt( Machine_PopupMenu.SelectedRowIndex)) + " "
		    
		  End If
		  
		  If Due_Date_PopupMenu.SelectedRowIndex > 0 Then
		    
		    sql = sql + "AND physics_tasking.scheduled_tasks.due_date = '" _
		    + Due_Date_PopupMenu.RowTagAt( Due_Date_PopupMenu.SelectedRowIndex) + "' "
		    
		  End If
		  
		  sql = sql + "ORDER BY DATE(physics_tasking.scheduled_tasks.due_date) DESC, " _
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
		Private Latest_UPDATE As DateTime
	#tag EndProperty


#tag EndWindowCode

#tag Events Completed_Assigned_Tasks_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = Self
		  'Me.DataSource = New CompletedAssignedTasksDataSource
		  Me.ReloadData
		  'Completed_Assigned_Tasks_Label.Text = "Tasks = " + Me.DataSource.RowCount.ToString
		  
		  'Me.ColumnCount = 5
		  'Me.HeaderAt(0) = "Assigned Task"
		  'Me.HeaderAt(1) = "Machine"
		  'Me.HeaderAt(2) = "Due date"
		  'Me.HeaderAt(3) = "Completion date"
		  'Me.HeaderAt(4) = "Staff"
		  Latest_UPDATE = App.last_database_update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Completed_Assigned_Tasks_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		  
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
#tag Events Label1
	#tag Event
		Sub Opening(index as Integer)
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Task_Type_PopupMenu
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  Me.Style = Design_Palette.STYLE_POPUPMENU_Selected
		  Completed_Assigned_Tasks_ListBox.ReloadData
		  
		  'POPULATE_POPUPMENUS
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_POPUPMENU_Emply
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Machine_PopupMenu
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  Me.Style = Design_Palette.STYLE_POPUPMENU_Selected
		  Completed_Assigned_Tasks_ListBox.ReloadData
		  
		  'POPULATE_POPUPMENUS
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_POPUPMENU_Emply
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Due_Date_PopupMenu
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  Me.Style = Design_Palette.STYLE_POPUPMENU_Selected
		  Completed_Assigned_Tasks_ListBox.ReloadData
		  
		  'POPULATE_POPUPMENUS
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_POPUPMENU_Emply
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
