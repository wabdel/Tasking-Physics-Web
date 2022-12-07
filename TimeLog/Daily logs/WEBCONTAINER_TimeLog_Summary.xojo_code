#tag WebContainerControl
Begin WebContainer WEBCONTAINER_TimeLog_Summary Implements WebDataSource
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
   Begin WebButton Add_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add entry"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   6
      Left            =   555
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   542
      Visible         =   True
      Width           =   130
      _mPanelIndex    =   -1
   End
   Begin WebListBox TimeLog_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   True
      Height          =   496
      HighlightSortedColumn=   True
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
      NoRowsMessage   =   ""
      ProcessingMessage=   "Loading data"
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
      Width           =   1200
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
   Begin WebLabel Note_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   15.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   True
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
      Text            =   "Double click an entry to edit."
      TextAlignment   =   0
      TextColor       =   &cFF7E7900
      Tooltip         =   ""
      Top             =   524
      Underline       =   False
      Visible         =   True
      Width           =   397
      _mPanelIndex    =   -1
   End
   Begin WebLabel Minutes_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   931
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   3
      Text            =   "Accumilated time = 0 min."
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   524
      Underline       =   False
      Visible         =   True
      Width           =   289
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
		  col.DatabaseColumnName = "date" // the name of the field in your database or data source
		  col.Heading = "Date" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "time_in" // the name of the field in your database or data source
		  col.Heading = "Time In" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "150"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "time_out" // the name of the field in your database or data source
		  col.Heading = "Time Out" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "150"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "work_hrs" // the name of the field in your database or data source
		  col.Heading = "Work Hours" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "150"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "add_subtract" // the name of the field in your database or data source
		  col.Heading = "(+)/(-) hrs" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "150"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "notes" // the name of the field in your database or data source
		  col.Heading = "Notes" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "400"
		  cols.Add(col)
		  
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  // Part of the WebDataSource interface.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  Var sql As String = "SELECT COUNT(*) as c FROM physics_tasking.timelogs " _
		  + "WHERE user_id = " + Session.Logged_in_User.id.ToString + ";"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  Var rows() As WebListboxRowData
		  Var sql As String = "SELECT * FROM physics_tasking.timelogs " _
		  + "WHERE user_id = " + Session.Logged_in_User.id.ToString + " " _
		  + "ORDER BY physics_tasking.timelogs.time_in DESC "
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("timelog_id").IntegerValue
		    row.Tag = rs.Column("timelog_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer()
		    Var cellRenderer_status As New StatusCellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s , _
		    rs.Column("time_in").DateTimeValue.ToString( Locale.Current, _
		    DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    row.Value("date") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    rs.Column("time_in").DateTimeValue.ToString( Locale.Current, _
		    DateTime.FormatStyles.None, DateTime.FormatStyles.Short))
		    row.Value("time_in") = cellRenderer
		    
		    If Not( rs.Column("time_out").DateTimeValue = Nil) Then
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, _
		      rs.Column("time_out").DateTimeValue.ToString( Locale.Current, _
		      DateTime.FormatStyles.None, DateTime.FormatStyles.Short))
		      row.Value("time_out") = cellRenderer
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, _
		      Format(rs.Column("add_subtract").DoubleValue, "-#0.00"))
		      row.Value("add_subtract") = cellRenderer
		      
		      Var diff_seconds As Integer = rs.Column("time_out").DateTimeValue.SecondsFrom1970 - _
		      rs.Column("time_in").DateTimeValue.SecondsFrom1970
		      Var diff_minutes As Integer = diff_seconds / 60
		      
		      Var m As Integer = diff_minutes Mod 60
		      Var h As Integer = (diff_minutes - m) / 60 + rs.Column("add_subtract").DoubleValue
		      
		      
		      Select Case rs.Column("time_in").DateTimeValue.DayOfWeek
		      Case 6, 7
		        
		        s.BackgroundColor = App.Colour_pass
		        
		      Else
		        
		        If h < 9 Then
		          s.BackgroundColor = App.Colour_Fail
		          
		        Else
		          s.BackgroundColor = App.Colour_Pass
		          
		          
		        End If
		        
		      End Select
		      
		      
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, _
		      Format(h, "#0") + ":" + Format(m, "00"))
		      row.Value("work_hrs") = cellRenderer
		      
		      s = New WebStyle
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, _
		      rs.Column("notes").StringValue.ToText)
		      row.Value("notes") = cellRenderer
		      
		    End If
		    '
		    'cellRenderer = New WebListBoxStyleRenderer(s, _
		    'rs.Column("no_of_plans").IntegerValue.ToString)
		    'row.Value("no_of_plans") = cellRenderer
		    
		    
		    rows.Add(row)
		    
		    rs.MoveToNextRow
		  Wend
		  
		  
		  sql = "SELECT SUM( 60 * add_subtract + " _
		  + "CASE " _
		  + "WHEN DAYOFWEEK(time_in) In (6,7) THEN " _
		  + "timestampdiff(minute, time_in, time_out) " _
		  + "ELSE " _
		  + "timestampdiff(minute, time_in, time_out) - 540 " _
		  + "END) AS s " _
		  + "FROM physics_tasking.timelogs " _
		  + "WHERE user_id = " + Session.Logged_in_User.id.ToString + " AND " _
		  + "time_out IS NOT NULL;"
		  
		  
		  rs = Physics_Tasking.DB_SELECT_Statement( sql)
		  '
		  '
		  'Return rs.Column("s").IntegerValue
		  Minutes_Label.Text = "Accumilated time = " + rs.Column("s").IntegerValue.ToString + " min."
		  Return rows
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SortedPrimaryKeys(sortColumns as String) As Integer()
		  // Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UnsortedPrimaryKeys() As Integer()
		  Var keys() As Integer 
		  
		  Var sql As String = "SELECT physics_tasking.timelogs.timelog_id " _
		  + "FROM physics_tasking.timelogs " _
		  + "WHERE user_id = " + Session.Logged_in_User.id.ToString + " " _
		  + "ORDER BY physics_tasking.timelogs.time_in DESC "
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("timelog_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys// Part of the WebDataSource interface.
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Latest_Update As DateTime
	#tag EndProperty


#tag EndWindowCode

#tag Events Add_Button
	#tag Event
		Sub Pressed()
		  Var theDialog As New WebDialog_TimeLog_Add
		  theDialog.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimeLog_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.Single
		  Me.DataSource = Self
		  Me.ReloadData
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoublePressed(row as integer, column as integer)
		  If row > Me.RowCount - 1 Then Return
		  
		  Var theDialog As New WebDialog_TimeLog_Edit
		  theDialog.timelog_id = Me.RowTagAt( row)
		  theDialog.Show
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events REFRESH_Timer
	#tag Event
		Sub Run()
		  
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    TimeLog_ListBox.ReloadData
		    'Users_Label.Text = "Users = " + Users_ListBox.DataSource.RowCount.ToString
		    Latest_UPDATE = App.last_database_update
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Minutes_Label
	#tag Event
		Sub Opening()
		  Me.Style = Session.WEBSTYLE_Label
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
