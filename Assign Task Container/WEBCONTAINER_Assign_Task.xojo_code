#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Assign_Task
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
   Begin WebPopupMenu Task_Group_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   502
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
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   37
      Visible         =   True
      Width           =   314
      _mPanelIndex    =   -1
   End
   Begin WebLabel Task_Group_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   264
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
      Text            =   "Task Group:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   37
      Underline       =   False
      Visible         =   True
      Width           =   230
      _mPanelIndex    =   -1
   End
   Begin WebListBox Assign_Tasks_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   360
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
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   125
      Visible         =   True
      Width           =   1160
      _mPanelIndex    =   -1
   End
   Begin WebButton Assign_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Assign"
      ControlID       =   ""
      Default         =   True
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
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
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   634
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox Select_Checkbox
      Caption         =   "Select All"
      ControlID       =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   1069
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   83
      Value           =   False
      Visible         =   True
      Width           =   111
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
      TabIndex        =   5
      TabStop         =   True
      Text            =   "Machine :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   511
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
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   511
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
      TabIndex        =   7
      TabStop         =   True
      Text            =   "Assign to :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   567
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
      TabIndex        =   8
      TabStop         =   True
      Tooltip         =   ""
      Top             =   567
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
      TabIndex        =   9
      TabStop         =   True
      Tooltip         =   ""
      Top             =   511
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
      TabIndex        =   10
      TabStop         =   True
      Text            =   "Due Date :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   511
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebDialog_Assign_Tasks Assign_Tasks_WebDialog
      Assign          =   False
      ControlCount    =   0
      ControlID       =   ""
      Enabled         =   True
      Height          =   400
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Position        =   0
      Scope           =   2
      TabIndex        =   11
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   600
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Style.BackgroundColor = Design_Palette.COLOR_Background
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ASSIGN_Scheduled_Tasks()
		  
		  
		  // Let check if patient exists
		  
		  For i As Integer = 0 To Assign_Tasks_ListBox.LastRowIndex
		    
		    
		    If Assign_Tasks_ListBox.CellTagAt(i,1) = True Then
		      
		      Var row As New DatabaseRow
		      
		      row.Column("task_type_id").IntegerValue = Assign_Tasks_ListBox.RowTagAt( i)
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
		      + Assign_Tasks_ListBox.CellTextAt( i, 0) + " - " _
		      + Machine_PopupMenu.RowValueAt( Machine_PopupMenu.SelectedRowIndex) + "/ to " _
		      + Staff_PopupMenu.RowValueAt( Staff_PopupMenu.SelectedRowIndex)
		      
		      Physics_Tasking.INSERT_Row("physics_tasking.tasks", Assign_scheduled_Task)
		      
		      
		    End If
		    
		  Next
		  App.last_database_update = DateTime.Now
		  POPULATE_Task_Group
		  Machine_PopupMenu.SelectedRowIndex = -1
		  Staff_PopupMenu.SelectedRowIndex = -1
		  Due_DatePicker.SelectedDate = DateTime.Now
		  Assign_Tasks_ListBox.RemoveAllRows
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ENABLE_Assign_Button()
		  Assign_Button.Enabled = False
		  
		  If Machine_PopupMenu.SelectedRowIndex = -1 Then Return
		  
		  If Staff_PopupMenu.SelectedRowIndex = -1 Then Return
		  
		  Var d As  DateTime = DateTime.Now
		  Var today As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  If Due_DatePicker.SelectedDate < Today Then Return
		  
		  
		  If Select_Checkbox.Indeterminate = False And Select_Checkbox.Value = False Then Return
		  
		  Assign_Button.Enabled = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Select_All()
		  Var initial_value As Boolean = Assign_Tasks_ListBox.CellTagAt( 0, 1)
		  
		  For row As Integer = 1 To Assign_Tasks_ListBox.LastRowIndex
		    
		    
		    If Assign_Tasks_ListBox.CellTagAt( row, 1) <> initial_value Then
		      
		      Select_Checkbox.Indeterminate = True
		      Assign_Button.Enabled = True
		      
		      Return
		      
		    End If
		    
		  Next
		  
		  Select_Checkbox.Indeterminate = False
		  Select_Checkbox.Value = initial_value
		  ENABLE_Assign_Button
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub POPULATE_Assign_Tasks_ListBox()
		  Assign_Tasks_ListBox.RemoveAllRows
		  
		  Var sql As String = "SELECT physics_tasking.task_types.task_type_id As task_type_id, " _
		  + "physics_tasking.task_types.name As task_type_name  " _
		  + "FROM physics_tasking.task_types " _
		  + "INNER JOIN physics_tasking.task_groups USING(task_group_id) " _
		  + "WHERE physics_tasking.task_types.is_schedulable = TRUE " _
		  + "AND  physics_tasking.task_types.task_group_id = " _
		  + Str(Task_Group_PopupMenu.RowTagAt(Task_Group_PopupMenu.SelectedRowIndex)) + " " _
		  + "ORDER BY physics_tasking.task_types.name;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  
		  Var active_buttons() As GroupButtonItem
		  active_buttons.Add(New GroupButtonItem("yes", "Yes", "success"))
		  active_buttons.Add(New GroupButtonItem("no", "NO", "secondary"))
		  
		  Var not_active_buttons() As GroupButtonItem
		  not_active_buttons.Add(New GroupButtonItem("yes", "Yes", "secondary"))
		  not_active_buttons.Add(New GroupButtonItem("no", "NO", "danger"))
		  
		  
		  While Not rs.AfterLastRow
		    
		    Assign_Tasks_ListBox.AddRow( rs.Column("task_type_name").StringValue.Trim.Uppercase )
		    Assign_Tasks_ListBox.RowTagAt( Assign_Tasks_ListBox.LastAddedRowIndex) = rs.Column("task_type_id").IntegerValue
		    
		    'row.Value("is_active") = New GroupButtonsCellRenderer(not_active_buttons)
		    
		    Assign_Tasks_ListBox.CellTextAt( Assign_Tasks_ListBox.LastAddedRowIndex, 1) = _
		    New GroupButtonsCellRenderer(not_active_buttons)
		    
		    Assign_Tasks_ListBox.CellTagAt( Assign_Tasks_ListBox.LastAddedRowIndex, 1) = False
		    
		    rs.MoveToNextRow
		    
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub POPULATE_Task_Group()
		  Task_Group_PopupMenu.RemoveAllRows
		  
		  
		  Var sql As String = "SELECT task_group_id, " _
		  + "physics_tasking.task_groups.name AS name " _
		  + "FROM physics_tasking.task_types " _
		  + "INNER JOIN task_groups USING (task_group_id) " _
		  + "WHERE is_schedulable = True " _
		  + "GROUP BY task_group_id; "
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  While Not rs.AfterLastRow
		    
		    Task_Group_PopupMenu.AddRow( rs.Column("name").StringValue.Trim.Uppercase )
		    Task_Group_PopupMenu.RowTagAt( Task_Group_PopupMenu.LastAddedRowIndex) = rs.Column("task_group_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Task_Group_PopupMenu
	#tag Event
		Sub Opening()
		  POPULATE_Task_Group
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  'Assign_Tasks_ListBox.DataSource = Self
		  'Assign_Tasks_ListBox.ReloadData
		  
		  POPULATE_Assign_Tasks_ListBox
		  
		  Select_Checkbox.Indeterminate = False
		  Select_Checkbox.Value = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Task_Group_Label
	#tag Event
		Sub Shown()
		  Me.Style.ForegroundColor = Color.White
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Assign_Tasks_ListBox
	#tag Event
		Sub Opening()
		  Me.ColumnCount = 2
		  Me.HasHeader = True
		  Me.HeaderAt(0) = "Task name"
		  Me.HeaderAt(1) = ""
		  Me.ColumnWidths = "80%, 20%"
		End Sub
	#tag EndEvent
	#tag Event
		Sub CustomCellAction(row As Integer, column As Integer, identifier As String, value As Variant)
		  If identifier = "GroupButtonPressed" Then
		    
		    Var is_selected As Boolean = Me.CellTagAt( row, column)
		    
		    
		    Var active_buttons() As GroupButtonItem
		    active_buttons.Add(New GroupButtonItem("yes", "Yes", "success"))
		    active_buttons.Add(New GroupButtonItem("no", "NO", "secondary"))
		    
		    Var not_active_buttons() As GroupButtonItem
		    not_active_buttons.Add(New GroupButtonItem("yes", "Yes", "secondary"))
		    not_active_buttons.Add(New GroupButtonItem("no", "NO", "danger"))
		    
		    
		    Select Case is_selected
		    Case False
		      
		      Assign_Tasks_ListBox.CellTextAt( row, column) = _
		      New GroupButtonsCellRenderer(active_buttons)
		      
		    Case True
		      Assign_Tasks_ListBox.CellTextAt( row, column) = _
		      New GroupButtonsCellRenderer(not_active_buttons)
		      
		      
		    End Select
		    
		    Me.CellTagAt( row, column) = Not is_selected
		    
		    Evaluate_Select_All
		    
		  End If
		  'Select Case value
		  'Case 1
		  '
		  'Me.CellT
		  '
		  '
		  '
		  '
		  'End Select
		  'db.ExecuteSQL(sql)
		  '
		  'App.last_database_update = DateTime.Now
		  'Latest_Update = App.last_database_update
		  '
		  'Users_ListBox.ReloadData
		  'Users_Label.Text = "Users = " + Users_ListBox.DataSource.RowCount.ToString
		  'End If
		  'End Try
		  '
		  'End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Assign_Button
	#tag Event
		Sub Pressed()
		  Assign_Tasks_WebDialog.Show
		  
		  Var count As Integer = 0
		  
		  For row As Integer = 0 To Assign_Tasks_ListBox.LastRowIndex
		    
		    If Assign_Tasks_ListBox.CellTagAt( row, 1) = True Then
		      
		      count = count + 1
		      
		    End If
		    
		  Next
		  
		  'If count = 1 Then
		  '
		  'Assign_Tasks_WebDialog.Assign_Label.Text = "You have assigned  " + count.ToString + " task "
		  '
		  'Else
		  '
		  'Assign_Tasks_WebDialog.Assign_Label.Text = "You have assigned  " + count.ToString + " tasks "
		  '
		  '
		  'End If
		  '
		  'Assign_Tasks_WebDialog.Assign_Label.Text = Assign_Tasks_WebDialog.Assign_Label.Text + " "_
		  '+ "to " + Staff_PopupMenu.RowValueAt( Staff_PopupMenu.SelectedRowIndex) + " " _
		  '+  "on " + Machine_PopupMenu.RowValueAt(  Machine_PopupMenu.SelectedRowIndex) + " " _
		  '+ "and due date of " + Due_DatePicker.SelectedDate.ToString( Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None) + "."
		  
		  Assign_Tasks_WebDialog.No_Of_Assigned_Tasks_Value_Label.Text = count.ToString
		  Assign_Tasks_WebDialog.Staff_Value_Label.Text = Staff_PopupMenu.RowValueAt( Staff_PopupMenu.SelectedRowIndex)
		  Assign_Tasks_WebDialog.Machine_Value_Label.Text = Machine_PopupMenu.RowValueAt(  Machine_PopupMenu.SelectedRowIndex)
		  Assign_Tasks_WebDialog.Due_Date_Value_Label.Text = Due_DatePicker.SelectedDate.ToString( Locale.Current, DateTime.FormatStyles.Long, DateTime.FormatStyles.None)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Select_Checkbox
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Color.White
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Var active_buttons() As GroupButtonItem
		  active_buttons.Add(New GroupButtonItem("yes", "Yes", "success"))
		  active_buttons.Add(New GroupButtonItem("no", "NO", "secondary"))
		  
		  Var not_active_buttons() As GroupButtonItem
		  not_active_buttons.Add(New GroupButtonItem("yes", "Yes", "secondary"))
		  not_active_buttons.Add(New GroupButtonItem("no", "NO", "danger"))
		  
		  
		  For row As Integer = 0 To Assign_Tasks_ListBox.LastRowIndex
		    
		    Select Case Me.Value
		    Case False
		      
		      Assign_Tasks_ListBox.CellTextAt( row, 1) = _
		      New GroupButtonsCellRenderer(not_active_buttons)
		      
		    Case True
		      Assign_Tasks_ListBox.CellTextAt( row, 1) = _
		      New GroupButtonsCellRenderer(active_buttons)
		      
		      
		    End Select
		    
		    Assign_Tasks_ListBox.CellTagAt( row, 1) = Me.Value
		    
		    
		    
		    
		  Next
		  
		  
		  Evaluate_Select_All
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
#tag Events Assign_Tasks_WebDialog
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Dismissed()
		  If Me.Assign Then
		    
		    ASSIGN_Scheduled_Tasks
		    
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
#tag EndViewBehavior
