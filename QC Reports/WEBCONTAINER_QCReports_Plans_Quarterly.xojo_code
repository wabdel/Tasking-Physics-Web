#tag WebContainerControl
Begin WebContainer WEBCONTAINER_QCReports_Plans_Quarterly Implements WebDataSource
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
   Begin WebButton Download_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Download"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   6
      Left            =   496
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
      Top             =   542
      Visible         =   True
      Width           =   247
      _mPanelIndex    =   -1
   End
   Begin WebListBox Plans_ListBox
      ColumnCount     =   3
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   436
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
      Top             =   85
      Visible         =   True
      Width           =   1200
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
   Begin WebLabel Plans_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   1120
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
      Text            =   "Plans = 0"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   542
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu PopupMenu_Year
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   147
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
      Top             =   20
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label_Year
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   39
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
      Text            =   "Year: "
      TextAlignment   =   3
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebRadioGroup RadioGroup_Quarters
      ControlID       =   ""
      Enabled         =   True
      Height          =   60
      Horizontal      =   True
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "Q1\nQ2\nQ3\nQ4"
      Left            =   629
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      SelectedIndex   =   0
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   350
      _mInitialValue  =   "Option 1\rOption 2"
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "mrn" // the name of the field in your database or data source
		  col.Heading = "MRN" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "70"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "full_name" // the name of the field in your database or data source
		  col.Heading = "Full Name" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "180"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "site" // the name of the field in your database or data source
		  col.Heading = "Site" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "75"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "plan_type" // the name of the field in your database or data source
		  col.Heading = "Plan Type" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "due_date" // the name of the field in your database or data source
		  col.Heading = "Due Date" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "205"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "planner_initials" // the name of the field in your database or data source
		  col.Heading = "Planner" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "70"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "physician_initials" // the name of the field in your database or data source
		  col.Heading = "Physician" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "80"
		  cols.Add(col)
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LOAD_RadioGroup_Quarters()
		  'RadioGroup_Quarters.RemoveAllRows
		  
		  'RadioGroup_Quarters.ItemAt(RadioGroup_Quarters.SelectedIndex).Tag
		  
		  
		  Var sql As String = "SELECT count(*) as c FROM physics_tasking.plans " _
		  + "WHERE YEAR(DATE(due_date)) = " + Str( PopupMenu_Year.RowTagAt( PopupMenu_Year.SelectedRowIndex)) + " " _
		  + "AND MONTH(DATE(due_date)) IN (1,2,3) " _
		  + "AND physics_tasking.plans.physician_id is NOT NULL " 
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column("c").IntegerValue > 0 Then
		    
		    RadioGroup_Quarters.ItemAt(0).Enabled = True
		    RadioGroup_Quarters.ItemAt(0).Value = True
		    
		  Else
		    
		    RadioGroup_Quarters.ItemAt(0).Enabled = False
		    RadioGroup_Quarters.ItemAt(0).Value = False
		    
		  End If
		  
		  sql = "SELECT count(*) as c FROM physics_tasking.plans " _
		  + "WHERE YEAR(DATE(due_date)) = " + Str( PopupMenu_Year.RowTagAt( PopupMenu_Year.SelectedRowIndex)) + " " _
		  + "AND MONTH(DATE(due_date)) IN (4,5,6) " _
		  + "AND physics_tasking.plans.physician_id is NOT NULL " 
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column("c").IntegerValue > 0 Then
		    
		    RadioGroup_Quarters.ItemAt(1).Enabled = True
		    RadioGroup_Quarters.ItemAt(1).Value = True
		    
		  Else
		    
		    RadioGroup_Quarters.ItemAt(1).Enabled = False
		    RadioGroup_Quarters.ItemAt(1).Value = False
		    
		  End If
		  
		  
		  sql = "SELECT count(*) as c FROM physics_tasking.plans " _
		  + "WHERE YEAR(DATE(due_date)) = " + Str( PopupMenu_Year.RowTagAt( PopupMenu_Year.SelectedRowIndex)) + " " _
		  + "AND MONTH(DATE(due_date)) IN (7,8,9) " _
		  + "AND physics_tasking.plans.physician_id is NOT NULL "
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column("c").IntegerValue > 0 Then
		    
		    RadioGroup_Quarters.ItemAt(2).Enabled = True
		    RadioGroup_Quarters.ItemAt(2).Value = True
		    
		  Else
		    
		    RadioGroup_Quarters.ItemAt(2).Enabled = False
		    RadioGroup_Quarters.ItemAt(2).Value = False
		    
		  End If
		  
		  
		  sql = "SELECT count(*) as c FROM physics_tasking.plans " _
		  + "WHERE YEAR(DATE(due_date)) = " + Str( PopupMenu_Year.RowTagAt( PopupMenu_Year.SelectedRowIndex)) + " " _
		  + "AND MONTH(DATE(due_date)) IN (10,11,12) " _
		  + "AND physics_tasking.plans.physician_id is NOT NULL " 
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column("c").IntegerValue > 0 Then
		    
		    RadioGroup_Quarters.ItemAt(3).Enabled = True
		    RadioGroup_Quarters.ItemAt(3).Value = True
		    
		  Else
		    
		    RadioGroup_Quarters.ItemAt(3).Enabled = False
		    RadioGroup_Quarters.ItemAt(3).Value = False
		    
		  End If
		  
		  'RadioGroup_Quarters.SelectedIndex = RadioGroup_Quarters.Count - 1
		  
		  Plans_ListBox.ReloadData
		  Latest_Update = DateTime.Now
		  
		  
		  'RadioGroup_Quarters.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  
		  Var sql As String = "SELECT COUNT(DISTINCT physics_tasking.patients.patient_id) as c " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "WHERE physics_tasking.plans.is_completed = 1 " _
		  + "AND MONTH(due_date)  IN (" +  RadioGroup_Quarters.SelectedItem.Tag + ") " _
		  + "AND YEAR(due_date) = " + PopupMenu_Year.RowTagAt( PopupMenu_Year.SelectedRowIndex) + "; " 
		  
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  '// Part of the WebDataSource interface.
		  
		  Var rows() As WebListboxRowData
		  
		  Var sql As String = "SELECT physics_tasking.plans.plan_id AS plan_id, " _
		  + "physics_tasking.patients.mrn AS mrn, " _
		  + "physics_tasking.patients.first_name AS first_name, " _
		  + "physics_tasking.patients.family_name AS family_name, " _
		  + "physics_tasking.plan_types.name AS plan_type_name, " _
		  + "physics_tasking.sites.name As site, " _
		  + "physics_tasking.sites.is_uppercase AS is_uppercase, " _
		  + "physics_tasking.plans.due_date AS due_date, " _
		  + "(SELECT initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.user_id = physics_tasking.users.user_id) As planner_initials, " _
		  + "(SELECT initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.physician_id = physics_tasking.users.user_id) As physician_initials " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "WHERE physics_tasking.plans.is_completed = 1 " _
		  + "AND MONTH(due_date)  IN (" +  RadioGroup_Quarters.SelectedItem.Tag + ") " _
		  + "AND YEAR(due_date) = " + PopupMenu_Year.RowTagAt( PopupMenu_Year.SelectedRowIndex) + " " _
		  + "ORDER BY physics_tasking.plans.due_date ASC"
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("plan_id").IntegerValue
		    row.tag = rs.Column("plan_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, rs.Column("mrn").StringValue.Trim)
		    row.Value("mrn") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    rs.Column("first_name").StringValue.Trim.Titlecase + " " _
		    + rs.Column("family_name").StringValue.Trim.Uppercase)
		    row.Value("full_name") = cellRenderer
		    
		    If rs.Column("is_uppercase").BooleanValue Then
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("site").StringValue.Trim.Uppercase)
		      
		    Else
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("site").StringValue.Trim.Titlecase)
		      
		    End If
		    
		    row.Value("site") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("plan_type_name").StringValue.Trim)
		    row.Value("plan_type") = cellRenderer
		    
		    Var due_date As DateTime = rs.Column("due_date").DateTimeValue
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    due_date.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    
		    row.Value("due_date") = cellRenderer
		    
		    
		    row.Value("planner_initials") = rs.Column("planner_initials").StringValue.Trim.Uppercase
		    
		    
		    If rs.Column("physician_initials").Value = Nil Then
		      cellRenderer = New WebListBoxStyleRenderer(s, "NULL")
		      
		    Else
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("physician_initials").StringValue.Trim)
		      
		      
		    End If
		    row.Value("physician_initials") = cellRenderer
		    
		    
		    rows.Add(row)
		    
		    rs.MoveToNextRow
		  Wend
		  rs.Close
		  
		  Plans_Label.Text = "Plans = " + Plans_ListBox.DataSource.RowCount.ToString
		  
		  Return rows
		  
		  
		  //------------
		  
		  
		  
		  
		  
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
		  
		  // Part of the WebDataSource interface.
		  
		  
		  Var keys() As Integer 
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  Var sql As String = "SELECT physics_tasking.plans.plan_id AS plan_id " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "WHERE physics_tasking.plans.is_completed = 1 " _
		  + "AND MONTH(due_date)  IN (" +  RadioGroup_Quarters.SelectedItem.Tag + ") " _
		  + "AND YEAR(due_date) = " + PopupMenu_Year.RowTagAt( PopupMenu_Year.SelectedRowIndex) + " " _
		  + "ORDER BY physics_tasking.plans.due_date ASC"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("plan_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys
		  // Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Latest_Update As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Patient_List_File As WebFile
	#tag EndProperty


#tag EndWindowCode

#tag Events Download_Button
	#tag Event
		Sub Pressed()
		  // The webfile *must* be a Property somewhere In your project
		  // so it does not go out of scope before the browser has a chance
		  // to request it.
		  
		  Patient_List_File = New WebFile
		  Patient_List_File.MimeType = "text/plain"
		  Patient_List_File.ForceDownload = True
		  Patient_List_File.FileName = RadioGroup_Quarters.SelectedItem.Caption + "_" _
		  + PopupMenu_Year.SelectedRowText _
		  + "_Plans_due_date.csv"
		  
		  Patient_List_File.Data = "mrn,Full Name,Site, Plan, Due date, Physician"
		  
		  Var sql As String = "SELECT physics_tasking.plans.plan_id AS plan_id, " _
		  + "physics_tasking.patients.mrn AS mrn, " _
		  + "physics_tasking.patients.first_name AS first_name, " _
		  + "physics_tasking.patients.family_name AS family_name, " _
		  + "physics_tasking.plan_types.name AS plan_type_name, " _
		  + "physics_tasking.sites.name As site, " _
		  + "physics_tasking.sites.is_uppercase AS is_uppercase, " _
		  + "physics_tasking.plans.due_date AS due_date, " _
		  + "(SELECT initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.user_id = physics_tasking.users.user_id) As planner_initials, " _
		  + "(SELECT initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.physician_id = physics_tasking.users.user_id) As physician_initials " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "WHERE physics_tasking.plans.is_completed = 1 " _
		  + "AND MONTH(due_date)  IN (" +  RadioGroup_Quarters.SelectedItem.Tag + ") " _
		  + "AND YEAR(due_date) = " + PopupMenu_Year.RowTagAt( PopupMenu_Year.SelectedRowIndex) + " " _
		  + "ORDER BY physics_tasking.plans.due_date ASC"
		  
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Var s As String = rs.Column("mrn").StringValue + "," _
		    
		    s = s + rs.Column("first_name").StringValue.Trim.Titlecase + " " _
		    + rs.Column("family_name").StringValue.Trim.Uppercase + ","
		    
		    If rs.Column("is_uppercase").BooleanValue Then
		      
		      s = s + rs.Column("site").StringValue.Trim.Uppercase + ","
		      
		    Else
		      
		      s = s + rs.Column("site").StringValue.Trim.Titlecase + ","
		      
		    End If
		    
		    s = s + rs.Column("plan_type_name").StringValue.Trim + ","
		    
		    Var due_date As DateTime = rs.Column("due_date").DateTimeValue
		    s = s + due_date.ToString(Locale.Current, DateTime.FormatStyles.Short, DateTime.FormatStyles.None) + ","
		    
		    
		    s = s + rs.Column("physician_initials").StringValue.Trim 
		    
		    
		    Patient_List_File.Data = Patient_List_File.Data.Operator_Add(Chr(13))
		    Patient_List_File.Data = Patient_List_File.Data.Operator_Add(s)
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  // Showing the URL prompts the browser to download it
		  Session.GoToURL(Patient_List_File.URL)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Plans_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  'Me.DataSource = Self
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoublePressed(row As Integer, column As Integer)
		  If Session.Logged_in_User Is Nil Then Return
		  
		  If row > Me.RowCount - 1 Then Return
		  
		  Select Case column
		    
		  Case 0 To 4
		    
		    Var theDialog As New Modify_Plan_WebDialog
		    theDialog.plan_id = Me.RowTagAt( row)
		    theDialog.Show
		    
		  End Select
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events REFRESH_Timer
	#tag Event
		Sub Run()
		  
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    If PopupMenu_Year.SelectedRowIndex < 0 Then Return
		    
		    Plans_ListBox.ReloadData
		    Plans_Label.Text = "Plans = " + Plans_ListBox.DataSource.RowCount.ToString
		    Latest_UPDATE = App.last_database_update
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Plans_Label
	#tag Event
		Sub Opening()
		  Me.Style = Session.WEBSTYLE_Label
		  If PopupMenu_Year.SelectedRowIndex > -1 Then 
		    
		    Me.Text = "Patients = " + Self.RowCount.ToString
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu_Year
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Var d As DateTime = DateTime.Now
		  
		  Var y As Integer
		  
		  If d.Month < 4 Then
		    y = d.Year - 1
		  Else
		    
		    y = d.Year
		    
		  End If
		  
		  Var sql As String = "SELECT YEAR(DATE(due_date)) as y FROM physics_tasking.plans " _
		  + "WHERE YEAR(DATE(due_date)) <= " + y.ToString + " " _
		  + "AND physics_tasking.plans.physician_id Is NOT NULL " _
		  + "GROUP BY y " _
		  + "ORDER BY y DESC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount < 1 Then Return
		  
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("y").IntegerValue.ToString)
		    Me.RowTagAt( Me.LastRowIndex) = rs.Column("y").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		End Sub
	#tag EndEvent
	#tag Event
		Sub Shown()
		  If Me.RowCount > 0 Then Me.SelectedRowIndex = 0
		  
		  Plans_ListBox.DataSource = Self
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  LOAD_RadioGroup_Quarters
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label_Year
	#tag Event
		Sub Opening()
		  Me.Style = Session.WEBSTYLE_Label
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RadioGroup_Quarters
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Me.Add("Q1")
		  Me.ItemAt(Me.Count -1).Tag = "1,2,3"
		  Me.ItemAt(Me.Count -1).Enabled = False
		  
		  Me.Add("Q2")
		  Me.ItemAt(Me.Count -1).Tag = "4,5,6"
		  Me.ItemAt(Me.Count -1).Enabled = False
		  
		  Me.Add("Q3")
		  Me.ItemAt(Me.Count -1).Tag = "7,8,9"
		  Me.ItemAt(Me.Count -1).Enabled = False
		  
		  Me.Add("Q4")
		  Me.ItemAt(Me.Count -1).Tag = "10,11,12"
		  Me.ItemAt(Me.Count -1).Enabled = False
		  
		  
		  Me.Style = Session.WEBSTYLE_Label
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(button As WebRadioButton)
		  Plans_ListBox.ReloadData
		  Latest_Update = DateTime.Now
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
