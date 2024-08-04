#tag WebContainerControl
Begin WebContainer WEBCONTAINER_All_Completed_Plans Implements WebDataSource
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
   Begin WebLabel My_Completed_Plans_Label
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
      TabIndex        =   0
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
   Begin WebListBox My_Completed_Plans_ListBox
      ColumnCount     =   6
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   514
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
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   1200
      _mPanelIndex    =   -1
   End
   Begin WebLabel Note_Label
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
      TabIndex        =   2
      TabStop         =   True
      Text            =   "Completed plans within the past 0 days."
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   542
      Underline       =   False
      Visible         =   True
      Width           =   650
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
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  
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
		  col.Width = "50"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "full_name" // the name of the field in your database or data source
		  col.Heading = "Full Name" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
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
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "completion_date" // the name of the field in your database or data source
		  col.Heading = "Completion Date" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "undo" // the name of the field in your database or data source
		  col.Heading = "Undo" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  Return cols// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  
		  Var sql As String = "SELECT COUNT(*) as c FROM physics_tasking.plans WHERE " _
		  + "physics_tasking.plans.is_completed = 1 AND " _
		  + "completion_date > '" + d_min.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "' " _
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  
		  Var rows() As WebListboxRowData
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id, " _
		  + "physics_tasking.patients.mrn As mrn, " _
		  + "physics_tasking.patients.first_name As first_name, " _
		  + "physics_tasking.patients.family_name As family_name, " _
		  + "physics_tasking.plan_types.name As plan_type_name, " _
		  + "physics_tasking.sites.name As site, " _
		  + "physics_tasking.sites.is_uppercase As is_uppercase, " _
		  + "physics_tasking.plans.completion_date as completion_date " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "WHERE physics_tasking.plans.is_completed = 1 " _
		  + "AND completion_date > '" + d_min.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "' " _
		  + "ORDER BY physics_tasking.plans.completion_date DESC, physics_tasking.patients.mrn ASC;"
		  
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
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
		    
		    Var completion_date As DateTime = rs.Column("completion_date").DateValue
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    completion_date.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    
		    row.Value("completion_date") = cellRenderer
		    
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, "☐")
		    row.Value("undo") = cellRenderer
		    rows.Add(row)
		    
		    rs.MoveToNextRow
		  Wend
		  rs.Close
		  
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
		  // Part of the WebDataSource interface.
		  
		  
		  Var keys() As Integer 
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id " _
		  + "FROM physics_tasking.plans " _
		  + "WHERE physics_tasking.plans.is_completed = 1 " _
		  + "AND completion_date > '" + d_min.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "' " _
		  + "ORDER BY physics_tasking.plans.completion_date DESC"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("plan_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys// Part of the WebDataSource interface.
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Latest_Update As DateTime
	#tag EndProperty


#tag EndWindowCode

#tag Events My_Completed_Plans_Label
	#tag Event
		Sub Opening()
		  Me.Style = Session.WEBSTYLE_Label
		  Me.Text = "Plans = " + Self.RowCount.ToString
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events My_Completed_Plans_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = Self
		  Me.ReloadData
		  Latest_Update = DateTime.Now
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(row As Integer, column As Integer)
		  If row > Me.RowCount - 1 Then Return
		  Select Case column
		  Case 5
		    
		    
		    
		    Try
		      
		      If db.Connect Then
		        
		        Var sql As String = "UPDATE  physics_tasking.plans " _
		        + "SET is_completed = FALSE, " _
		        + "completion_Date = NULL " _
		        + "WHERE plan_id = " + Me.RowTagAt( row)
		        
		        db.ExecuteSQL(sql)
		        
		        App.last_database_update = DateTime.Now
		        Latest_Update = App.last_database_update
		        
		        My_Completed_Plans_ListBox.ReloadData
		        My_Completed_Plans_Label.Text = "Plans = " + My_Completed_Plans_ListBox.DataSource.RowCount.ToString
		        
		      End If
		    End Try
		    
		    
		  End Select
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Note_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Color.White
		  Me.Text = "Completed plans within the past " + Physics_Tasking.Population_period_days.ToString +" days."
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Update_Timer
	#tag Event
		Sub Run()
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    
		    My_Completed_Plans_ListBox.ReloadData
		    Latest_Update = App.last_database_update
		    My_Completed_Plans_Label.Text = "Plans = " + My_Completed_Plans_ListBox.DataSource.RowCount.ToString
		    
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
