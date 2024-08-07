#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Search_Plans Implements WebDataSource
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
   Begin WebTimer REFRESH_Timer
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   0
      LockedInPosition=   False
      PanelIndex      =   0
      Period          =   1000
      RunMode         =   0
      Scope           =   2
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu Sites_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   128
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
      Top             =   20
      Visible         =   True
      Width           =   272
      _mPanelIndex    =   -1
   End
   Begin WebLabel Sitess_Label
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
      TabIndex        =   1
      TabStop         =   True
      Text            =   "Site :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu Plan_Type_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   128
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
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   66
      Visible         =   True
      Width           =   272
      _mPanelIndex    =   -1
   End
   Begin WebLabel Plan_Type_Label
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
      TabIndex        =   3
      TabStop         =   True
      Text            =   "Plan type :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   66
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebListBox Plans_ListBox
      ColumnCount     =   0
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   608
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
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   158
      Visible         =   True
      Width           =   1180
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
      Scope           =   2
      TabIndex        =   5
      TabStop         =   True
      Text            =   "Plans = 0"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   112
      Underline       =   False
      Visible         =   True
      Width           =   146
      _mPanelIndex    =   -1
   End
   Begin WebButton Save_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Save List"
      ControlID       =   ""
      Default         =   True
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   859
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
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   43
      Visible         =   True
      Width           =   100
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
		  col.Width = "80"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "full_name" // the name of the field in your database or data source
		  col.Heading = "Full Name" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "200"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "site" // the name of the field in your database or data source
		  col.Heading = "Site" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "plan_type" // the name of the field in your database or data source
		  col.Heading = "Plan Type" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "280"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "completion_date" // the name of the field in your database or data source
		  col.Heading = "Completed On" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "initials" // the name of the field in your database or data source
		  col.Heading = "Planner" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "physician_initials" // the name of the field in your database or data source
		  col.Heading = "Physician" // the name that appears above the column
		  col.Sortable = True // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FileDownloaded(file As WebFile)
		  'If file = TextFile Then
		  'TextFile = Nil
		  'MessageBox("The Browser has initiated the download.")
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub POPULATE_Plan_Types_POPUPMENU()
		  Plan_Type_PopupMenu.RemoveAllRows
		  
		  Select Case Sites_PopupMenu.RowTagAt( Sites_PopupMenu.SelectedRowIndex)
		  Case -1 
		    Return
		  Case 0 
		    
		    Plan_Type_PopupMenu.Visible = False
		    Plan_Type_PopupMenu.Enabled = False
		    Plan_Type_Label.Visible = False
		    Plan_Type_Label.Enabled = False
		    
		    
		  Else
		    
		    
		    Plan_Type_PopupMenu.Visible = True
		    Plan_Type_PopupMenu.Enabled = True
		    Plan_Type_Label.Visible = True
		    Plan_Type_Label.Enabled = True
		    
		    Plan_Type_PopupMenu.AddRow("All")
		    Plan_Type_PopupMenu.RowTagAt( Plan_Type_PopupMenu.LastAddedRowIndex) = 0
		    
		    Var sql as String = "SELECT plan_type_id, site_id, name " _
		    + "FROM physics_tasking.plan_types " _
		    + "WHERE site_id = " + Str(Sites_PopupMenu.RowTagAt( Sites_PopupMenu.SelectedRowIndex)) + " " _
		    + "ORDER BY name;"
		    
		    Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		    
		    
		    While Not rs.AfterLastRow
		      
		      Plan_Type_PopupMenu.AddRow(rs.Column("name").StringValue.Trim)
		      Plan_Type_PopupMenu.RowTagAt( Plan_Type_PopupMenu.LastAddedRowIndex) = _
		      rs.Column("plan_type_id").IntegerValue
		      
		      
		      
		      rs.MoveToNextRow
		      
		    Wend
		    
		    
		    
		    Plan_Type_PopupMenu.SelectedRowIndex = 0
		    
		  End Select
		  
		  Plans_ListBox.ReloadData
		  Plans_Label.Text = "Plans = " + Self.RowCount.ToString
		  If Self.RowCount > 0 Then
		    
		    Save_Button.Enabled = True
		  Else
		    Save_Button.Enabled = False
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  If Sites_PopupMenu.SelectedRowIndex = -1 Then Return 0
		  
		  
		  Var sql As String = "SELECT COUNT(*) as c  " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  
		  If Sites_PopupMenu.RowTagAt( Sites_PopupMenu.SelectedRowIndex) = 0 Then
		    
		    sql = sql + "WHERE is_completed = TRUE;" 
		    
		  ElseIf Plan_Type_PopupMenu.RowTagAt( Plan_Type_PopupMenu.SelectedRowIndex) = 0 Then
		    
		    sql = sql + "WHERE is_completed = TRUE " _
		    + "AND site_id = " +Str(Sites_PopupMenu.RowTagAt( Sites_PopupMenu.SelectedRowIndex)) + "; " _
		    
		  Else
		    
		    sql = sql + "WHERE is_completed = TRUE " _
		    + "AND plan_type_id = " +Str(Plan_Type_PopupMenu.RowTagAt( Plan_Type_PopupMenu.SelectedRowIndex)) + "; " _
		    
		  End If
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  Return rs.Column("c").IntegerValue
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  Var rows() As WebListboxRowData
		  
		  If Sites_PopupMenu.SelectedRowIndex = -1 Then Return rows
		  
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id, " _
		  + "physics_tasking.patients.mrn As mrn, " _
		  + "physics_tasking.patients.first_name As first_name, " _
		  + "physics_tasking.patients.family_name As family_name, " _
		  + "physics_tasking.plan_types.name As plan_type_name, " _
		  + "physics_tasking.sites.name As site, " _
		  + "physics_tasking.sites.is_uppercase As is_uppercase, " _
		  + "DATE(physics_tasking.plans.completion_date) as completion_date, " _
		  + "physics_tasking.users.first_name As u_first_name, " _
		  + "physics_tasking.users.family_name As u_family_name, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "physics_tasking.plans.is_replan as is_replan, " _
		  + "(" _
		  + "SELECT physics_tasking.users.initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.physician_id = physics_tasking.users.user_id" _
		  +") As physician_initials " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "INNER JOIN physics_tasking.users USING (user_id) "
		  
		  If Sites_PopupMenu.RowTagAt( Sites_PopupMenu.SelectedRowIndex) = 0 Then
		    
		    sql = sql + "WHERE is_completed = TRUE " 
		    
		  ElseIf Plan_Type_PopupMenu.RowTagAt( Plan_Type_PopupMenu.SelectedRowIndex) = 0 Then
		    
		    sql = sql + "WHERE is_completed = TRUE " _
		    + "AND site_id = " +Str(Sites_PopupMenu.RowTagAt( Sites_PopupMenu.SelectedRowIndex)) + " " _
		    
		  Else
		    
		    sql = sql + "WHERE is_completed = TRUE " _
		    + "AND plan_type_id = " +Str(Plan_Type_PopupMenu.RowTagAt( Plan_Type_PopupMenu.SelectedRowIndex)) + " " _
		    
		  End If
		  
		  
		  
		  If SortColumns = "" Then
		    sql = sql + "ORDER BY DATE(physics_tasking.plans.completion_date) DESC, physics_tasking.patients.mrn ASC;"
		    
		  Else
		    
		    sql = sql + "ORDER BY " + SortColumns + " "
		    
		    
		  End If
		  
		  sql = sql + " LIMIT " + RowCount.ToString + " OFFSET " + RowOffset.ToString
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("plan_id").IntegerValue
		    
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
		    
		    If rs.Column("is_replan").BooleanValue Then
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("plan_type_name").StringValue.Trim + " (R)") 
		      
		    Else
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("plan_type_name").StringValue.Trim) 
		      
		    End If
		    
		    row.Value("plan_type") = cellRenderer
		    
		    Var completion_date As DateTime = rs.Column("completion_date").DateValue
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    completion_date.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    
		    row.Value("completion_date") = cellRenderer
		    
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("initials").StringValue.Trim.Uppercase)
		    row.Value("initials") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("physician_initials").StringValue.Trim.Uppercase)
		    row.Value("physician_initials") = cellRenderer
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

