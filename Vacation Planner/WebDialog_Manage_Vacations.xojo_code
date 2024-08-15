#tag WebPage
Begin WebDialog WebDialog_Manage_Vacations Implements WebDataSource
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   496
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
   Width           =   1116
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebPopupMenu PopupMenu_Users_List
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   146
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
      Top             =   109
      Visible         =   True
      Width           =   365
      _mPanelIndex    =   -1
   End
   Begin WebButton Button_Close
      AllowAutoDisable=   False
      Cancel          =   True
      Caption         =   "Close"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   996
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
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   438
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton Button_Book_Vacation
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Book"
      ControlID       =   ""
      Default         =   True
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   2
      Left            =   278
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
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   438
      Visible         =   True
      Width           =   100
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
      Text            =   "Staff :"
      TextAlignment   =   3
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   109
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebDatePicker DatePicker_Start
      AllowKeyboardEntry=   True
      ControlID       =   ""
      EarliestDate    =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LatestDate      =   ""
      Left            =   146
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
      Top             =   255
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebDatePicker DatePicker_End
      AllowKeyboardEntry=   True
      ControlID       =   ""
      EarliestDate    =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LatestDate      =   ""
      Left            =   361
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   255
      Visible         =   True
      Width           =   150
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
      Indicator       =   0
      Italic          =   False
      Left            =   146
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
      Text            =   "Start date"
      TextAlignment   =   2
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   209
      Underline       =   False
      Visible         =   True
      Width           =   150
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
      Left            =   361
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
      Text            =   "End Date"
      TextAlignment   =   2
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   209
      Underline       =   False
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label2
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   24.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   386
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
      TabIndex        =   8
      TabStop         =   True
      Text            =   "Manage vacation"
      TextAlignment   =   2
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   344
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu PopupMenu_Vacations_Type
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   146
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
      TabIndex        =   9
      TabStop         =   True
      Tooltip         =   ""
      Top             =   155
      Visible         =   True
      Width           =   365
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   3
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
      TabIndex        =   10
      TabStop         =   True
      Text            =   "Type :"
      TextAlignment   =   3
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   155
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebTextArea TextArea1
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      Height          =   87
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   146
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   11
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   343
      Visible         =   True
      Width           =   365
      _mPanelIndex    =   -1
   End
   Begin WebListBox ListBox_Vacations
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   364
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   590
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
      TabIndex        =   12
      TabStop         =   True
      Tooltip         =   ""
      Top             =   66
      Visible         =   True
      Width           =   506
      _mPanelIndex    =   -1
   End
   Begin WebTimer Update_Timer
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
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.ModalBackgroundColor = "#" +Design_Palette.COLOR_Background.ToString.Right(6)
		  
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
		  col.DatabaseColumnName = "vacation_type_name" // the name of the field in your database or data source
		  col.Heading = "Type" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "70"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "start_date" // the name of the field in your database or data source
		  col.Heading = "Start" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "end_date" // the name of the field in your database or data source
		  col.Heading = "End" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "days_diff" // the name of the field in your database or data source
		  col.Heading = "Days" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "50"
		  cols.Add(col)
		  
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "cancel" // the name of the field in your database or data source
		  col.Heading = "Cancel" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  Return cols// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ENABLE_Book_Button()
		  Button_Book_Vacation.Enabled = False
		  
		  If PopupMenu_Vacations_Type.SelectedRowIndex < 0  Or _
		  PopupMenu_Users_List.SelectedRowIndex < 0 Then Return
		  
		  Button_Book_Vacation.Enabled = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(rowCount As Integer, rowOffset As Integer, sortColumns As String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  
		  Var rows() As WebListboxRowData
		  
		  If PopupMenu_Users_List.SelectedRowIndex < 0 Then Return rows
		  Var sql As String = "SELECT vacation_id, vacation_type_name, start_date, " _ 
		  + "end_date, DATEDIFF( end_date, start_date) AS days_diff " _
		  + "FROM physics_tasking.vacations " _
		  + "INNER JOIN physics_tasking.vacation_types USING(vacation_type_id) " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "WHERE user_id = " + Str(PopupMenu_Users_List.RowTagAt( PopupMenu_Users_List.SelectedRowIndex)) + " "  
		  
		  If SortColumns = "" Then
		    
		    sql = sql + "ORDER BY start_date DESC "
		    
		  Else
		    
		    sql = sql + "ORDER BY " + SortColumns
		    
		  End If
		  
		  sql = sql + " LIMIT " + RowCount.ToString + " OFFSET " + RowOffset.ToString
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  Var actionButtons() As GroupButtonItem
		  actionButtons.Add(New GroupButtonItem("canel", "Cancel"))
		  
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("vacation_id").IntegerValue
		    row.tag = rs.Column("vacation_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, _
		    rs.Column("vacation_type_name").StringValue.Trim.Titlecase)
		    row.Value("vacation_type_name") = cellRenderer
		    
		    
		    
		    
		    Var d As DateTime = rs.Column("start_date").DateValue
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    d.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    
		    row.Value("start_date") = cellRenderer
		    
		    d = rs.Column("end_date").DateValue
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    d.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    
		    row.Value("end_date") = cellRenderer
		    
		    
		    
		    
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    rs.Column("days_diff").IntegerValue.ToString)
		    row.Value("days_diff") = cellRenderer
		    
		    
		    row.Value("cancel") = New GroupButtonsCellRenderer( actionButtons)
		    
		    rows.Add(row)
		    
		    rs.MoveToNextRow
		  Wend
		  rs.Close
		  
		  Return rows
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Latest_Update As DateTime
	#tag EndProperty


