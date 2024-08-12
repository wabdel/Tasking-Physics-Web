#tag Class
Protected Class Statistics_All_Planners_DataSource_Tasks
Implements WebDataSource
	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "task_group" // the name of the field in your database or data source
		  col.Heading = "Task" // the name that appears above the column
		  col.Sortable = True // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "70"
		  cols.Add(col)
		  
		  Var d As DateTime = DateTime.Now.SubtractInterval(1,0.0)
		  
		  Var sql As String = "SELECT users.user_id, initials FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.users USING(user_id) "_
		  + "WHERE DATE(physics_tasking.tasks.completion_date) >= '"  + d.SQLDate + "' " _
		  + "GROUP BY user_id "  _
		  + "ORDER BY initials"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    col = New WebListboxColumnData
		    col.DatabaseColumnName = rs.Column("initials").StringValue.Trim // the name of the field in your database or data source
		    col.Heading = rs.Column("initials").StringValue.Trim  // the name that appears above the column
		    col.Sortable = True // Whether or not the column is sortable
		    'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		    col.Width = "70"
		    cols.Add(col)
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  // Let get users initials
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(rowCount As Integer, rowOffset As Integer, sortColumns As String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  Var rows() As WebListboxRowData
		  
		  Var d As DateTime = DateTime.Now.SubtractInterval(1,0.0)
		  
		  Var sql_ini As String = "SELECT users.user_id, initials FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.users USING(user_id) "_
		  + "WHERE DATE(physics_tasking.tasks.completion_date) >= '"  + d.SQLDate + "' " _
		  + "GROUP BY user_id "  _
		  + "ORDER BY initials"
		  
		  Var rs_ini As RowSet = Physics_Tasking.SELECT_Statement(sql_ini)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  Var sql As String = "SELECT physics_tasking.task_groups.name AS task_group,  " _
		  + "physics_tasking.task_groups.task_group_id AS task_group_id "
		  
		  
		  While Not rs_ini.AfterLastRow
		    
		    sql = sql + ", SUM(Case WHEN physics_tasking.users.initials = '" + rs_ini.Column("initials").StringValue.Trim.Uppercase + "' THEN " _
		    + "physics_tasking.tasks.multiplier*physics_tasking.task_types.weight " _
		    + "END) AS " + rs_ini.Column("initials").StringValue.Uppercase.Trim
		    
		    
		    rs_ini.MoveToNextRow
		    
		  Wend
		  
		  
		  
		  
		  sql = sql + " FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.users USING(user_id) " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "INNER JOIN physics_tasking.task_groups USING(task_group_id) " _
		  + "WHERE DATE(physics_tasking.tasks.completion_date) >= '"  + d.SQLDate + "' " _
		  + "GROUP BY task_group " 
		  
		  If SortColumns = "" Then
		    
		    sql = sql + "ORDER BY task_group "
		    
		  Else
		    
		    sql = sql + "ORDER BY " + SortColumns
		    
		  End If
		  
		  
		  sql = sql + " LIMIT " + RowCount.ToString + " OFFSET " + RowOffset.ToString
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  
		  
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    s.BackgroundColor = Design_Palette.COLOR_Background
		    s.ForegroundColor = Design_Palette.COLOR_On_Background
		    
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("task_group_id").IntegerValue
		    row.tag = rs.Column("task_group").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, rs.Column("task_group").StringValue.Trim)
		    row.Value("task_group") = cellRenderer
		    
		    rs_ini = Physics_Tasking.SELECT_Statement(sql_ini)
		    For i As Integer = 2 To rs.ColumnCount - 1
		      
		      Var n As String = rs_ini.Column("initials").StringValue.Uppercase.Trim
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, _
		      Format(rs.Column(n).DoubleValue, "#0.0"))
		      row.Value(n) = cellRenderer
		      
		      rs_ini.MoveToNextRow
		    Next
		    
		    
		    
		    
		    
		    
		    
		    rows.Add(row)
		    
		    
		    rs.MoveToNextRow
		  Wend
		  rs.Close
		  
		  Return rows
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
