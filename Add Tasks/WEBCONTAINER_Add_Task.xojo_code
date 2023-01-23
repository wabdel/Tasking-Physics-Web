#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Add_Task Implements WebDataSource
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   500
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
   Width           =   1300
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel Search_Label
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
      Scope           =   2
      TabIndex        =   0
      Text            =   "Search :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   157
      _mPanelIndex    =   -1
   End
   Begin WebSearchField Tasks_SearchField
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Hint            =   "Search"
      Index           =   -2147483648
      Indicator       =   0
      Left            =   185
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   1
      Text            =   ""
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   309
      _mPanelIndex    =   -1
   End
   Begin WebListBox Tasks_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   True
      Height          =   398
      HighlightSortedColumn=   False
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
      TabIndex        =   2
      Tooltip         =   ""
      Top             =   82
      Visible         =   True
      Width           =   1260
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Style.BackgroundColor = Session.COLOR_Central_Background
		  
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
		  col.Heading = "Task Type" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "1100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "add" // the name of the field in your database or data source
		  col.Heading = "Add" // the name that appears above the column
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
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  
		  Var rows() As WebListboxRowData
		  Var sql As String = "SELECT physics_tasking.task_types.task_type_id As task_type_id, " _
		  + "physics_tasking.task_types.name As name, " _
		  + "physics_tasking.task_groups.name As group_name " _
		  + "FROM physics_tasking.task_types " _
		  + "INNER JOIN physics_tasking.task_groups USING (task_group_id) " 
		  
		  If Not filter.IsEmpty Then
		    
		    sql = sql + "WHERE physics_tasking.task_types.name LIKE '%" + filter + "%' "
		    
		    
		  End If
		  
		  sql = sql + "ORDER BY physics_tasking.task_groups.name, physics_tasking.task_types.name "
		  
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  Var actionButtons() As GroupButtonItem
		  actionButtons.Add(New GroupButtonItem("add", "Add"))
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("task_type_id").IntegerValue
		    row.tag = rs.Column("task_type_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, _
		    rs.Column("group_name").StringValue.Trim.Uppercase + " / " + _
		    rs.Column("name").StringValue.Trim)
		    row.Value("task_type") = cellRenderer
		    
		    
		    'cellRenderer = New WebListBoxStyleRenderer(s, "☐")
		    
		    'cellRenderer = New GroupButtonsCellRenderer(actionButtons)
		    row.Value("add") = New GroupButtonsCellRenderer(actionButtons)
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
		  
		  Var sql As String = "SELECT physics_tasking.task_types.task_type_id As task_type_id, " _
		  + "physics_tasking.task_types.name As name, " _
		  + "physics_tasking.task_groups.name As group_name " _
		  + "FROM physics_tasking.task_types " _
		  + "INNER JOIN physics_tasking.task_groups USING (task_group_id) " 
		  
		  If Not filter.IsEmpty Then
		    
		    sql = sql + "WHERE physics_tasking.task_types.name LIKE '%" + filter + "%' "
		    
		    
		  End If
		  
		  sql = sql + "ORDER BY physics_tasking.task_groups.name, physics_tasking.task_types.name "
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("task_type_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private filter As String
	#tag EndProperty


#tag EndWindowCode

#tag Events Search_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = App.Colour_Title
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Tasks_SearchField
	#tag Event
		Sub TextChanged()
		  filter = Me.Text
		  Tasks_ListBox.ReloadData
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Tasks_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = Self
		  Me.ReloadData
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub CustomCellAction(row as Integer, column as Integer, identifier as string, value as variant)
		  If identifier = "GroupButtonPressed" Then
		    
		    Var theDialog As New Add_Task_WebDialog
		    theDialog.Task_Type_id = Me.RowTagAt( row)
		    theDialog.Show
		    
		  End If
		  
		  'If row > Me.RowCount - 1 Then Return
		  '
		  'Select Case column
		  'Case 1
		  '
		  'Var theDialog As New Add_Task_WebDialog
		  'theDialog.New_Task_Record = New Physics_Tasking.CLASS_Task_Record
		  'theDialog.New_Task_Record.Task_Type_Record.id = Me.RowTagAt( row)
		  'theDialog.Show
		  '
		  'End Select
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