#tag EndWindowCode

#tag Events PopupMenu_Users_List
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  If Me.SelectedRowIndex = -1 Then Return
		  ListBox_Vacations.ReloadData
		  ENABLE_Book_Button
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_POPUPMENU
		  Me.RemoveAllRows
		  
		  Var sql As String = "SELECT user_id, first_name, family_name FROM physics_tasking.users " _
		  + "WHERE category_id IN (2,3) " _
		  + "AND is_retired = FALSE " _
		  + "ORDER BY first_name;"
		  Var rs As Rowset = Physics_Tasking.SELECT_Statement(sql)
		  
		  If rs.RowCount = 0 Then Return
		  
		  While Not rs.AfterLastRow
		    
		    
		    Me.AddRow( rs.Column("first_name").StringValue.Trim.Titlecase + " " _
		    +  rs.Column("family_name").StringValue.Trim.Uppercase)
		    
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("user_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  If Session.Logged_in_User.id <> 1 Then
		    
		    Me.SelectRowWithTag(Session.Logged_in_User.id)
		    Me.Enabled = False
		    
		  Else
		    
		    Me.Enabled = True
		    
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button_Close
	#tag Event
		Sub Pressed()
		  Self.Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_BUTTON_Unpressed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button_Book_Vacation
	#tag Event
		Sub Pressed()
		  Var d As DateTime = DatePicker_Start.SelectedDate
		  
		  While d <= DatePicker_End.SelectedDate
		    
		    
		    Var sql As String = "SELECT vacation_id, start_date, end_date, vacation_type_name " _
		    + "FROM physics_tasking.vacations " _
		    + "INNER JOIN physics_tasking.vacation_types USING(vacation_type_id) " _
		    + "WHERE user_id = " + Str(PopupMenu_Users_List.RowTagAt( PopupMenu_Users_List.SelectedRowIndex)) + " " _
		    + "AND start_date <= '" + d.SQLDate + "' " _
		    + "AND end_date >= '" + d.SQLDate + "' ;" 
		    
		    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		    
		    If rs.RowCount = 1 Then
		      
		      
		      Return
		    End If
		    
		    
		    d = d.AddInterval( 0, 0, 1)
		    
		    
		  Wend
		  
		  Var row As New DatabaseRow
		  
		  
		  row.Column("user_id").IntegerValue = _
		  PopupMenu_Users_List.RowTagAt( PopupMenu_Users_List.SelectedRowIndex)
		  
		  row.Column("vacation_type_id").IntegerValue = _
		  PopupMenu_Vacations_Type.RowTagAt( PopupMenu_Vacations_Type.SelectedRowIndex)
		  
		  row.Column("start_date").DateTimeValue = DatePicker_Start.SelectedDate
		  row.Column("end_date").DateTimeValue = DatePicker_End.SelectedDate
		  
		  
		  Physics_Tasking.INSERT_Row( "vacations", row)
		  
		  Self.close
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_BUTTON_Unpressed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label1
	#tag Event
		Sub Opening(index as Integer)
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DatePicker_Start
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		  Me.MinimumDate = DateTime.Now
		  Me.SelectedDate = DateTime.Now
		End Sub
	#tag EndEvent
	#tag Event
		Sub DateChanged(selectedDate As DateTime)
		  DatePicker_End.MinimumDate = Me.SelectedDate
		  
		  If DatePicker_End.SelectedDate < Me.SelectedDate Then
		    
		    DatePicker_End.SelectedDate = Me.SelectedDate
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DatePicker_End
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		  Me.MinimumDate = DateTime.Now
		  me.SelectedDate = DateTime.Now
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label2
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Primary
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu_Vacations_Type
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  If Me.SelectedRowIndex = -1 Then Return
		  
		  ENABLE_Book_Button
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_POPUPMENU
		  Me.RemoveAllRows
		  
		  Var sql As String = "SELECT * FROM physics_tasking.vacation_types " _
		  + "ORDER BY vacation_type_name"
		  Var rs As Rowset = Physics_Tasking.SELECT_Statement(sql)
		  
		  If rs.RowCount = 0 Then Return
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("vacation_type_name").StringValue.Trim.Titlecase)
		    
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("vacation_type_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ListBox_Vacations
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Surface_Secondary
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = Self
		  Me.ReloadData
		  Latest_Update = DateTime.Now
		End Sub
	#tag EndEvent
	#tag Event
		Sub CustomCellAction(row As Integer, column As Integer, identifier As String, value As Variant)
		  If identifier = "GroupButtonPressed" Then
		    
		    
		    Var sql As String = "DELETE FROM physics_tasking.vacations " _
		    + "WHERE vacation_id = " + Str(Me.RowTagAt( row)) +  ";"
		    
		    Physics_Tasking.EXECUTE_Statement(sql)
		    ListBox_Vacations.ReloadData
		    App.last_database_update = DateTime.Now
		    Latest_Update = App.last_database_update
		    
		    
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Update_Timer
	#tag Event
		Sub Run()
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    ListBox_Vacations.ReloadData
		    Latest_Update = App.last_database_update
		    
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
#tag EndViewBehavior
