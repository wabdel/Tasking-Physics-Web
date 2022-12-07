#tag Class
Protected Class PlannersAnnualPointsDataSource
Implements WebDataSource
	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "name" // the name of the field in your database or data source
		  col.Heading = "Staff" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "plans_points" // the name of the field in your database or data source
		  col.Heading = "Plans" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "task_points" // the name of the field in your database or data source
		  col.Heading = "Tasks" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "assigned_task_points" // the name of the field in your database or data source
		  col.Heading = "A. Tasks" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "total_points" // the name of the field in your database or data source
		  col.Heading = "Total" // the name that appears above the column
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
		  
		  Var sql As String = "SELECT COUNT(*) AS c " _
		  + "FROM physics_tasking.points " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "WHERE physics_tasking.users.category_id IN(2,3) " _
		  + "AND physics_tasking.users.is_retired = FALSE " 
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  
		  Var rows() As WebListboxRowData
		  
		  Var sql As String = "SELECT physics_tasking.points.user_id AS user_id, " _
		  + "physics_tasking.users.first_name AS first_name, " _
		  + "physics_tasking.users.family_name AS family_name, " _
		  + "physics_tasking.points.annual_plan_points As annual_plan_points, " _
		  + "physics_tasking.points.annual_scheduled_task_points As annual_scheduled_task_points, " _
		  + "physics_tasking.points.annual_task_points As annual_task_points " _
		  + "FROM physics_tasking.points " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "WHERE physics_tasking.users.category_id IN(2,3) " _
		  + "AND physics_tasking.users.is_retired = FALSE " _
		  + "ORDER BY physics_tasking.users.first_name, physics_tasking.users.family_name"
		  
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("user_id").IntegerValue
		    row.tag = rs.Column("user_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, rs.Column("first_name").StringValue.Trim.Titlecase _
		    + " " + rs.Column("family_name").StringValue.Trim.Uppercase)
		    row.Value("name") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    Format(rs.Column("annual_plan_points").DoubleValue,"0.0"))
		    row.Value("plans_points") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    Format(rs.Column("annual_task_points").DoubleValue,"0.0"))
		    row.Value("task_points") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    Format(rs.Column("annual_scheduled_task_points").DoubleValue,"0.0"))
		    row.Value("assigned_task_points") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    Format( _
		    rs.Column("annual_scheduled_task_points").DoubleValue _
		    + rs.Column("annual_plan_points").DoubleValue _
		    + rs.Column("annual_task_points").DoubleValue ,"0.0"))
		    row.Value("total_points") = cellRenderer
		    
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
		  
		  
		  Var sql As String = "SELECT physics_tasking.points.user_id AS user_id " _
		  + "FROM physics_tasking.points " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "WHERE physics_tasking.users.category_id IN(2,3) " _
		  + "AND physics_tasking.users.is_retired = FALSE " _
		  + "ORDER BY physics_tasking.users.first_name, physics_tasking.users.family_name"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("user_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  
		  Return keys
		End Function
	#tag EndMethod


End Class
#tag EndClass
