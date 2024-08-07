#tag Class
Protected Class RecentTasksDataSource
Implements WebDataSource
	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "task_type" // the name of the field in your database or data source
		  col.Heading = "Task (multiplier) {points}" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "550"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "completion_date" // the name of the field in your database or data source
		  col.Heading = "Completed on" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "initials" // the name of the field in your database or data source
		  col.Heading = "By" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "70"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "notes" // the name of the field in your database or data source
		  col.Heading = "Notes" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "350"
		  cols.Add(col)
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  // Part of the WebDataSource interface.
		  
		  // Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  
		  Var sql As String = "SELECT SUM(physics_tasking.tasks.multiplier) as c " _
		  + "FROM physics_tasking.tasks " _
		  + "WHERE physics_tasking.tasks.completion_date >= '" _
		  + DateTime.Now.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "' " _
		  + "ORDER BY physics_tasking.tasks.completion_date DESC"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  
		  
		  Var rows() As WebListboxRowData
		  
		  
		  
		  Var d As DateTime = DateTime.Now
		  'Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  Var today As New DateTime(d.Year, d.Month, d.Day)
		  
		  //+ "physics_tasking.users.first_name As first_name, " _
		  //+ "physics_tasking.users.family_name As family_name, " _
		  Var sql As String = "SELECT physics_tasking.tasks.task_id As task_id, " _
		  + "physics_tasking.task_types.name As task_type_name, " _
		  + "physics_tasking.tasks.multiplier As multiplier, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "physics_tasking.task_types.weight As weight, " _
		  + "DATE(physics_tasking.tasks.completion_date) As completion_date, " _
		  + "physics_tasking.tasks.notes " _
		  + "FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.task_types ON " _
		  + "physics_tasking.tasks.task_type_id = physics_tasking.task_types.task_type_id " _
		  + "INNER JOIN physics_tasking.users ON " _
		  + "physics_tasking.tasks.user_id = physics_tasking.users.user_id " _
		  + "WHERE physics_tasking.tasks.completion_date >= '" _
		  + DateTime.Now.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "' " _
		  + "ORDER BY DATE(physics_tasking.tasks.completion_date) DESC, " _
		  + "physics_tasking.tasks.task_id DESC "
		  
		  sql = sql + " LIMIT " + rowOffset.ToString + ", " + rowCount.ToString
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    Var s As New WebStyle
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("task_id").IntegerValue
		    
		    
		    
		    Var task_date As New DateTime( rs.Column("completion_date").DateTimeValue.Year, _
		    rs.Column("completion_date").DateTimeValue.Month, _
		    rs.Column("completion_date").DateTimeValue.Day)
		    
		    Var No_days As Integer = (today.SecondsFrom1970 - task_date.SecondsFrom1970) / _
		    86400
		    Var decay As Double = Exp(-Log(2) * No_days / Physics_Tasking.Half_life_In_Days)
		    
		    Var Str As String = rs.Column("task_type_name").StringValue + " (" _
		    + rs.Column("multiplier").IntegerValue.ToString + ") {" _
		    + Format(rs.Column("multiplier").IntegerValue * rs.Column("weight").DoubleValue * decay, "0.00") + "}"
		    
		    
		    
		    row.Value("task_type") = rs.Column("task_type_name").StringValue + " (" _
		    + rs.Column("multiplier").IntegerValue.ToString + ") {" _
		    + Format(rs.Column("multiplier").IntegerValue * rs.Column("weight").DoubleValue * decay, "0.00") + "}"
		    
		    Var completion_date As DateTime = rs.Column("completion_date").DateValue
		    Var cellRenderer As New WebListBoxStyleRenderer(s, _
		    completion_date.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    
		    row.Value("completion_date") = cellRenderer
		    
		    row.Value("initials") = rs.Column("initials").StringValue
		    
		    row.Value("notes") = rs.Column("notes").StringValue
		    
		    
		    
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
		  
		  
		  Var keys() As Integer 
		  
		  Var sql As String = "SELECT physics_tasking.tasks.task_id As task_id, " _
		  + "physics_tasking.task_types.name As task_type_name, " _
		  + "physics_tasking.tasks.multiplier As multiplier, " _
		  + "physics_tasking.users.first_name As first_name, " _
		  + "physics_tasking.users.family_name As family_name, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "physics_tasking.task_types.weight As weight, " _
		  + "physics_tasking.tasks.completion_date As completion_date " _
		  + "FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.task_types ON " _
		  + "physics_tasking.tasks.task_type_id = physics_tasking.task_types.task_type_id " _
		  + "INNER JOIN physics_tasking.users ON " _
		  + "physics_tasking.tasks.user_id = physics_tasking.users.user_id " _
		  + "WHERE physics_tasking.tasks.completion_date >= '" _
		  + DateTime.Now.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "' " _
		  + "ORDER BY physics_tasking.tasks.completion_date DESC"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("task_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UnsortedPrimaryKeys() As Integer()
		  // Part of the WebDataSource interface.
		  
		  
		  Var keys() As Integer 
		  
		  Var sql As String = "SELECT physics_tasking.tasks.task_id As task_id " _
		  + "FROM physics_tasking.tasks " _
		  + "WHERE physics_tasking.tasks.completion_date >= '" _
		  + DateTime.Now.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "' " _
		  + "ORDER BY physics_tasking.tasks.completion_date DESC"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("task_id").IntegerValue)
		    
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
