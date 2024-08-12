#tag Class
Protected Class TaskGroupsDataSource
Implements WebDataSource
	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "name" // the name of the field in your database or data source
		  col.Heading = "Task Group" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100%"
		  cols.Add(col)
		  
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  Var sql As String = "SELECT COUNT(*) as c " _
		  + "FROM physics_tasking.task_groups;" 
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  
		  
		  Var rows() As WebListboxRowData
		  
		  Var sql As String = "SELECT physics_tasking.task_groups.task_group_id AS task_group_id, " _
		  + "physics_tasking.task_groups.name AS name " _
		  + "FROM physics_tasking.task_groups " _
		  + "ORDER BY physics_tasking.task_groups.name ASC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  Var s_all As New WebStyle
		  
		  Var row_all As New WebListBoxRowData
		  row_all.PrimaryKey = 0
		  row_all.Tag =  0
		  
		  Var cellRenderer_all As New WebListBoxStyleRenderer(s_all, _
		  "ALL")
		  
		  row_all.Value("name") = cellRenderer_all
		  
		  
		  rows.Add(row_all)
		  
		  
		  
		  While Not rs.AfterLastRow
		    Var s As New WebStyle
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("task_group_id").IntegerValue
		    row.Tag = rs.Column("task_group_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, _
		    rs.Column("name").StringValue.Trim.Uppercase)
		    
		    row.Value("name") = cellRenderer
		    
		    
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
		  
		  Var sql As String = "SELECT physics_tasking.task_groups.task_group_id As task_group_id " _
		  + "FROM physics_tasking.task_groups " _
		  + "ORDER BY physics_tasking.task_groups.name ASC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("task_group_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
	#tag EndViewBehavior
End Class
#tag EndClass
