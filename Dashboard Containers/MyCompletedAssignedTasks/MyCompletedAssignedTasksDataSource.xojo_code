#tag Class
Protected Class MyCompletedAssignedTasksDataSource
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
		  col.Heading = "Task" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "700"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "machine_name" // the name of the field in your database or data source
		  col.Heading = "Machine" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "150"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "completion_date" // the name of the field in your database or data source
		  col.Heading = "Completion Date" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "undo" // the name of the field in your database or data source
		  col.Heading = "Undo" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  // Part of the WebDataSource interface.
		  
		  // Part of the WebDataSource interface.
		  
		  
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
		  
		  
		  
		  Var d As DateTime = DateTime.Now
		  'Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  Var today As New DateTime(d.Year, d.Month, d.Day)
		  
		  //+ "physics_tasking.users.first_name As first_name, " _
		  //+ "physics_tasking.users.family_name As family_name, " _
		  Var sql As String = "SELECT physics_tasking.scheduled_tasks.scheduled_task_id As scheduled_task_id, " _
		  + "physics_tasking.task_types.name As task_type_name, " _
		  + "physics_tasking.task_groups.name As task_group_name, " _
		  + "physics_tasking.machines.name As machine_name, " _
		  + "DATE(physics_tasking.scheduled_tasks.completion_date) As completion_date " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "INNER JOIN physics_tasking.machines USING(machine_id) " _
		  + "INNER Join physics_tasking.task_groups Using(task_group_id) " _
		  + "INNER Join physics_tasking.users Using(user_id) " _
		  + "WHERE physics_tasking.scheduled_tasks.is_completed = TRUE " _
		  + "AND physics_tasking.scheduled_tasks.user_id = " + Session.Logged_in_User.id.ToString + "  " 
		  
		  
		  
		  If SortColumns = "" Then
		    
		    sql = sql + "ORDER BY completion_date DESC "
		    
		  Else
		    
		    sql = sql + "ORDER BY " + SortColumns
		    
		  End If
		  
		  
		  sql = sql + " LIMIT " + RowCount.ToString + " OFFSET " + RowOffset.ToString
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  Var actionButtons() As GroupButtonItem
		  actionButtons.Add(New GroupButtonItem("undo", "Undo"))
		  
		  While Not rs.AfterLastRow
		    Var s As New WebStyle
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("scheduled_task_id").IntegerValue
		    row.tag = rs.Column("scheduled_task_id").IntegerValue
		    row.Value("task_type") = rs.Column("task_group_name").StringValue.Trim.Uppercase + " / " _
		    + rs.Column("task_type_name").StringValue.Trim
		    
		    row.Value("machine_name") =  rs.Column("machine_name").StringValue.Trim
		    
		    Var temp As DateTime = rs.Column("completion_date").DateValue
		    Var cellRenderer As New WebListBoxStyleRenderer(s, _
		    temp.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    row.Value("completion_date") = cellRenderer
		    
		    row.Value("undo") = New GroupButtonsCellRenderer(actionButtons)
		    
		    rows.Add(row)
		    
		    rs.MoveToNextRow
		  Wend
		  rs.Close
		  
		  Return rows
		  
		  
		  
		  
		  
		  // Part of the WebDataSource interface.
		  
		  
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