#tag Events REFRESH_Timer
	#tag Event
		Sub Run()
		  
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    Latest_UPDATE = App.last_database_update
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Sites_PopupMenu
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_POPUPMENU_Emply
		  
		  Me.RemoveAllRows
		  
		  Me.AddRow("All")
		  Me.RowTagAt( Me.LastAddedRowIndex) = 0
		  
		  Var sql as String = "SELECT site_id, name, is_uppercase " _
		  + "FROM physics_tasking.sites " _
		  + "ORDER BY name;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    If rs.Column("is_uppercase").BooleanValue Then
		      
		      Me.AddRow( rs.Column("name").StringValue.Trim.Uppercase)
		      
		    Else
		      
		      Me.AddRow( rs.Column("name").StringValue.Trim.Titlecase)
		      
		    End If
		    
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("site_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  'Me.SelectedRowIndex = 0
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  Me.Style = Design_Palette.STYLE_POPUPMENU_Selected
		  POPULATE_Plan_Types_POPUPMENU
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Sitess_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Plan_Type_PopupMenu
	#tag Event
		Sub Opening()
		  Me.Visible = False
		  Me.Enabled = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  Plans_ListBox.ReloadData
		  Plans_Label.Text = "Plans = " + Self.RowCount.ToString
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Plan_Type_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		  Me.Visible = False
		  Me.Enabled = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Plans_ListBox
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Surface_Secondary
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = Self
		  REFRESH_Timer.RunMode = WebTimer.RunModes.Multiple
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Plans_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_On_Background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Save_Button
	#tag Event
		Sub Pressed()
		  
		  
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id, " _
		  + "physics_tasking.patients.mrn As mrn, " _
		  + "physics_tasking.patients.first_name As first_name, " _
		  + "physics_tasking.patients.family_name As family_name, " _
		  + "physics_tasking.plan_types.name As plan_type_name, " _
		  + "physics_tasking.sites.name As site, " _
		  + "physics_tasking.sites.is_uppercase As is_uppercase, " _
		  + "DATE(physics_tasking.plans.completion_date) as completion_date, " _
		  + "physics_tasking.users.first_name As u_first_name, " _
		  + "physics_tasking.users.family_name As u_family_name, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "physics_tasking.plans.is_replan as is_replan, " _
		  + "(" _
		  + "SELECT physics_tasking.users.initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.physician_id = physics_tasking.users.user_id" _
		  +") As physician_initials " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "INNER JOIN physics_tasking.users USING (user_id) "
		  
		  
		  If Sites_PopupMenu.RowTagAt( Sites_PopupMenu.SelectedRowIndex) = 0 Then
		    
		    sql = sql + "WHERE is_completed = TRUE " 
		    
		  ElseIf Plan_Type_PopupMenu.RowTagAt( Plan_Type_PopupMenu.SelectedRowIndex) = 0 Then
		    
		    sql = sql + "WHERE is_completed = TRUE " _
		    + "AND site_id = " +Str(Sites_PopupMenu.RowTagAt( Sites_PopupMenu.SelectedRowIndex)) + " " _
		    
		  Else
		    
		    sql = sql + "WHERE is_completed = TRUE " _
		    + "AND plan_type_id = " +Str(Plan_Type_PopupMenu.RowTagAt( Plan_Type_PopupMenu.SelectedRowIndex)) + " " _
		    
		  End If
		  
		  sql = sql + "ORDER BY DATE(physics_tasking.plans.completion_date) DESC, physics_tasking.patients.mrn ASC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  '
		  'If TextFile = Nil Then
		  '// Create a text file to download
		  Session.WebFile_Download = New WebFile
		  Session.WebFile_Download.MimeType = "text/plain"
		  'TextFile.ForceDownload = True
		  Session.WebFile_Download.FileName = "TextFile.txt"
		  
		  'Var d As DateTime = Session.ClientTime.Now
		  Var File_data_List As String
		  
		  While Not rs.AfterLastRow
		    
		    File_data_List = File_data_List + rs.Column("mrn").StringValue + ", " _
		    + rs.Column("first_name").StringValue + ", " _
		    + rs.Column("family_name").StringValue + ", " _
		    + rs.Column("site").StringValue + ", " _
		    + rs.Column("plan_type_name").StringValue + EndOfLine
		    
		    
		    
		    rs.MoveToNextRow
		  Wend
		  
		  Session.WebFile_Download.Data = File_data_List
		  
		  Session.WebFile_Download.Filename = "Plans_List.txt"
		  // The WebFile.Downloaded event handler is called when the browser
		  // requests the file for downloading. This code maps that event handler
		  // to the FileDownloaded method on this web page.
		  'AddHandler TextFile.Downloaded, AddressOf FileDownloaded
		  'End If
		  
		  'Session.GoToURL(TextFile.URL)
		  
		  Session.WebFile_Download.ForceDownload = True
		  
		  Call Session.WebFile_Download.Download
		  
		  Session.WebFile_Download.ForceDownload = False
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_BUTTON_Unpressed
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
